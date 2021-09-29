using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Reflection;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;


public partial class lancamentos : System.Web.UI.Page
{
    #region Meu Métedos
    private void carregaCartao()
    {
        //-----Pegando o código do usuário atrabés da sessão------------------------------------------------
        int codSessao = Convert.ToInt32(Session["codUser"]);
        //--------------------------------------------------------------------------------------------------

        using (var conexao = new BudplannEntities())
        {
            //-----Carrega o dropdownlist de acordo com o usuário logado------------------------------------  
            //var listarTbCartao = conexao.tb_cartao.ToList();
            var listarTbCartao = conexao.tb_cartao.Where(x => x.cd_user == codSessao && x.ds_inativo == "N").ToList();

            ddlCartao.DataSource = listarTbCartao;
            listarTbCartao.Insert(0, new tb_cartao { cd_cartao = 0, nm_cartao = "[Selecione]" });
            ddlCartao.DataValueField = "cd_cartao";
            ddlCartao.DataTextField = "nm_cartao";
            ddlCartao.DataBind();
            //----------------------------------------------------------------------------------------------
        }
    }
    private void carregaParcelas()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);

        using (var conexao = new BudplannEntities())
        {
            var listarTbParcelas = conexao.tb_parcelas.Where(x => x.cd_user == codSessao && x.ds_inativo == "N").ToList();

            ddlParcelas.DataSource = listarTbParcelas;
            ddlParcelas.DataValueField = "cd_parcela";
            ddlParcelas.DataTextField = "nr_parcelas";
            ddlParcelas.DataBind();
        }
    }
    private void carregaSegmento()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);

        using (var conexao = new BudplannEntities())
        {
            var listarTbSegmento = conexao.tb_segmento.Where(x => x.cd_user == codSessao && x.ds_inativo == "N").ToList();

            ddlSegmento.DataSource = listarTbSegmento;
            listarTbSegmento.Insert(0, new tb_segmento { cd_segmento = 0, nm_segmento = "[Selecione]" });
            ddlSegmento.DataValueField = "cd_segmento";
            ddlSegmento.DataTextField = "nm_segmento";
            ddlSegmento.DataBind();
        }
    }
    private void limparFormLancamentoDespesa()
    {
        txtDespesa.Text = String.Empty;
        txtOrigemDespesa.Text = string.Empty;
        txtNotaFical.Text = string.Empty;
        rdDinheiro.Checked = true;
        rdCartao.Checked = false;
        ddlCartao.Enabled = false;
        ddlParcelas.Enabled = false;
        dtLancamento.Value = string.Empty; //---Ex: para limpar o <input> texbox no html5 em vez de usar o asp:text
        ddlCartao.SelectedValue = "0";
        ddlCompetencia.SelectedValue = "0";
        ddlParcelas.SelectedValue = null;
        //ddlParcelas.SelectedValue = "1";
        ddlCompetencia.SelectedValue = "0";
        ddlSegmento.SelectedValue = "0";
        txtValor.Text = string.Empty;
    }
    private void limparDadosModal()
    {
        txtPesquisa1.Value = string.Empty;
        txtPesquisa2.Value = string.Empty;
        ddlFiltroCompetencia.SelectedValue = "0";
    }
    public void logoff()
    {
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1d));
        FormsAuthentication.SignOut();
        Response.Redirect("index.aspx", true);
    }
    private void carregaGridDespesasFiltro()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        var competencia = ddlFiltroCompetencia.SelectedItem.ToString();

        if (txtPesquisa1.Value != string.Empty && txtPesquisa2.Value != string.Empty)
        {
            DateTime data1 = Convert.ToDateTime(txtPesquisa1.Value);
            DateTime data2 = Convert.ToDateTime(txtPesquisa2.Value);

            using (var conexao = new BudplannEntities())
            {
                var listarDespesas = conexao.tb_lancamento_despesas.Where
                (x => x.cd_user == codSessao
                && x.dt_compra >= data1
                && x.dt_compra <= data2
                && x.ds_competencia == competencia).OrderByDescending(x => x.cd_lancamento_despesa).ToList();

                grvDespesas.DataSource = listarDespesas;
                grvDespesas.DataBind();
            }
        }
        else
        {
            using (var conexao = new BudplannEntities())
            {
                var listarDespesas = conexao.tb_lancamento_despesas.Where
                (x => x.cd_user == codSessao
                && x.ds_competencia == competencia).OrderByDescending(x => x.cd_lancamento_despesa).ToList();

                grvDespesas.DataSource = listarDespesas;
                grvDespesas.DataBind();
            }
        }
    }
     private void carregaDepesaSalva()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        using (var conexao = new BudplannEntities())
        {
            var listarDespesas2 = conexao.tb_lancamento_despesas.Where
            (x => x.cd_user == codSessao).OrderByDescending(x => x.cd_lancamento_despesa).ToList().Take(1);

            grvDespesas.DataSource = listarDespesas2.ToList();
            grvDespesas.DataBind();
        }
    }
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        string anoAtual = DateTime.Now.ToString("yyyy");

        //-----habilita o dropdownlist através do radio button-----------------
        if (rdCartao.Checked)
        {
            divAlerta.Visible = false;
            ddlCartao.Enabled = true;
            ddlParcelas.Enabled = true;
        }
        else
        {
            ddlCartao.Enabled = false;
            ddlParcelas.Enabled = false;
        }
        //---------------------------------------------------------------------

        if (!IsPostBack)
        {
            carregaCartao();
            carregaParcelas();
            carregaSegmento();

            //-----atribuições de visualização html--------------------
            divAlerta.Visible = false;
            divGridDespesas.Visible = false;
            divValorSomado.Visible = false;
            txtDataAno.Text = anoAtual;
            //---------------------------------------------------------

            //-----barra superior de status----------------------------
            //var usarioLogado = Session["Usuario"];
            //if (usarioLogado != null)
            //{
            //    labelUsuariologado.Text = usarioLogado.ToString();
            //    statusUsuario.Visible = true;
            //    statusUsuarioDeslogado.Visible = false;
            //}
            //else
            //{
            //    statusUsuario.Visible = false;
            //    statusUsuarioDeslogado.Visible = true;
            //}
            //---------------------------------------------------------
        }

    }
    #endregion

    #region Eventos
    protected void btnHm_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("principal.aspx");
    }
    protected void btnLogoff_Click(object sender, ImageClickEventArgs e)
    {
        logoff();
    }
    protected void btnLimpar_Click(object sender, ImageClickEventArgs e)
    {
        divAlerta.Visible = false;
        divGridDespesas.Visible = false;
        limparFormLancamentoDespesa();
    }
    protected void btnSalvar_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var addLancamentoDespesas = new tb_lancamento_despesas();
                var addNotificacao = new tb_notificacoes();

                addLancamentoDespesas.cd_user = Convert.ToInt32(codUsuario);
                if (txtDespesa.Text == string.Empty)
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "O seu manezão. Precisa informar a descrição da despesa.";
                    return;
                }
                else
                {
                    addLancamentoDespesas.nm_lancamento_despesa = txtDespesa.Text;
                }
                addLancamentoDespesas.ds_origem_despesa = txtOrigemDespesa.Text;
                addLancamentoDespesas.ds_nota_fiscal = txtNotaFical.Text;
                if (rdCartao.Checked)
                {
                    if (ddlCartao.SelectedValue != "0")
                    {
                        addLancamentoDespesas.cd_cartao = Convert.ToInt32(ddlCartao.SelectedValue);
                    }
                    else
                    {
                        divAlerta.Visible = true;
                        labelAlerta.Text = "O seu manezão. Precisa escolher um cartão.";
                        return;
                    }
                    addLancamentoDespesas.cd_parcela = Convert.ToInt32(ddlParcelas.SelectedValue);
                    addLancamentoDespesas.ds_forma_pagamento = "CARTAO";
                }
                else
                {
                    addLancamentoDespesas.cd_cartao = null;
                    addLancamentoDespesas.cd_parcela = null;
                    addLancamentoDespesas.ds_forma_pagamento = "DINHEIRO";
                }

                if (dtLancamento.Value == string.Empty)
                {
                    addLancamentoDespesas.dt_compra = null;
                }
                else
                {
                    addLancamentoDespesas.dt_compra = Convert.ToDateTime(dtLancamento.Value);
                }
                if (ddlCompetencia.SelectedValue == "0")
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "O seu manezão. Sem informar a competência fica difícil.";
                    return;
                }
                else
                {
                    addLancamentoDespesas.ds_competencia = ddlCompetencia.SelectedItem.ToString();
                }
                if (ddlSegmento.SelectedValue == "0")
                {
                    addLancamentoDespesas.cd_segmento = null;
                }
                else
                {
                    addLancamentoDespesas.cd_segmento = Convert.ToInt32(ddlSegmento.SelectedValue);
                }
                if (txtValor.Text != string.Empty)
                {
                    addLancamentoDespesas.ds_valor = Convert.ToDecimal(txtValor.Text);
                }
                else
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "O seu manezão. Como tu quer lançar uma despesa sem informar um VALOR?";
                    return;
                }

                if (ddlNotificacao.SelectedValue == "1")
                {
                    addNotificacao.nm_notificacao = txtDespesa.Text;
                    addNotificacao.dt_notificacao = Convert.ToDateTime(dtLancamento.Value);
                    addNotificacao.cd_user = Convert.ToInt32(codUsuario);
                    conexao.tb_notificacoes.Add(addNotificacao);
                    conexao.SaveChanges();
                }

                conexao.tb_lancamento_despesas.Add(addLancamentoDespesas);
                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Despesa lançada com sucesso!";
            limparFormLancamentoDespesa();
            divGridDespesas.Visible = true;
            carregaDepesaSalva();
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparFormLancamentoDespesa();
            return;
        }
    }
    protected void grvDespesas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codLancamento = Convert.ToInt32(e.Values["cd_lancamento_despesa"]);
        using (var conexao = new BudplannEntities())
        {
            var excluirDespesa = conexao.tb_lancamento_despesas.Single(x => x.cd_lancamento_despesa == codLancamento);
            conexao.tb_lancamento_despesas.Remove(excluirDespesa);
            conexao.SaveChanges();
        }
        carregaGridDespesasFiltro();
    }
    protected void grvDespesas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvDespesas.PageIndex = e.NewPageIndex;
        carregaGridDespesasFiltro();
        divAlerta.Visible = false;
    }
    protected void btnFecharDespesas_Click(object sender, EventArgs e)
    {
        divGridDespesas.Visible = false;
        divAlerta.Visible = false;
    }
    #endregion
    protected void btnRealizarPesquisa_Click(object sender, EventArgs e)
    {
        var codSessao = Session["codUser"];

        if (codSessao != null)
        {
            if (txtPesquisa1.Value != string.Empty && txtPesquisa2.Value != string.Empty)
            {
                    divValorSomado.Visible = false;
                    divAlerta.Visible = false;
                    divGridDespesas.Visible = true;
                    carregaGridDespesasFiltro();
            }
            else
            {
                if (ddlFiltroCompetencia.SelectedValue != "0")
                {
                    carregaGridDespesasFiltro();
                    divValorSomado.Visible = false;
                    divAlerta.Visible = false;
                    divGridDespesas.Visible = true; 
                }
                else
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Manezão. Para pesquisar, tem que informar a competência.";
                    return;
                }
            }
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            return;
        }      
    }
    protected void btnFecharModal_Click(object sender, EventArgs e)
    {
        limparDadosModal();
        divAlerta.Visible = false;
    }
    protected void btnCalcular_Click(object sender, EventArgs e)
    {
        divValorSomado.Visible = true;
        //---Codigo para calcular o valor de um campo dentro do gridview--------------------------------------
        decimal valorTotal = 0;
        foreach (GridViewRow row in grvDespesas.Rows)
        {
            if (row.RowType != DataControlRowType.Header && row.RowType != DataControlRowType.Footer)
            {
                if (row.Cells[9].Text != null && row.Cells[9].Text != string.Empty)
                {
                    valorTotal += Convert.ToDecimal(row.Cells[9].Text);
                }
            }
        }
        lblSomaValor.Text = "Valor Total: " + valorTotal.ToString("C2");
        //----------------------------------------------------------------------------------------------------
        lblSomaValor.Enabled = false;
        btnFecharDespesas.Focus();
    }
    protected void btnImprimir_Click(object sender, EventArgs e)
    {
        int rowCount = grvDespesas.Rows.Count;

        if (rowCount != 0)
        {
            txtValor.Enabled = true;
            divValorSomado.Visible = true;

            Document pdfDocumento = new Document(PageSize.A4, 1f, 0, 20f, 10f);
            pdfDocumento.SetMargins(10, 10, 20, 20);
            PdfWriter.GetInstance(pdfDocumento, Response.OutputStream);

            PdfPTable pdfTable = new PdfPTable(grvDespesas.HeaderRow.Cells.Count);
            //--Para definir o tamanho da tabela em porcentage ------------------------------------
            pdfTable.WidthPercentage = 95F;
            //-------------------------------------------------------------------------------------
            pdfTable.DefaultCell.Border = Rectangle.NO_BORDER;
            iTextSharp.text.Font fontTableRow = FontFactory.GetFont("myspecial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 10, iTextSharp.text.Font.NORMAL, BaseColor.BLUE);
            //---Para definir os tamanhos de cada célula da tabela -------------------------------
            float[] widths = new float[] { 0f, 9f, 8f, 3f, 0f, 3f, 4f, 3f, 0f, 3f, 0f, 0f };
            pdfTable.SetWidths(widths);
            //------------------------------------------------------------------------------------

            foreach (TableCell headerCell in grvDespesas.HeaderRow.Cells)
            {
                PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text));
                pdfCell.HorizontalAlignment = Element.ALIGN_CENTER;
                pdfTable.AddCell(pdfCell);
            }

            foreach (GridViewRow gridViewRow in grvDespesas.Rows)
            {
                foreach (TableCell tableCell in gridViewRow.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text.Replace("&nbsp;", ""), fontTableRow));
                    pdfTable.AddCell(pdfCell); ;
                }
            }

            Paragraph titulo = new Paragraph();
            titulo.Font = new Font(Font.FontFamily.COURIER, 20);
            titulo.Alignment = Element.ALIGN_CENTER;
            titulo.Add("Relatório de Despesas\n\n");

            Paragraph valor = new Paragraph();
            valor.Font = new Font(Font.FontFamily.COURIER, 16);
            var valorTotal = lblSomaValor.Text;
            valor.Add("\nValor Total:" + " " + valorTotal + "\n\n");
            valor.Alignment = Element.ALIGN_RIGHT;

            pdfDocumento.Open();
            pdfDocumento.Add(titulo);
            pdfDocumento.Add(pdfTable);
            pdfDocumento.Add(valor);
            pdfDocumento.Close();

            string attachment = "attachment; filename=RelatorioDespesas.pdf";
            Response.AddHeader("content-disposition", attachment);
            Response.AppendHeader("content-diposition", "attachment;filename=Employess.pdf");
            Response.ContentType = "application/pdf";
            Response.Write(pdfDocumento);
            Response.Flush();
            Response.End();
        }
        else
        {
            labelAlerta.Text = "Não foi possível imprimir suas despesas. Motivo: Não existe lançamento para este período.";
            divAlerta.Visible = true;
            divGridDespesas.Visible = false;
            return; 
        }

        //Document doc = new Document(PageSize.A4);
        //doc.SetMargins(40, 40, 40, 80);
        //doc.AddCreationDate();
        //string caminho = AppDomain.CurrentDomain.BaseDirectory + @"\pdf\" + "relatorio.pdf";

        //PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(caminho, FileMode.Create));

        //doc.Open();

        //Paragraph titulo = new Paragraph();
        //titulo.Font = new Font(Font.FontFamily.COURIER, 40);
        //titulo.Alignment = Element.ALIGN_CENTER;
        //titulo.Add("Relatório de Despesas\n\n");
        //doc.Add(titulo);

        //Paragraph paragrafo = new Paragraph("", new Font(Font.NORMAL, 12));
        //string conteudo = "Texto aqui.\n\n";
        //paragrafo.Add(conteudo);
        //doc.Add(paragrafo);

        //doc.Close();
        //System.Diagnostics.Process.Start(caminho);

    }

    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    return;
    //}


    // COLOCAR OS DROPDOW para listar por ordem
    //CARREGAR OS GRIDS apos o cadastro
    //auto focus nas despesas

}
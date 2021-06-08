using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;


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
            var listarTbCartao = conexao.tb_cartao.Where(x => x.cd_user == codSessao).ToList();

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
            var listarTbParcelas = conexao.tb_parcelas.Where(x => x.cd_user == codSessao).ToList();

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
            var listarTbSegmento = conexao.tb_segmento.Where(x => x.cd_user == codSessao).ToList();

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
        ddlParcelas.SelectedValue = "1";
        ddlCompetencia.SelectedValue = "0";
        ddlSegmento.SelectedValue = "0";
    }
    public void logoff()
    {
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1d));
        FormsAuthentication.SignOut();
        Response.Redirect("index.aspx", true);
    }
    private void carregaGridDespesas()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);

        using (var conexao = new BudplannEntities())
        {
            var listarTbDespesas = conexao.tb_lancamento_despesas.Where(x => x.cd_user == codSessao).ToList();
            grvDespesas.DataSource = listarTbDespesas.ToList();
            grvDespesas.DataBind();
        }
    }
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        //-----habilita o dropdownlist através do radio button-----------------
        if (rdCartao.Checked)
        {
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
            //---------------------------------------------------------

            //-----barra superior de status----------------------------
            var usarioLogado = Session["Usuario"];
            if (usarioLogado != null)
            {
                labelUsuariologado.Text = usarioLogado.ToString();
                statusUsuario.Visible = true;
                statusUsuarioDeslogado.Visible = false;
            }
            else
            {
                statusUsuario.Visible = false;
                statusUsuarioDeslogado.Visible = true;
            }
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
                addLancamentoDespesas.cd_user = Convert.ToInt32(codUsuario);
                addLancamentoDespesas.nm_lancamento_despesa = txtDespesa.Text;
                addLancamentoDespesas.ds_origem_despesa = txtOrigemDespesa.Text;
                addLancamentoDespesas.ds_nota_fiscal = txtNotaFical.Text;
                if (rdCartao.Checked)
                {
                    addLancamentoDespesas.cd_cartao = Convert.ToInt32(ddlCartao.SelectedValue);
                }
                else
                {
                    addLancamentoDespesas.cd_cartao = null;
                }
                if (rdCartao.Checked)
                {
                    addLancamentoDespesas.cd_parcela = Convert.ToInt32(ddlParcelas.SelectedValue);
                }
                else
                {
                    addLancamentoDespesas.cd_parcela = null;
                }

                if (rdCartao.Checked)
                {
                    addLancamentoDespesas.ds_forma_pagamento = "Cartão";
                }
                else
                {
                    addLancamentoDespesas.ds_forma_pagamento = "Dinheiro";
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
                    addLancamentoDespesas.ds_competencia = null;
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

                conexao.tb_lancamento_despesas.Add(addLancamentoDespesas);
                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Ae fica sussa que seu lançamento foi registrado.";
            limparFormLancamentoDespesa();
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "Timeout. Sem chance você foi desconectado! Conecte novamente para realizar o cadastro";
            limparFormLancamentoDespesa();
            return;
        }


    }
    #endregion
    protected void grvDespesas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codDespesa = Convert.ToInt32(e.Values["cd_lancamento_despesa"]);

        using (var conexao = new BudplannEntities())
        {
            var excluirDespesa = conexao.tb_lancamento_despesas.Single(x => x.cd_lancamento_despesa == codDespesa);
            conexao.tb_lancamento_despesas.Remove(excluirDespesa);
            conexao.SaveChanges();
        }
        carregaGridDespesas();
    }
    protected void grvDespesas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvDespesas.PageIndex = e.NewPageIndex;
        carregaGridDespesas();
        divAlerta.Visible = false;
    }
    protected void btnPesquisarDespesas_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];
        if (codUsuario != null)
        {
            divGridDespesas.Visible = true;
            carregaGridDespesas();
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "Timeout. Sua sessão foi expirada, favor conectar novamente.";
            limparFormLancamentoDespesa();
            return;
        }
    }
}
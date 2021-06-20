using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

public partial class PgEdicaoDados : System.Web.UI.Page
{
    #region MétodosSegmentos
    private void limparForm()
    {
        txtRamoSegmento.Text = string.Empty;
    }
    private void carregaCamposSegmento()
    {
        var codTela = Convert.ToInt32(Request["codSegmento"]);

        using (var conexao = new BudplannEntities())
        {
            var verifica = conexao.tb_segmento.ToList();
            var dadosEdicao = conexao.tb_segmento.Single(x => x.cd_segmento == codTela);

            if (verifica.Exists(x => x.cd_segmento.Equals(codTela) && x.ds_inativo == "S"))
            {
                txtRamoSegmentoInativo.Enabled = false;
                divAtivarSegmentos.Visible = true;
                txtRamoSegmentoInativo.Visible = true;
                txtRamoSegmentoInativo.Text = dadosEdicao.nm_segmento.ToString();
            }
            else
            {
                divInativarSegmentos.Visible = true;
                txtRamoSegmento.Visible = true;
                txtRamoSegmento.Text = dadosEdicao.nm_segmento.ToString();
            }            
        }

    }
    #endregion

    #region MétodosCartao
    private void limparFormCartao()
    {
        txtNomeCartao.Text = string.Empty;
        dtValidade.Text = string.Empty;
        ddlTipoCartao.SelectedValue = "0";
    }
    private void carregaCamposCartao()
    {
        var codTela = Convert.ToInt32(Request["codCartao"]);
        
        using (var conexao = new BudplannEntities())
        {
            var dadosEdicao = conexao.tb_cartao.Single(x => x.cd_cartao == codTela);
            var verifica = conexao.tb_cartao.ToList();

            if (verifica.Exists(x => x.cd_cartao.Equals(codTela) && x.ds_inativo == "S"))
            {
                divAtivarCartao.Visible = true;
                txtNomeCartaoInativo.Visible = true;
                txtNomeCartaoInativo.Text = dadosEdicao.nm_cartao.ToString();
                ddlTipoCartao.SelectedItem.Text = dadosEdicao.ds_tipo;
                dtValidade.Text = dadosEdicao.dt_validade.Value.ToString("dd/MM/yyyy");
                ddlTipoCartao.Enabled = false;
                dtValidade.Enabled = false;
                txtNomeCartaoInativo.Enabled = false;
            }
            else
            {
                divInativarCartao.Visible = true;
                txtNomeCartao.Visible = true;
                txtNomeCartao.Text = dadosEdicao.nm_cartao.ToString();
                ddlTipoCartao.SelectedItem.Text = dadosEdicao.ds_tipo;
                dtValidade.Text = dadosEdicao.dt_validade.Value.ToString("dd/MM/yyyy");
            }                   
        }
    }
    #endregion

    #region MétodosParcela

    private void limparFormParcela()
    {
        txtParcelas.Text = string.Empty;
        txtParcelasInativa.Text = string.Empty;
    }
    private void carregaCamposParcela()
    {
        var codTela = Convert.ToInt32(Request["codParcela"]);

        using (var conexao = new BudplannEntities())
        {
            var verifica = conexao.tb_parcelas.ToList();
            var dadosEdicao = conexao.tb_parcelas.Single(x => x.cd_parcela == codTela);

            if (verifica.Exists(x => x.cd_parcela.Equals(codTela) && x.ds_inativo == "S"))
            {
                divAtivarParcela.Visible = true;
                txtParcelasInativa.Visible = true;
                txtParcelasInativa.Text = dadosEdicao.nr_parcelas.ToString();
                txtParcelasInativa.Enabled = false;
            }
            else
            {
                divInativarParcela.Visible = true;
                txtParcelas.Visible = true;
                txtParcelas.Text = dadosEdicao.nr_parcelas.ToString();
            }
        }
    }

    #endregion

    #region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        int codTelaCartao = Convert.ToInt32(Request["codCartao"]);
        int codTelaSegmento = Convert.ToInt32(Request["codSegmento"]);
        int codTelaParcela = Convert.ToInt32(Request["codParcela"]);

        if (!IsPostBack)
        {
            //-----atribuições de visualização html--------------------
            divAlerta.Visible = false;
            divAtivarSegmentos.Visible = false;
            divInativarSegmentos.Visible = false;
            divCollapseSegmento.Visible = false;
            divCollapseCartao.Visible = false;
            divInativarCartao.Visible = false;
            divAtivarCartao.Visible = false;
            txtNomeCartao.Visible = false;
            txtNomeCartaoInativo.Visible = false;
            txtRamoSegmentoInativo.Visible = false;
            txtRamoSegmento.Visible = false;
            divCollapseParcela.Visible = false;
            divInativarParcela.Visible = false;
            divAtivarParcela.Visible = false;
            txtParcelas.Visible = false;
            txtParcelasInativa.Visible = false;
            //---------------------------------------------------------
            //---Condição para visibilidade de qual collapse irá apresentar na tela, atavés do códgio do GridView------------------
            if (codTelaCartao != 0)
            {
                divCollapseCartao.Visible = true;
                carregaCamposCartao();
            }
            else if (codTelaSegmento != 0)
            {
                divCollapseSegmento.Visible = true;
                carregaCamposSegmento();
            }
            else if (codTelaParcela != 0)
            {
                divCollapseParcela.Visible = true;
                carregaCamposParcela();
            }
            //---------------------------------------------------------------------------------------------------------------------


        }
    }
    #endregion

    #region EventosSegmentos
    protected void btnSalvarSegmentos_Click(object sender, ImageClickEventArgs e)
    {
        var codTela = Convert.ToInt32(Request["codSegmento"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
           using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                if (verifica.Exists(x => x.cd_segmento.Equals(codTela)))
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Não é possível editar o segmento, pois, o segmento escolhido já possui vinculo nas despesas." + "</br>" + "Caso queira, clique no botão OLHO para ativar/inativar o segemento.";
                    return;
                }
                else
                {
                    var editarSegmento = conexao.tb_segmento.Single(x => x.cd_segmento == codTela);

                    editarSegmento.cd_segmento = codTela;
                    editarSegmento.cd_user = Convert.ToInt32(codUsuario);
                    editarSegmento.nm_segmento = txtRamoSegmento.Text;

                    conexao.SaveChanges();
                    Response.Redirect("cadastro_segmentos.aspx");  
                }
            }
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_segementos.aspx");  
        }

    }
    protected void btnInativarSegmentos_Click(object sender, ImageClickEventArgs e)
    {
        var codTela = Convert.ToInt32(Request["codSegmento"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                    var editarSegmento = conexao.tb_segmento.Single(x => x.cd_segmento == codTela);

                    editarSegmento.cd_segmento = codTela;
                    editarSegmento.cd_user = Convert.ToInt32(codUsuario);
                    editarSegmento.nm_segmento = txtRamoSegmento.Text;
                    editarSegmento.ds_inativo = "S";

                    conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Segmento Inativado Com Sucesso";
            Response.Redirect("cadastro_segmentos.aspx");  
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_segementos.aspx");
        }

    }
    protected void btnAtivarSegmentos_Click(object sender, ImageClickEventArgs e)
    {
        var codTela = Convert.ToInt32(Request["codSegmento"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();
                var editarSegmento = conexao.tb_segmento.Single(x => x.cd_segmento == codTela);

                if (editarSegmento.ds_inativo == "S")
                {
                    editarSegmento.nm_segmento = txtRamoSegmentoInativo.Text;
                }
                else
                {
                    editarSegmento.nm_segmento = txtRamoSegmento.Text;
                }
                editarSegmento.cd_segmento = codTela;
                editarSegmento.cd_user = Convert.ToInt32(codUsuario);
                editarSegmento.ds_inativo = "N";

                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Segmento Ativado Com Sucesso";
            Response.Redirect("cadastro_segmentos.aspx");
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_segementos.aspx");
        }
    }
    #endregion

    #region EventosCartao
    protected void btnSalvarCartao_Click(object sender, ImageClickEventArgs e)
    {
        int codTelaCartao = Convert.ToInt32(Request["codCartao"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                if (verifica.Exists(x => x.cd_cartao.Equals(codTelaCartao)))
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Não é possível editar o cartão, pois, o cartão escolhido já possui vinculo nas despesas." + "</br>" + "Caso queira, clique no botão OLHO para ativar/inativar o cartão.";
                    return;
                }
                else
                {
                    var editarCartao = conexao.tb_cartao.Single(x => x.cd_cartao == codTelaCartao);

                    editarCartao.cd_cartao = codTelaCartao;
                    editarCartao.cd_user = Convert.ToInt32(codUsuario);
                    if (editarCartao.ds_inativo == "S")
                    {
                        editarCartao.nm_cartao = txtNomeCartaoInativo.Text;
                    }
                    else
                    {
                        editarCartao.nm_cartao = txtNomeCartao.Text;
                    }
                    editarCartao.ds_tipo = ddlTipoCartao.SelectedItem.ToString();
                    if (dtValidade.Text != string.Empty)
                    {
                        editarCartao.dt_validade = Convert.ToDateTime(dtValidade.Text);
                    }
                    else
                    {
                        divAlerta.Visible = true;
                        labelAlerta.Text = "Oh Mané, informe a data de validade do cartão.";
                        return;
                    }

                    conexao.SaveChanges();
                    Response.Redirect("cadastro_cartao.aspx");  
                }
            }
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparFormCartao();
            Response.Redirect("cadastro_cartao.aspx");  
        }
    }
    protected void btnInativarCartao_Click(object sender, ImageClickEventArgs e)
    {
        var codTela = Convert.ToInt32(Request["codCartao"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                var editarCartao = conexao.tb_cartao.Single(x => x.cd_cartao == codTela);

                editarCartao.cd_cartao = codTela;
                editarCartao.cd_user = Convert.ToInt32(codUsuario);
                editarCartao.nm_cartao = txtNomeCartao.Text;
                editarCartao.ds_tipo = ddlTipoCartao.SelectedItem.ToString();
                if (dtValidade.Text != string.Empty)
                {
                    editarCartao.dt_validade = Convert.ToDateTime(dtValidade.Text);
                }
                else
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Oh Mané, informe a data de validade do cartão.";
                    return;
                }
                editarCartao.ds_inativo = "S"; 

                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Seu cartão foi inativado com Sucesso";
            Response.Redirect("cadastro_cartao.aspx");
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_cartao.aspx");
        }
    }
    protected void btnAtivarCartao_Click(object sender, ImageClickEventArgs e)
    {
        var codTela = Convert.ToInt32(Request["codCartao"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                var editarCartao = conexao.tb_cartao.Single(x => x.cd_cartao == codTela);

                editarCartao.cd_cartao = codTela;
                editarCartao.cd_user = Convert.ToInt32(codUsuario);
                editarCartao.nm_cartao = txtNomeCartaoInativo.Text;
                editarCartao.ds_tipo = ddlTipoCartao.SelectedItem.ToString();
                if (dtValidade.Text != string.Empty)
                {
                    editarCartao.dt_validade = Convert.ToDateTime(dtValidade.Text);
                }
                else
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Oh Mané, informe a data de validade do cartão.";
                    return;
                }
                editarCartao.ds_inativo = "N";
                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Cartão ativado com sucesso";
            Response.Redirect("cadastro_cartao.aspx");
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_cartao.aspx");
        }
    }
    #endregion

    #region EventosParcelas
    protected void btnAtivarParcela_Click(object sender, ImageClickEventArgs e)
    {
        var codTelaParcela = Convert.ToInt32(Request["codParcela"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                var editarParcela = conexao.tb_parcelas.Single(x => x.cd_parcela == codTelaParcela);

                editarParcela.cd_parcela = codTelaParcela;
                editarParcela.cd_user = Convert.ToInt32(codUsuario);

                if (editarParcela.ds_inativo == "S")
                {
                    editarParcela.nr_parcelas = Convert.ToInt32(txtParcelasInativa.Text);
                }
                else
                {
                    editarParcela.nr_parcelas = Convert.ToInt32(txtParcelas.Text);
                }                
                editarParcela.ds_inativo = "N";

                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Parcela ativada com sucesso";
            Response.Redirect("cadastro_parcelas.aspx");
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_parcelas.aspx");
        }
    }
    protected void btnInativarParcela_Click(object sender, ImageClickEventArgs e)
    {
        var codTelaParcela = Convert.ToInt32(Request["codParcela"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();
                var editarParcela = conexao.tb_parcelas.Single(x => x.cd_parcela == codTelaParcela);

                editarParcela.cd_parcela = codTelaParcela;
                editarParcela.cd_user = Convert.ToInt32(codUsuario);
                editarParcela.nr_parcelas = Convert.ToInt32(txtParcelas.Text);
                editarParcela.ds_inativo = "S";

                conexao.SaveChanges();
            }
            divAlerta.Visible = true;
            labelAlerta.Text = "Sua parcela foi inativada com Sucesso";
            Response.Redirect("cadastro_parcelas.aspx");
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            Response.Redirect("cadastro_parcelas.aspx");
        }
    }
    protected void btnSalvarParcela_Click(object sender, ImageClickEventArgs e)
    {
        int codTelaParcela = Convert.ToInt32(Request["codParcela"]);
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var verifica = conexao.tb_lancamento_despesas.ToList();

                if (verifica.Exists(x => x.cd_parcela.Equals(codTelaParcela)))
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Não é possível editar a parcela, pois, o parcela escolhida já possui vinculo nas despesas." + "</br>" + "Caso queira, clique no botão OLHO para ativar/inativar a parcela.";
                    return;
                }
                else
                {
                    var editarParcela = conexao.tb_parcelas.Single(x => x.cd_parcela == codTelaParcela);

                    editarParcela.cd_parcela = codTelaParcela;
                    editarParcela.cd_user = Convert.ToInt32(codUsuario);
                    if (editarParcela.ds_inativo == "S")
                    {
                        editarParcela.nr_parcelas = Convert.ToInt32(txtParcelasInativa.Text);
                        editarParcela.ds_inativo = "S";
                    }
                    else
                    {
                        editarParcela.nr_parcelas = Convert.ToInt32(txtParcelas.Text);
                        editarParcela.ds_inativo = "N";
                    }

                    conexao.SaveChanges();
                    Response.Redirect("cadastro_parcelas.aspx");
                }
            }
        }
        else
        {
            divAlerta.Visible = true;
            limparFormParcela();
            Response.Redirect("cadastro_parcelas.aspx");
        }
    }
    #endregion
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

public partial class cadastros : System.Web.UI.Page
{
    #region Meus Métodos
    private void limparForm()
    {
        txtNomeCartao.Text = string.Empty;
        ddlTipoCartao.SelectedValue = "0";
        dtValidade.Value = string.Empty;
    }
    private void limparFormSegmento()
    {
        txtRamoSegmento.Text = string.Empty;
    }
    private void limparFormParcelas()
    {
        txtParcelas.Text = string.Empty;
    }
    public void logoff()
    {
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1d));
        FormsAuthentication.SignOut();
        Response.Redirect("index.aspx", true);
    }
    private void carregaGridCartao()
    {
        var codSessao = Session["codUser"];

        using (var conexao = new BudplannEntities())
        {
            var vCodSessao = Convert.ToInt32(codSessao);
            var listarTbCartao = conexao.tb_cartao.Where(x => x.cd_user == vCodSessao).ToList();
            grvCartao.DataSource = listarTbCartao.ToList();
            grvCartao.DataBind();
        }
    }
    private void carregaGridSegmento()
    {
        var codSessao = Session["codUser"];

        using (var conexao = new BudplannEntities())
        {
            var vCodSessao = Convert.ToInt32(codSessao);
            var listarTbSegmento = conexao.tb_segmento.Where(x => x.cd_user == vCodSessao).ToList();
            grvSegmento.DataSource = listarTbSegmento.ToList();
            grvSegmento.DataBind();
        }
    }
    private void carregaGridParcelas()
    {
        var codSessao = Session["codUser"];

        using (var conexao = new BudplannEntities())
        {
            var vCodSessao = Convert.ToInt32(codSessao);
            var listarTbParcelas = conexao.tb_parcelas.Where(x => x.cd_user == vCodSessao).ToList();
            grvParcelas.DataSource = listarTbParcelas.ToList();
            grvParcelas.DataBind();
        }
    }
    private void detalharDadosCartaoParaEdicao()
    {
        using (var conexao = new BudplannEntities())
        {
            var codCartao = Convert.ToInt32(Request["codCartao"]);
            var cartaoEditado = conexao.tb_cartao.Single(x => x.cd_cartao == codCartao);
        }
    }
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //-----atribuições de visualização html--------------------
            divAlertaCadastroSucesso.Visible = false;
            divGridCartao.Visible = false;
            divGridSegmento.Visible = false;
            divGridParcelas.Visible = false;
            //---------------------------------------------------------

            var usarioLogado = Session["Usuario"];

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
        }
    }
    #endregion

    #region Meus Eventos
    protected void Page_PreInit(object sender, EventArgs e)
    {

    }
    protected void btnSalvar_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var addNovoCartao = new tb_cartao();

                addNovoCartao.nm_cartao = txtNomeCartao.Text;
                if (ddlTipoCartao.SelectedValue == "0")
                {
                    addNovoCartao.ds_tipo = null;
                }
                else
                {
                    addNovoCartao.ds_tipo = ddlTipoCartao.SelectedItem.ToString();
                }
                if (dtValidade.Value == null || dtValidade.Value == string.Empty)
                {
                    addNovoCartao.dt_validade = null;
                }
                else
                {
                    addNovoCartao.dt_validade = Convert.ToDateTime(dtValidade.Value);
                }
                addNovoCartao.cd_user = Convert.ToInt32(codUsuario.ToString());
                conexao.tb_cartao.Add(addNovoCartao);
                conexao.SaveChanges();
            }
            limparForm();
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Ae fica sussa, seu cartão foi cadastrado!";
            //Response.Write("<script>alert('Ramo Cadastrado Com Sucesso');window.location='cadastros.aspx'</script>");
        }
        else
        {
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Timeout. Sem chance você foi desconectado! Conecte para realizar o cadastro";
            limparForm();
            return;
        }

    }
    protected void btnLimpar_Click(object sender, ImageClickEventArgs e)
    {
        limparForm();
    }
    protected void btnConsultar_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];
        if (codUsuario != null)
        {
            divGridCartao.Visible = true;
            carregaGridCartao();
        }
        else
        {
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Timeout. Sua sessão foi expirada, favor conectar novamente.";
            limparFormSegmento();
            return;
        }

    }
    protected void btnHm_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("principal.aspx");
    }
    protected void btnLogoff_Click(object sender, ImageClickEventArgs e)
    {
        logoff();
    }
    protected void grvCartao_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codCartao = Convert.ToInt32(e.Values["cd_cartao"]);

        using (var conexao = new BudplannEntities())
        {
            var cartaoExcluido = conexao.tb_cartao.Single(x => x.cd_cartao == codCartao);
            conexao.tb_cartao.Remove(cartaoExcluido);
            conexao.SaveChanges();
        }
        carregaGridCartao();
    }
    protected void grvCartao_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvCartao.PageIndex = e.NewPageIndex;
        carregaGridCartao();
        divAlertaCadastroSucesso.Visible = false;
    }
    protected void btnFecharGridCartao_Click(object sender, EventArgs e)
    {
        divGridCartao.Visible = false;
        divAlertaCadastroSucesso.Visible = false;
    }
    protected void btnSalvarSegmentos_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexeao = new BudplannEntities())
            {
                var addNovoSegmento = new tb_segmento();


                addNovoSegmento.cd_user = Convert.ToInt32(codUsuario);
                addNovoSegmento.nm_segmento = txtRamoSegmento.Text;

                conexeao.tb_segmento.Add(addNovoSegmento);
                conexeao.SaveChanges();
            }
            limparFormSegmento();
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Cadastro de segmento realizado com sucesso!";
        }
        else
        {
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Timeout. Sua sessão foi expirada, favor conectar novamente.";
            limparFormSegmento();
            return;
        }

    }
    protected void btnLimparSegmento_Click(object sender, ImageClickEventArgs e)
    {
        limparFormSegmento();
    }
    protected void grvSegmento_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codSegmento = Convert.ToInt32(e.Values["cd_segmento"]);

        using (var conexao = new BudplannEntities())
        {
            var segmentoExcluido = conexao.tb_segmento.Single(x => x.cd_segmento == codSegmento);
            conexao.tb_segmento.Remove(segmentoExcluido);
            conexao.SaveChanges();
        }
        carregaGridSegmento();
    }
    protected void btnFecharGridSegmento_Click(object sender, EventArgs e)
    {
        divGridSegmento.Visible = false;
        divAlertaCadastroSucesso.Visible = false;
    }
    protected void btnPesquisarSegmentos_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];
        if (codUsuario != null)
        {
            divGridSegmento.Visible = true;
            carregaGridSegmento();
        }
        else
        {
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Timeout. Sua sessão foi expirada, favor conectar novamente.";
            return;
        }

    }
    protected void grvSegmento_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvSegmento.PageIndex = e.NewPageIndex;
        carregaGridSegmento();
    }
    protected void btnSalvarParcelas_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {

                var addNovaParcela = new tb_parcelas();

                addNovaParcela.nr_parcelas = Convert.ToInt32(txtParcelas.Text);
                addNovaParcela.cd_user = Convert.ToInt32(codUsuario);

                conexao.tb_parcelas.Add(addNovaParcela);
                conexao.SaveChanges();
            }
            limparFormParcelas();
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Cadastro de parcela realizado com sucesso!";
        }
        else
        {
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Timeout. Ué você está desconectado! Conecte para realizar o cadastro";
            limparFormParcelas();
            return;
        }       
    }
    protected void btnLimparParcelas_Click(object sender, ImageClickEventArgs e)
    {
        limparFormParcelas();
    }
    protected void grvParcelas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codParcela = Convert.ToInt32(e.Values["cd_parcela"]);

        using (var conexao = new BudplannEntities())
        {
            var parcelaExcluida = conexao.tb_parcelas.Single(x => x.cd_parcela == codParcela);
            conexao.tb_parcelas.Remove(parcelaExcluida);
            conexao.SaveChanges();
        }
        carregaGridParcelas();
    }
    protected void grvParcelas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvParcelas.PageIndex = e.NewPageIndex;
        carregaGridParcelas();
    }
    protected void btnPesquisarParcelas_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];
        if (codUsuario != null)
        {
            divGridParcelas.Visible = true;
            carregaGridParcelas();
        }
        else
        {
            divAlertaCadastroSucesso.Visible = true;
            labelAlertacadastroSucesso.Text = "Timeout. Sua sessão foi expirada, favor conectar novamente.";
            return;
        }
    }
    protected void btnFecharGridParcelas_Click(object sender, EventArgs e)
    {
        divGridParcelas.Visible = false;
        divAlertaCadastroSucesso.Visible = false;
    }
    #endregion
}
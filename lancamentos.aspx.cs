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

    #region Methods
    private void carregaCartao()
    {
        //-----Pegando o código do usuário atrabés da sessão------------------------------------------------
        var codSessao = Session["codUser"];
        //--------------------------------------------------------------------------------------------------

        using (var conexao = new BudplannEntities())
        {
            //-----Carrega o dropdownlist de acordo com o usuário logado------------------------------------  
            var vCodSessao = Convert.ToInt32(codSessao);
            //var listarTbCartao = conexao.tb_cartao.ToList();
            var listarTbCartao = conexao.tb_cartao.Where(x => x.cd_user == vCodSessao).ToList();

            ddlCartao.DataSource = listarTbCartao;
            listarTbCartao.Insert(0, new tb_cartao { cd_cartao = 0, nm_cartao = "[Selecione]" });
            ddlCartao.DataValueField = "cd_cartao";
            ddlCartao.DataTextField = "nm_cartao";
            ddlCartao.DataBind();
            //----------------------------------------------------------------------------------------------
        }
    }

    private void limparForm()
    {
        txtDespesa.Text = String.Empty;
        txtOrigemDespesa.Text = string.Empty;
        txtNotaFical.Text = string.Empty;
        rdDinheiro.Checked = true;
        rdCartao.Checked = false;
        dtLancamento.Value = string.Empty; //---Ex: para limpar o <input> texbox no html5 em vez de usar o asp:text
        ddlCartao.SelectedValue = "0";
    }

    public void logoff()
    {
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1d));
        FormsAuthentication.SignOut();
        Response.Redirect("index.aspx", true);
    }

    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        //-----habilita o dropdownlist através do radio button---------------------
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
        //-------------------------------------------------------------------------

        if (!IsPostBack)
        {
            carregaCartao();

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
        }

    }
    protected void ddlCartao_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
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
        limparForm();
    }
    protected void btnSalvar_Click(object sender, ImageClickEventArgs e)
    {

    }
    #endregion
}
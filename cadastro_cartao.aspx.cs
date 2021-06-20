using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cadastro_cartao : System.Web.UI.Page
{
    #region Meus Métodos
    private void limparFormCartao()
    {
        txtNomeCartao.Text = string.Empty;
        ddlTipoCartao.SelectedValue = "0";
        dtValidade.Value = string.Empty;
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
    #endregion
    #region Meus Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //-----atribuições de visualização html--------------------
            divAlerta.Visible = false;
            divGridCartao.Visible = false;
            //---------------------------------------------------------
        }
    }
    protected void grvCartao_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codCartao = Convert.ToInt32(e.Values["cd_cartao"]);

        using (var conexao = new BudplannEntities())
        {
            var verifica = conexao.tb_lancamento_despesas.ToList();
            //----verifica se existe movimentação para o cartão---------------------------------------------
            if (verifica.Exists(x => x.cd_cartao.Equals(codCartao)))
            {
                divAlerta.Visible = true;
                labelAlerta.Text = "Não é possível excluir o cartão cadastrado, pois, o cartão escolhido já possui vinculos nas despesas.";
            }
            else
            {
                var cartaoExcluido = conexao.tb_cartao.Single(x => x.cd_cartao == codCartao);
                conexao.tb_cartao.Remove(cartaoExcluido);
                conexao.SaveChanges();
            }
            //----------------------------------------------------------------------------------------------
        }
        carregaGridCartao();
    }
    protected void grvCartao_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvCartao.PageIndex = e.NewPageIndex;
        carregaGridCartao();
        divAlerta.Visible = false;
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
                addNovoCartao.ds_inativo = "N";
                conexao.tb_cartao.Add(addNovoCartao);
                conexao.SaveChanges();
            }
            limparFormCartao();
            divAlerta.Visible = true;
            labelAlerta.Text = "Cartão cadastrado com sucesso!";
            //Response.Write("<script>alert('Ramo Cadastrado Com Sucesso');window.location='cadastros.aspx'</script>");
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparFormCartao();
            return;
        }

    }
    protected void btnLimpar_Click(object sender, ImageClickEventArgs e)
    {
        limparFormCartao();
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
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparFormCartao();
            return;
        }

    }
    protected void btnFecharGridCartao_Click(object sender, ImageClickEventArgs e)
    {
        divGridCartao.Visible = false;
        divAlerta.Visible = false;
    }
    #endregion

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cadastro_parcelas : System.Web.UI.Page
{
    #region Meus Métodos
    private void limparFormParcelas()
    {
        txtParcelas.Text = string.Empty;
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
    #endregion

    #region Meus Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //-----atribuições de visualização html--------------------
            divAlerta.Visible = false;
            divGridParcelas.Visible = false;
            //---------------------------------------------------------
        }
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
                addNovaParcela.ds_inativo = "N";

                conexao.tb_parcelas.Add(addNovaParcela);
                conexao.SaveChanges();
            }
            limparFormParcelas();
            divAlerta.Visible = true;
            labelAlerta.Text = "Cadastro de parcela realizado com sucesso!";
            carregaGridParcelas();
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
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
        divAlerta.Visible = false;
        var codParcela = Convert.ToInt32(e.Values["cd_parcela"]);

        using (var conexao = new BudplannEntities())
        {
            var verifica = conexao.tb_lancamento_despesas.ToList();
            //----verifica se existe movimentação para a parcela--------------------------------------------
            if (verifica.Exists(x => x.cd_parcela.Equals(codParcela)))
            {
                divAlerta.Visible = true;
                labelAlerta.Text = "Não é possível excluir o a parcela cadastrada, pois, a parcela escolhida já possui vinculos nas despesas.";
            }
            else
            {
                var parcelaExcluida = conexao.tb_parcelas.Single(x => x.cd_parcela == codParcela);
                conexao.tb_parcelas.Remove(parcelaExcluida);
                conexao.SaveChanges();
            }
            //----------------------------------------------------------------------------------------------
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
        divAlerta.Visible = false;
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            divGridParcelas.Visible = true;
            carregaGridParcelas();
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            return;
        }
    }
    protected void btnFecharGridParcelas_Click(object sender, ImageClickEventArgs e)
    {
        divGridParcelas.Visible = false;
        divAlerta.Visible = false;
    }
    #endregion

}
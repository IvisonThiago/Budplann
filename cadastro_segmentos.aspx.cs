using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cadastro_segmentos : System.Web.UI.Page
{
    #region Meus Métodos
    private void limparFormSegmento()
    {
        txtRamoSegmento.Text = string.Empty;
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
    #endregion

    #region Meus Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //-----atribuições de visualização html--------------------
            divAlerta.Visible = false;
            divGridSegmento.Visible = false;
            //---------------------------------------------------------
        }
    }
    protected void grvSegmento_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codSegmento = Convert.ToInt32(e.Values["cd_segmento"]);

        using (var conexao = new BudplannEntities())
        {
            var verifica = conexao.tb_lancamento_despesas.ToList();
            //----verifica se existe movimentação para o segmento--------------------------------------------
            if (verifica.Exists(x => x.cd_segmento.Equals(codSegmento)))
            {
                divAlerta.Visible = true;
                labelAlerta.Text = "Não é possível excluir o segmento, pois, o segmento escolhido já possui vinculo nas despesas." + "</br>" + "Caso queira inativar/ativar, clique em editar.";
            }
            else
            {
                var segmentoExcluido = conexao.tb_segmento.Single(x => x.cd_segmento == codSegmento);
                conexao.tb_segmento.Remove(segmentoExcluido);
                conexao.SaveChanges();
            }
            //----------------------------------------------------------------------------------------------
        }
        carregaGridSegmento();
    }
    protected void grvSegmento_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvSegmento.PageIndex = e.NewPageIndex;
        carregaGridSegmento();
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
                addNovoSegmento.ds_inativo = "N";
                conexeao.tb_segmento.Add(addNovoSegmento);
                conexeao.SaveChanges();
            }
            limparFormSegmento();
            divAlerta.Visible = true;
            labelAlerta.Text = "Cadastro de segmento realizado com sucesso!";
            carregaGridSegmento();
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparFormSegmento();
            return;
        }
    }
    protected void btnLimparSegmentos_Click(object sender, ImageClickEventArgs e)
    {
        limparFormSegmento();
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
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            return;
        }
    }
    protected void btnFecharGridSegmento_Click(object sender, ImageClickEventArgs e)
    {
        divGridSegmento.Visible = false;
        divAlerta.Visible = false;
    }
    #endregion

}
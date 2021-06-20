using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lancamento_receitas : System.Web.UI.Page
{
    private void limparForm()
    {
        txtOrigemReceita.Text = string.Empty;
        txtReceita.Text = string.Empty;
        dtLancamento.Value = string.Empty;
        ddlCompetencia.SelectedValue = "0";
        txtValor.Text = string.Empty;
    }
    private void limparFormModal()
    {
        txtPesquisa1.Value = string.Empty;
        txtPesquisa2.Value = string.Empty;
        ddlCompetencia.SelectedValue = "0";
    }
    private void carregarGridReceitas()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        var competencia = ddlFiltroCompetencia.SelectedItem.ToString();

        if (txtPesquisa1.Value != string.Empty && txtPesquisa2.Value != string.Empty)
        {
            DateTime data1 = Convert.ToDateTime(txtPesquisa1.Value);
            DateTime data2 = Convert.ToDateTime(txtPesquisa2.Value);

            using (var conexao = new BudplannEntities())
            {
                var listarReceita = conexao.tb_lancamento_receitas.Where
                (x => x.cd_user == codSessao
                && x.dt_recebimento >= data1
                && x.dt_recebimento <= data2
                && x.ds_competencia == competencia).OrderByDescending(x => x.cd_lancamento_receita).ToList();

                grvReceita.DataSource = listarReceita;
                grvReceita.DataBind();
            }
        }
        else
        {
            using (var conexao = new BudplannEntities())
            {
                var listarReceita = conexao.tb_lancamento_receitas.Where
                (x => x.cd_user == codSessao
                && x.ds_competencia == competencia).OrderByDescending(x => x.cd_lancamento_receita).ToList();

                grvReceita.DataSource = listarReceita;
                grvReceita.DataBind();
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //-----atribuições de visualização html--------------------
            divAlerta.Visible = false;
            divGridReceita.Visible = false;
            //---------------------------------------------------------
        }
    }
    protected void btnLimpar_Click(object sender, ImageClickEventArgs e)
    {
        limparForm();
        divAlerta.Visible = false;
    }
    protected void btnSalvar_Click(object sender, ImageClickEventArgs e)
    {
        var codUsuario = Session["codUser"];

        if (codUsuario != null)
        {
            using (var conexao = new BudplannEntities())
            {
                var addNovaReceita = new tb_lancamento_receitas();

                addNovaReceita.cd_user = Convert.ToInt32(codUsuario);
                if (txtReceita.Text == string.Empty)
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Que Mané. Falta inserir uma descrição da receita.";
                    return;
                }
                else
                {
                    addNovaReceita.ds_receita = txtReceita.Text.ToString();
                }
                addNovaReceita.ds_origem_receita = txtOrigemReceita.Text;
                if (ddlCompetencia.SelectedValue == "0")
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Que Mané. Falta escolher a competência.";
                    return;
                }
                else
                {
                    addNovaReceita.ds_competencia = ddlCompetencia.SelectedItem.ToString();
                }
                if (dtLancamento.Value == string.Empty)
                {
                    addNovaReceita.dt_recebimento = null;
                }
                else
                {
                    addNovaReceita.dt_recebimento = Convert.ToDateTime(dtLancamento.Value);
                }
                if (txtValor.Text == string.Empty)
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Mas é um Manezão Mesmo. Cadê o valor?";
                    return;
                }
                else
                {
                    addNovaReceita.ds_valor = Convert.ToDecimal(txtValor.Text);
                }

                divAlerta.Visible = true;
                labelAlerta.Text = "Lançamento de receita realizado com sucesso!";
                limparForm();
                conexao.tb_lancamento_receitas.Add(addNovaReceita);
                conexao.SaveChanges();
            }
        }
        else
        {
            divAlerta.Visible = true;
            labelAlerta.Text = "TIMEOUT. Conexão expirada, favor conectar novamente.";
            limparForm();
            return;
        }

    }
    protected void grvReceita_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var codReceita = Convert.ToInt32(e.Values["cd_lancamento_receita"]);

        using (var conexao = new BudplannEntities())
        {
            var excluirReceita = conexao.tb_lancamento_receitas.Single(x => x.cd_lancamento_receita == codReceita);

            conexao.tb_lancamento_receitas.Remove(excluirReceita);
            conexao.SaveChanges();
        }
        carregarGridReceitas();
    }
    protected void btnFecharDespesas_Click(object sender, EventArgs e)
    {
        divAlerta.Visible = false;
        divGridReceita.Visible = false;
    }
    protected void btnCalcular_Click(object sender, EventArgs e)
    {

    }
    protected void btnImprimir_Click(object sender, EventArgs e)
    {

    }
    protected void btnRealizarPesquisa_Click(object sender, EventArgs e)
    {
        var codSessao = Session["codUser"];

        if (codSessao != null)
        {
            if (txtPesquisa1.Value != string.Empty && txtPesquisa2.Value != string.Empty)
            {
                divValorSomado.Visible = false;
                divAlerta.Visible = false;
                divGridReceita.Visible = true;
                carregarGridReceitas();
            }
            else
            {
                if (ddlFiltroCompetencia.SelectedValue != "0")
                {
                    carregarGridReceitas();
                    divValorSomado.Visible = false;
                    divAlerta.Visible = false;
                    divGridReceita.Visible = true;
                }
                else
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Manezão. Para pesquisar, tem que informar a competência.";
                    return;
                }
            }
        }
    }
    protected void btnFecharModal_Click(object sender, EventArgs e)
    {
        divAlerta.Visible = false;
        limparFormModal();
    }
}
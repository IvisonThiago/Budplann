using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Reflection;

public partial class dashboard : System.Web.UI.Page
{
    #region Gráficos
    protected string graficSegmento3()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        string strDados;

        using (var conexao = new BudplannEntities())
        {
            var conn = conexao.Database.Connection;

            var cmd = conn.CreateCommand();
            cmd = new SqlCommand();
            //var cmd = conn.CreateCommand();
            cmd.CommandText = "chartCompetenciaDespesaReceita";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.Parameters.Add(new SqlParameter("codSessao", codSessao));
            conn.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();

            strDados = "[['Comp', 'Despesa', 'Receita'],";

            foreach (DataRow dr in dt.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + Convert.ToInt32(dr[1]) + "," + Convert.ToInt32(dr[2]);
                strDados = strDados + "],";
            }

            strDados = strDados + "]";
            return strDados;
        }
    }
    protected string graficSegmento2()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        string strDados;

        using (var conexao = new BudplannEntities())
        {
            var conn = conexao.Database.Connection;

            var cmd = conn.CreateCommand();
            cmd = new SqlCommand();
            //var cmd = conn.CreateCommand();
            cmd.CommandText = "chartDespesaAnual";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.Parameters.Add(new SqlParameter("codSessao", codSessao));
            conn.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();

            strDados = "[['ds_competencia','TOTAL'],";

            foreach (DataRow dr in dt.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + Convert.ToInt32(dr[1]);
                strDados = strDados + "],";
            }

            strDados = strDados + "]";
            return strDados;
        }
    }
    protected string graficSegmento()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        string strDados;

        using (var conexao = new BudplannEntities())
        {
            var conn = conexao.Database.Connection;

            var cmd = conn.CreateCommand();
            cmd = new SqlCommand();
            //var cmd = conn.CreateCommand();
            cmd.CommandText = "chartSegmento";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.Parameters.Add(new SqlParameter("codSessao", codSessao));
            conn.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();

            strDados = "[['ds_competencia','TOTAL'],";

            foreach (DataRow dr in dt.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + Convert.ToInt32(dr[1]);
                strDados = strDados + "],";
            }

            strDados = strDados + "]";
            return strDados;
        }
    }
    protected string graficSegmentoFiltro()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        var competeciaFiltro = ddlFiltroGrafico2.SelectedItem.ToString();
        string strDados;

        using (var conexao = new BudplannEntities())
        {
            var conn = conexao.Database.Connection;

            var cmd = conn.CreateCommand();
            cmd = new SqlCommand();
            //var cmd = conn.CreateCommand();
            cmd.CommandText = "chartSegmentoFiltro";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.Parameters.Add(new SqlParameter("codSessao", codSessao));
            cmd.Parameters.Add(new SqlParameter("competeciaFiltro", competeciaFiltro));
            conn.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();

            strDados = "[['ds_competencia','TOTAL'],";

            foreach (DataRow dr in dt.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + Convert.ToInt32(dr[1]);
                strDados = strDados + "],";
            }

            strDados = strDados + "]";
            return strDados;
        }
    }
    protected string graficCompetencia()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        string strDados;

        using (var conexao = new BudplannEntities())
        {
            var conn = conexao.Database.Connection;

            var cmd = conn.CreateCommand();
            cmd = new SqlCommand();
            //var cmd = conn.CreateCommand();
            cmd.CommandText = "chartCompetencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.Parameters.Add(new SqlParameter("codSessao", codSessao));
            conn.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();

            strDados = "[['ds_competencia','TOTAL'],";

            foreach (DataRow dr in dt.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + Convert.ToInt32(dr[1]);
                strDados = strDados + "],";
            }

            strDados = strDados + "]";
            return strDados;
        }

    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {       
        if (!IsPostBack)
        {
            divGraficoFiltro.Visible = false;
            graficCompetencia();
        }
    }

    protected void ddlFiltroGrafico2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFiltroGrafico2.SelectedValue != "0")
        {
            divGraficoPadrao.Visible = false;
            divGraficoFiltro.Visible = true;
            graficSegmentoFiltro();
        }
        else
        {
            divGraficoPadrao.Visible = true;
            divGraficoFiltro.Visible = false;
        }
    }
}

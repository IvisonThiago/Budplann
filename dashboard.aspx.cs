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

    //DataTable dados = new DataTable();

    //int codSessao = Convert.ToInt32(Session["codUser"]);

    //dados.Columns.Add(new DataColumn("Task", typeof(string)));
    //dados.Columns.Add(new DataColumn("Hours per Day", typeof(string)));

    //dados.Rows.Add(new object[] { "Combustivel", 11 });
    //dados.Rows.Add(new object[] { "Alimentos", 20 });
    //dados.Rows.Add(new object[] { "Roupas", 2 });
    //dados.Rows.Add(new object[] { "Manutenção", 3 });
    //dados.Rows.Add(new object[] { "Movéis", 1 });

    //string strDados;

    //strDados = "[['Task', 'Hours per Day'],";

    //foreach (DataRow dr in dados.Rows)
    //{
    //    strDados = strDados + "[";
    //    strDados = strDados + "'" + dr[0] + "'" + "," + dr[1];
    //    strDados = strDados + "],";
    //}
    //strDados = strDados + "]";

    //return strDados;
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            graficCompetencia();
        }
    }

}

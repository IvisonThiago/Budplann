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

public partial class home : System.Web.UI.Page
{
    protected string tabelaNotificacao()
    {
        int codSessao = Convert.ToInt32(Session["codUser"]);
        string strDados;

        using (var conexao = new BudplannEntities())
        {
            var conn = conexao.Database.Connection;
            int diaAtual = Convert.ToInt32(DateTime.Now.Day);
            int mesAtual = DateTime.Now.Month;

            var cmd = conn.CreateCommand();
            cmd = new SqlCommand();
            //var cmd = conn.CreateCommand();
            cmd.CommandText = "tabelaNotificacao";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.Parameters.Add(new SqlParameter("codSessao", codSessao));
            cmd.Parameters.Add(new SqlParameter("mes", mesAtual));
            cmd.Parameters.Add(new SqlParameter("dia", diaAtual));
            conn.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();

            strDados = "[['Contas a Pagar', 'Data'],";

            foreach (DataRow dr in dt.Rows)
            {
                strDados = strDados + "[";
                strDados = strDados + "'" + dr[0] + "'" + "," + "'" + Convert.ToDateTime(dr[1]).ToString("dd/MM/yyyy") + "'";
                strDados = strDados + "],";

                divNotific.Visible = true;
            }
            strDados = strDados + "]";
            return strDados;                
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divNotific.Visible = false;
            tabelaNotificacao();
        }
    }
}
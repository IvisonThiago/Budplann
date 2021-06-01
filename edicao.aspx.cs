using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

public partial class editarcartao : System.Web.UI.Page
{
    public void logoff()
    {
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1d));
        FormsAuthentication.SignOut();
        Response.Redirect("index.aspx", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

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
    protected void btnHm_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("principal.aspx");
    }
    protected void btnLogoff_Click(object sender, ImageClickEventArgs e)
    {
        logoff();
    }
}
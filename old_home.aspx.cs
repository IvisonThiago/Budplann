using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Session["Usuario"]);
        //Response.Write(Session["codUser"]);

        var userSessao = Session["Usuario"];
        var codSessao = Session["codUser"];

        if (userSessao == null)
        {
            Response.Redirect("index.aspx", true);
        }

    }
}
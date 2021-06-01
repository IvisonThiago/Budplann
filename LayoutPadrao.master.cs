using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

public partial class LayoutPadrao : System.Web.UI.MasterPage
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
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        //Response.Cache.SetCacheability(HttpCacheability.Private);
        //Response.Cache.SetSlidingExpiration(true);
    }
    protected void logoff_Click(object sender, EventArgs e)
    {
        logoff();
    }
}

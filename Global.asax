<%@ Application Language="C#" %>

<script RunAt="server">
    
   void Application_Start(Object sender, EventArgs e)
    {

        //ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition { Path = "~/Scripts/jquery-3.6.0.min.js"});
        //ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition { Path = "~/Bootstrap/js/bootstrap.min.js" });
        //ScriptManager.ScriptResourceMapping.AddDefinition("css", new ScriptResourceDefinition { Path = "~/Bootstrap/css/bootstrap.min.css"});    
    }
    
    void Aplication_End(Object sender, EventArgs e)
   {
       Response.Cache.SetCacheability(HttpCacheability.NoCache);
       Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
       Response.Cache.SetNoStore();
       FormsAuthentication.SignOut();
       Session.Abandon();
   }
    
</script>
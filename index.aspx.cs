using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Web.Services;
using System.Web.Security;
using System.Web.SessionState;

public partial class _Default : System.Web.UI.Page
{
    string user;
    string senha;
    string labelAlert;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //FormsAuthentication.SignOut();
        //Session.Clear();
        Response.Write(Session["cod"]);
        divAlerta.Visible = false;
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        user = Request["txtLogin"];
        senha = Request["txtSenha"];
        labelAlert = Request["labelAlerta"];
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (var conexao = new BudplannEntities())
        {

            bool result = true;
            var verifica = conexao.tb_usuario.ToList();

            //verifica se existe o usuário no banco----------------------------------------------------
            if (verifica.Exists(x => x.nm_user.Equals(user))) 
            {
                result = true;
            }
            else
            {
                result = false;
            }
            //----------------------------------------------------------------------------------------

            //validação do acesso------------------------------------------------------------------------------------
            if (result)
            {
                var existeUser = conexao.tb_usuario.Single(x => x.nm_user == user);
                if (existeUser.nm_user != null && existeUser.nr_senha == senha)
                {
                    var authTicket = new FormsAuthenticationTicket(user, false, 90);
                    var encripTicket = FormsAuthentication.Encrypt(authTicket);
                    var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encripTicket);
                    Response.Cookies.Add(authCookie);
                    Session.Add("Usuario", user);
                    Session.Add("codUser", existeUser.cd_user);
                    FormsAuthentication.RedirectFromLoginPage(user, false);
                    //Session["cod"] = existeUser.cd_user;
                    //Session["user"] = existeUser.nm_user;
                    
                    Response.Redirect("principal.aspx");
                }
                else
                {
                    divAlerta.Visible = true;
                    labelAlerta.Text = "Tu erroooouuuu... digite a sua senha corretamente.";
                    //Response.Write("<script>alert('Usuário ou Senha invalidos');</script>"); //window.location='index.aspx'; para redirecionamento js 
                }               
            }
            else
            {
                divAlerta.Visible = true;
                labelAlerta.Text = "Oloco, meu! Você errou o seu usuário e/ou não tem cadastro no sistema.";
            }            
            //----------------------------------------------------------------------------------------------------


            ////------Validação do usuário------------------------------------------------------------------------
            ////var tbUsuario = new tb_usuario();
            //var existeUser = conexao.tb_usuario.Single(x => x.nm_user == user);
            //if (existeUser.nm_user != null && existeUser.nr_senha == senha)
            //{
            //    var authTicket = new FormsAuthenticationTicket(user, false, 1);
            //    var encripTicket = FormsAuthentication.Encrypt(authTicket);
            //    var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encripTicket);
            //    Response.Cookies.Add(authCookie);
            //    Session.Add("Usuario", user);
            //    FormsAuthentication.RedirectFromLoginPage(user, false);
            //    Session["cod"] = existeUser.cd_user;
            //    Session["user"] = existeUser.nm_user;
            //    Response.Redirect("home.aspx");
            //}
            //else
            //{
            //    divAlerta.Visible = true;
            //    labelAlerta.Text = "Oloco, meu! Seu Usuário ou sua senha está errada!";
            //    //Response.Write("<script>alert('Usuário ou Senha invalidos');</script>"); //window.location='index.aspx'; para redirecionamento js 
            //}
            //--------------------------------------------------------------------------------------------------
        }

    }
}
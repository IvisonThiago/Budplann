<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edicao.aspx.cs" Inherits="editarcartao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/owl.carousel.min.css" rel="stylesheet" />
    <link href="Bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/budCss.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css' />
    <link href="css/navBar23Animadacss.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />

    <title>Tela de Edição</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <!-- Inicio da barraStatus -->
                <div class="container-fluid" style="background-color: #5161ce;">
                    <div class="d-flex flex-row bd-highlight mb-3">
                        <div class="p-2 bd-highlight" style="margin-top: 08px">
                            <asp:ImageButton runat="server" ID="btnHm" ImageUrl="~/img/casa2.png" Height="40px" Width="40px" OnClick="btnHm_Click" />
                        </div>
                        <div class="p-2 bd-highlight" style="margin-top: 08px">
                            <asp:ImageButton runat="server" ID="btnLogoff" ImageUrl="~/img/logoff.png" Height="40px" Width="40px" OnClick="btnLogoff_Click" />
                        </div>

                        <div runat="server" id="statusUsuarioDeslogado" class="p-2 bd-highlight" style="width: 100%; text-align: right">
                            <i class="bi-broadcast" style="color: #ff0000"></i>
                            <asp:Label runat="server" CssClass="text-white">Desconectado</asp:Label>
                        </div>

                        <div runat="server" id="statusUsuario" class="p-2 bd-highlight" style="width: 100%; text-align: right">
                            <asp:Label runat="server" CssClass="text-white">Usuário:&nbsp</asp:Label>
                            <asp:Label runat="server" ID="labelUsuariologado" CssClass="text-white"></asp:Label>
                            <br />
                            <i class="bi-broadcast" style="color: #00ff21"></i>
                            <asp:Label runat="server" CssClass="text-white">Conectado</asp:Label>
                        </div>
                    </div>
                </div>
                <!-- Fim da barraStatus -->
            </header>
            




        </div>
    </form>
</body>
</html>

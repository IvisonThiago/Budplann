<%@ Page Language="C#" AutoEventWireup="true" CodeFile="principall.aspx.cs" Inherits="principall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="menu/css/style.css" rel="stylesheet" />
    <link href="Bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/budCss.css" rel="stylesheet" />

    <title>BudPlann - Home</title>

</head>
<body style="height: 100%">
    <div>
        <form runat="server">

            <div class="wrapper d-flex align-items-stretch">
                <nav id="sidebar" style="background-color: #0f0137">
                    <div class="p-4 pt-5">
                        <%--<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(menu/img/logo.jpg);"></a>--%>
                        <ul class="list-unstyled components mb-5">
                            <li class="active">
                                <a href="principall.aspx">Home</a>
                            </li>
                            <li>
                                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Lançamentos</a>
                                <ul class="collapse list-unstyled" id="pageSubmenu">
                                    <li>
                                        <a href="lancamentos.aspx" target="iframeHome">Despesas</a>
                                    </li>
                                    <li>
                                        <a href="#">Receita</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="cadastros.aspx" target="iframeHome">Tabelas</a>
                            </li>
                            <li>
                                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Outros</a>
                                <ul class="collapse list-unstyled" id="homeSubmenu">
                                    <li>
                                        <a href="lancamentos.aspx" target="iframeHome">Teste</a>
                                    </li>
                                    <li>
                                        <a href="#">Home 2</a>
                                    </li>
                                    <li>
                                        <a href="#">Home 3</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" ID="btnSair" Text="Sair" OnClick="btnSair_Click"></asp:LinkButton>
                            </li>
                        </ul>

                        <div class="footer">
                            <p>
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                All rights reserved | BudPlann Gerenciamento Financeiro <i class="icon-heart" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">@IvisonThiago</a>
                            </p>
                        </div>

                    </div>
                </nav>
                <!-- Page Content  -->
                <div id="content" class="container" style="margin-top: 0;">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="container-fluid">

                            <button type="button" id="sidebarCollapse" class="btn btn-primary">
                                <i class="fa fa-bars"></i>
                                <span class="sr-only">Toggle Menu</span>
                            </button>
                            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <i class="fa fa-bars"></i>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="nav navbar-nav ml-auto">
                                    <li class="nav-item">
                                        <!-- Inicio do Status Usuário -->
                                        <div runat="server" id="statusUsuarioDeslogado" class="p-2 bd-highlight" style="width: 100%; text-align: right">
                                            <i class="bi-broadcast" style="color: #ff0000"></i>
                                            <asp:Label runat="server" CssClass="text-secondary">Desconectado</asp:Label>
                                        </div>
                                        <div runat="server" id="statusUsuario" class="p-2 bd-highlight" style="width: 100%; text-align: right">
                                            <asp:Label runat="server" CssClass="text-secondary">Usuário:&nbsp</asp:Label>
                                            <asp:Label runat="server" ID="labelUsuariologado" CssClass="text-secondary"></asp:Label>
                                            <br />
                                            <i class="bi-broadcast" style="color: #00ff21"></i>
                                            <asp:Label runat="server" CssClass="text-secondary">Conectado</asp:Label>
                                        </div>
                                        <!-- Fim do Status Usuário -->
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <iframe name="iframeHome" src="home.aspx" class="card" style="width: 100%; height: 760px; border: none; overflow-x: hidden; overflow-y: hidden"></iframe>
                </div>
            </div>

        </form>
    </div>
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="menu/js/jquery.min.js"></script>
    <script src="menu/js/popper.js"></script>
    <script src="menu/js/bootstrap.min.js"></script>
    <script src="menu/js/main.js"></script>

</body>
</html>

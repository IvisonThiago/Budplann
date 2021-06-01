<%@ Page Language="C#" AutoEventWireup="true" CodeFile="principal.aspx.cs" Inherits="principal" %>

<!DOCTYPE html>

<html lang="pt-br">
<head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--Para exibir o icone no navegador -->
    <link rel="shortcut icon" href="icons/building.svg">

    <!-- Bootstrap CSS -->
    <link href="Bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/budCss.css" rel="stylesheet" />
    <link href="css/navBar23Animadacss.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css'>

    <title>Bud&Plann</title>

</head>
<body>
    <div class="container-fluid">

        <!-- inicio do navBar "menu"-->
        <nav class="navbar navbar-expand-custom navbar-mainbg">
            <a class="navbar-brand navbar-logo" href="#">Sistema Financeiro</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars text-white"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <div class="hori-selector">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                    <li class="nav-item active">
                        <a class="nav-link" href="#;"><i class="bi bi-house-fill"></i>Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lancamentos.aspx"><i class="far fa-address-book"></i>Lançamentos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-clone"></i>Consultas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cadastros.aspx"><i class="bi bi-server"></i>Cadastros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-chart-bar"></i>Charts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#;"><i class="bi bi-speedometer"></i>Dashboard</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Fim do navBar "menu"-->


        <!-- inicio do carousel-->
       <%-- <div class="card" id="carouselHome">
            <div class="card-body">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="img/finan01.jpg" alt="Primeiro Slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/finan02.jpg" alt="Segundo Slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/finan03.png" alt="Terceiro Slide" />
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Anterior</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Próximo</span>
                    </a>
                </div>
            </div>
        </div>--%>
        <!-- fim do carousel-->


    </div>
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <script src="js/navBar23Animada.js"></script>

</body>
</html>
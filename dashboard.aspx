<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
<head runat="server">
    <meta name="language" content="pt-br" />

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/owl.carousel.min.css" rel="stylesheet" />
    <link href="Bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/budCss.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css' />
    <link href="css/navBar23Animadacss.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />

    <title>Lançamentos de despesas</title>

</head>
<body style="height: auto">
    <form id="form1" runat="server">
        <div>
            <header>
            </header>
            <section>

                <div class="card">
                    <div class="form-row" style="margin-left: 20px; margin-top: 15px">
                        <div class="form-group col-md-6">
                        </div>
                        <div class="form-group col-md-6">
                            <asp:DropDownList runat="server" ID="ddlFiltroGrafico2" CssClass="form-control" Style="width: 150px" ToolTip="Selecione a competência para exibir no gráfico" OnSelectedIndexChanged="ddlFiltroGrafico2_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="0" Text="[Selecione]" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Janeiro"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Fevereiro"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Março"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Abril"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Maio"></asp:ListItem>
                                <asp:ListItem Value="6" Text="Junho"></asp:ListItem>
                                <asp:ListItem Value="7" Text="Julho"></asp:ListItem>
                                <asp:ListItem Value="8" Text="Agosto"></asp:ListItem>
                                <asp:ListItem Value="9" Text="Setembro"></asp:ListItem>
                                <asp:ListItem Value="10" Text="Outubro"></asp:ListItem>
                                <asp:ListItem Value="11" Text="Novembro"></asp:ListItem>
                                <asp:ListItem Value="12" Text="Dezembro"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <div id="piechart" style="height: 300px"></div>
                        </div>
                        <div runat="server" class="form-group col-md-6" id="divGraficoPadrao">
                            <div id="piechart2" style="height: 300px"></div>
                            <h6 class="text-danger small" style=" font-size: xx-small">Obs.: Se não for selecionada nenhuma competência, será exibida a competência vigente.</h6>
                        </div>
                        <div runat="server" class="form-group col-md-6" id="divGraficoFiltro">
                            <div id="piechart2Filtro" style="height: 300px"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <div id="chart_div2" style="height: 300px"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <div id="chart_div3" style="height: 300px"></div>
                        </div>
                    </div>


                </div>


            </section>
        </div>
    </form>
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
    <script src="Scripts/jquery.maskedinput.min.js"></script>
    <script src="Scripts/jquery.moneymask.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        //script para auto close dos alertas
        $(document).ready(function () {
            setTimeout(function () {
                $('#divAlerta').hide('fade');
            }, 5000);
        })
    </script>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=graficCompetencia()%>);
            var options = {
                title: 'Despesa por Competência',
                is3D: true,
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=graficSegmento()%>);
            var options = {
                title: 'Despesa por Segmento/Mês',
                is3D: true,
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
            chart.draw(data, options);
        }
    </script>
        <script type="text/javascript">
            google.charts.load('current', { 'packages': ['corechart'] });
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable(<%=graficSegmentoFiltro()%>);
            var options = {
                title: 'Despesa por Segmento/Mês',
                is3D: true,
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart2Filtro'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=graficSegmento2()%>);

            var options = {
                title: 'Despesa Anual',
                hAxis: { title: 'Ano', titleTextStyle: { color: '#333' } },
                vAxis: { title: 'Total', titleTextStyle: { color: '#333' }, minValue: 0 },
                legend: { position: 'top', maxLines: 3 },
                bar: { groupWidth: '75%' },
                isStacked: true,
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=graficSegmento3()%>);

            var options = {
                title: 'Depesa/Receita por Competência',
                vAxis: { title: 'Valor' },
                hAxis: { title: 'Competência' },
                seriesType: 'bars',
                series: { 5: { type: 'line' } }
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div3'));
            chart.draw(data, options);
        }
    </script>




</body>
</html>

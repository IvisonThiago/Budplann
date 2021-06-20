<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastro_segmentos.aspx.cs" Inherits="cadastro_segmentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- CSS -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="Bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/budCss.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css' />
    <link href="css/styles.css" rel="stylesheet" />
    <!-- css dos icons -->
    <link href="css/navBar23Animadacss.css" rel="stylesheet" />

    <title>Cadastros Segmentos</title>

</head>
<body style="height: auto">
    <form id="form1" runat="server">
        <div>

            <header>
                <!-- Alertas -->
                <div runat="server" id="divAlerta" class="alert alert-danger alert-dismissible" role="alert">
                    <asp:Label runat="server" ID="labelAlerta"></asp:Label>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!--Fim dos alertas -->
            </header>

            <div class="hero" style="background-image: url('');">
                <!--Inicio do Collapse -->
                <div class="card">
                    <div class="card-body">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                            <i class="bi-shop"></i>Cadastro de Segmentos
                                        </button>
                                    </h5>
                                </div>
                                <!-- collapse show para deixar o collapse aberto -->
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label for="txtRamoSegmento">Segmento</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtRamoSegmento" placeholder="Nome Segmento"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnSalvarSegmentos" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Registro" OnClick="btnSalvarSegmentos_Click" />
                                            </div>
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnLimparSegmentos" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" title="Limpar Tela" OnClick="btnLimparSegmentos_Click" />
                                            </div>
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnPesquisarSegmentos" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnPesquisarSegmentos_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fim do Collapse -->
                <!--Inicio do GridViwe Segmentos -->
                <div runat="server" class="card" id="divGridSegmento" style="overflow-y: scroll; height: 370px">
                    <div class="card-body">
                        <asp:GridView ID="grvSegmento" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover" AllowPaging="true" PageSize="4" OnRowDeleting="grvSegmento_RowDeleting" OnPageIndexChanging="grvSegmento_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="cd_segmento" HeaderText="Código" />
                                <asp:BoundField DataField="nm_segmento" HeaderText="Segmento" />
                                <asp:BoundField DataField="ds_inativo" HeaderText="Inativo" />
                                <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:HyperLinkField DataNavigateUrlFields="cd_segmento" DataNavigateUrlFormatString="edicao.aspx?codSegmento={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>
                            <PagerSettings PageButtonCount="5" />
                        </asp:GridView>
                        <div class="form-row" style="margin-top: 25px; margin-left: 5px">
                            <div class="form-group" style="width: 45px;">
                                <asp:ImageButton runat="server" ID="btnFecharGridSegmento" ImageUrl="~/img/close.png" ToolTip="Fechar" Height="25px" Width="25px" OnClick="btnFecharGridSegmento_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fim do GridView Segmentos -->
            </div>


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
    <script src="Bootstrap/js/dist/alert.js"></script>
    <script src="Bootstrap/js/dist/util.js"></script>
    <!-- js para o auto close do alerta -->
    <script type="text/javascript">
        $(document).ready(function () {
            setTimeout(function () {
                $('#divAlerta').hide('fade');
            }, 5000);
        })
    </script>
    <!-- Fim auto close -->
    <script>
        //Validações
        $(function () {
            $("#txtRamoSegmento").change(function () { $(this).val($(this).val().toUpperCase()); }); //Letras maiúsculas
            $("#txtRamoSegmento").focus(); //auto focus
        });
    </script>
</body>
</html>

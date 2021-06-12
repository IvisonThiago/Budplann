<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastros.aspx.cs" Inherits="cadastros" %>

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

    <title>Cadastros</title>

</head>
<body style="height: 100%">
    <form id="formCadastros" runat="server" method="post">
        <div>

            <header>
                <!-- Inicio da barraStatus -->
<%--                <div class="container-fluid" style="background-color: #5161ce;">
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
                </div>--%>
                <!-- Fim da barraStatus -->
                <!-- Alertas -->
                <div runat="server" id="divAlertaCadastroSucesso" class="alert alert-warning alert-dismissible" role="alert">
                    <asp:Label runat="server" ID="labelAlertacadastroSucesso"></asp:Label>
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
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <i class="bi-credit-card"></i>Cadastro de Cartão
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtNomeCartao">Cartão</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtNomeCartao" placeholder="Nome do Cartão"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="ddlTipoCartao">Tipo</label>
                                                <asp:DropDownList runat="server" ID="ddlTipoCartao" title="Crédito ou Débito" CssClass="form-control">
                                                    <asp:ListItem Value="0" Text="[Selecione]" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Débito"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Crédito"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-2">
                                                <label for="dtValidade">Data de Validade</label>
                                                <input runat="server" type="date" class="form-control" id="dtValidade" />
                                            </div>
                                        </div>
                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group col-md-1">
                                                <asp:ImageButton runat="server" ID="btnSalvar" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Registro" OnClick="btnSalvar_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnLimpar" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" title="Limpar Tela" OnClick="btnLimpar_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnConsultar" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnConsultar_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <i class="bi-shop"></i>Cadastro de Segmentos
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtRamoSegmento">Segmento</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtRamoSegmento" placeholder="Nome do Ramo de Segmento"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group col-md-1">
                                                <asp:ImageButton runat="server" ID="btnSalvarSegmentos" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Registro" OnClick="btnSalvarSegmentos_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnLimparSegmentos" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" title="Limpar Tela" OnClick="btnLimparSegmento_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnPesquisarSegmentos" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnPesquisarSegmentos_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            <i class="bi-calculator-fill"></i>Cadastro de Parcelas</button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtParcelas">Parcelas</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtParcelas" placeholder="Quantidade de Parcelas"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group col-md-1">
                                                <asp:ImageButton runat="server" ID="btnSalvarParcelas" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Registro" OnClick="btnSalvarParcelas_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnLimparParcelas" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" title="Limpar Tela" OnClick="btnLimparParcelas_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnPesquisarParcelas" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnPesquisarParcelas_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fim do Collapse -->
                <!--Inicio do GridViwe Cartões -->
                <div runat="server" class="card" id="divGridCartao">
                    <div class="card-body">
                        <asp:GridView ID="grvCartao" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-hover" OnRowDeleting="grvCartao_RowDeleting" AllowPaging="True" OnPageIndexChanging="grvCartao_PageIndexChanging" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="cd_cartao" HeaderText="Código" />
                                <asp:BoundField DataField="nm_cartao" HeaderText="Cartão" />
                                <asp:BoundField DataField="dt_validade" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data de Validade" />
                                <asp:BoundField DataField="ds_tipo" HeaderText="Tipo" />
                                <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:HyperLinkField DataNavigateUrlFields="cd_cartao" DataNavigateUrlFormatString="edicao.aspx?codCartao={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>
                            <PagerSettings PageButtonCount="5" />
                        </asp:GridView>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Button runat="server" ID="btnFecharGridCartao" Text="Fechar" CssClass="btn btn-primary" OnClick="btnFecharGridCartao_Click" />
                    </div>
                </div>
                <!--Fim do GridView Cartões -->
                <!--Inicio do GridViwe Segmentos -->
                <div runat="server" class="card" id="divGridSegmento">
                    <div class="card-body">
                        <asp:GridView ID="grvSegmento" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-hover" AllowPaging="True" PageSize="5" OnRowDeleting="grvSegmento_RowDeleting" OnPageIndexChanging="grvSegmento_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="cd_segmento" HeaderText="Código" />
                                <asp:BoundField DataField="nm_segmento" HeaderText="Segmento" />
                                <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:HyperLinkField DataNavigateUrlFields="cd_segmento" DataNavigateUrlFormatString="edicao.aspx?codSegmento={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>
                            <PagerSettings PageButtonCount="5" />
                        </asp:GridView>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Button runat="server" ID="btnFecharGridSegmento" Text="Fechar" CssClass="btn btn-primary" OnClick="btnFecharGridSegmento_Click" />
                    </div>
                </div>
                <!--Fim do GridView Segmentos -->
                <!--Inicio do GridViwe Parcelas -->
                <div runat="server" class="card" id="divGridParcelas">
                    <div class="card-body">
                        <asp:GridView ID="grvParcelas" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-hover" AllowPaging="True" PageSize="5" OnPageIndexChanging="grvParcelas_PageIndexChanging" OnRowDeleting="grvParcelas_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="cd_parcela" HeaderText="Código" />
                                <asp:BoundField DataField="nr_parcelas" HeaderText="Parcelas" />
                                <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:HyperLinkField DataNavigateUrlFields="cd_parcela" DataNavigateUrlFormatString="edicao.aspx?codParcela={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>
                            <PagerSettings PageButtonCount="5" />
                        </asp:GridView>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Button runat="server" ID="btnFecharGridParcelas" Text="Fechar" CssClass="btn btn-primary" OnClick="btnFecharGridParcelas_Click" />
                    </div>
                </div>
                <!--Fim do GridView parcelas -->

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
                $('#divAlertaCadastroSucesso').hide('fade');
            }, 5000);
        })
    </script>
    <!-- Fim auto close -->

</body>
</html>

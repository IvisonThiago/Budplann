<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lancamentos.aspx.cs" Inherits="lancamentos" %>

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

    <title>Lançamentos</title>

</head>
<body>
    <div>
        <form runat="server" id="formLanca">
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

                <div class="card">
                    <div class="card-body">
                        <div class="accordion" id="accordionExample">
                            <!-- Inicio do formulário de despesas -->
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                            Lançamento de Despesas
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtDespesa">Despesa</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtDespesa" placeholder="Descrição da Despesa"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="txtOrigemDespesa">Origem</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtOrigemDespesa" placeholder="Origem da despesa"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtNotaFical">Nota fiscal</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtNotaFical" placeholder="Nota Fiscal"></asp:TextBox>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-check">
                                                    <asp:RadioButton runat="server" CssClass="form-check-input" ID="rdDinheiro" GroupName="radioFormaPagamento" AutoPostBack="true" Checked="true" />
                                                    <label class="form-check-label" for="gridRadios1">
                                                        Dinheiro
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <br />
                                                    <asp:RadioButton runat="server" CssClass="form-check-input" ID="rdCartao" GroupName="radioFormaPagamento" AutoPostBack="true" />
                                                    <asp:Label runat="server">Cartão</asp:Label>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-4">
                                                <label for="ddlCartao">Cartão</label>
                                                <asp:DropDownList ID="ddlCartao" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCartao_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-2">
                                                <label for="ddlParcelas">Parcelas</label>
                                                <asp:DropDownList runat="server" ID="ddlParcelas" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="dtLancamento">Data</label>
                                                <input runat="server" type="date" class="form-control" id="dtLancamento" />
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="ddlCompetencia">Competência</label>
                                                <asp:DropDownList runat="server" ID="ddlCompetencia" CssClass="form-control">
                                                    <asp:ListItem Value="0" Text="[Selecione]" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Janeiro"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Fevereiro"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Março"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="ddlSegmento">Segmento</label>
                                                <asp:DropDownList runat="server" ID="ddlSegmento" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group col-md-1">
                                                <asp:ImageButton runat="server" ID="btnSalvar" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" OnClick="btnSalvar_Click" />
                                            </div>
                                            <div class="form-group col-md-1" style="margin-left: -40px">
                                                <asp:ImageButton runat="server" ID="btnLimpar" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" OnClick="btnLimpar_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- fim do formulário de despesas -->

                            <!-- inicio do formulário de receitas -->
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Lançamento de Receitas
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <!-- fim do formulário de despesas -->
                        </div>
                    </div>
                </div>

        </form>
    </div>

    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>

</body>
</html>

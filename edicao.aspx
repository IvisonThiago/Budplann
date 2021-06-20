<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edicao.aspx.cs" Inherits="PgEdicaoDados" %>

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

    <title>Tela de Edição</title>

</head>
<body style="height: 100%">
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

            <!--Inicio do Collapse SEGEMENTO -->
            <div runat="server" class="card" id="divCollapseSegmento">
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
                                            <asp:TextBox runat="server" CssClass="form-control text-danger" BackColor="#f7f7f7" ID="txtRamoSegmentoInativo" placeholder="Nome Segmento"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row" style="margin-top: 10px">
                                        <div class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnSalvarSegmentos" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Alterações" OnClick="btnSalvarSegmentos_Click" />
                                        </div>
                                        <div runat="server" id="divInativarSegmentos" class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnInativarSegmentos" ImageUrl="~/img/desativado.png" Height="30px" Width="30px" title="Inativar" OnClick="btnInativarSegmentos_Click" />
                                        </div>
                                        <div runat="server" id="divAtivarSegmentos" class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnAtivarSegmentos" ImageUrl="~/img/visao.png" Height="30px" Width="30px" title="Ativar" OnClick="btnAtivarSegmentos_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Fim do Collapse SEGMENTO -->
            <!--Inicio do Collapse CARTAO -->
            <div runat="server" class="card" id="divCollapseCartao">
                <div class="card-body">
                    <div class="accordion" id="accordiCartao">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="bi-credit-card"></i>Cadastro de Cartão
                                    </button>
                                </h5>
                            </div>
                            <!-- collapse show para deixar o collapse aberto -->
                            <div id="collapse2" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtNomeCartao">Cartão</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtNomeCartao" placeholder="Nome do Cartão"></asp:TextBox>
                                            <asp:TextBox runat="server" CssClass="form-control text-danger" BackColor="#f7f7f7" ID="txtNomeCartaoInativo" placeholder="Nome do Cartão"></asp:TextBox>
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
                                        <div class="form-group col-md-4">
                                            <label for="dtValidade">Data de Validade</label>
                                            <asp:TextBox runat="server" ID="dtValidade" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row" style="margin-top: 10px">
                                        <div class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnSalvarCartao" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Alterações" OnClick="btnSalvarCartao_Click" />
                                        </div>
                                        <div runat="server" id="divInativarCartao" class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnInativarCartao" ImageUrl="~/img/desativado.png" Height="30px" Width="30px" title="Inativar" OnClick="btnInativarCartao_Click" />
                                        </div>
                                        <div runat="server" id="divAtivarCartao" class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnAtivarCartao" ImageUrl="~/img/visao.png" Height="30px" Width="30px" title="Ativar" OnClick="btnAtivarCartao_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Fim do Collapse CARTAO -->
            <!--Inicio do Collapse PARCELA -->
            <div runat="server" class="card" id="divCollapseParcela">
                <div class="card-body">
                    <div class="accordion" id="accordionParcela">
                        <div class="card">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <i class="bi-calculator-fill"></i>Cadastro de Parcelas</button>
                                </h5>
                            </div>
                            <div id="collapse3" class="collaps show" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="txtParcelas">Parcelas</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtParcelas" placeholder="Parcelas Ex: 12x"></asp:TextBox>
                                            <asp:TextBox runat="server" CssClass="form-control text-danger" BackColor="#f7f7f7" ID="txtParcelasInativa" placeholder="Parcelas Ex: 12x"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row" style="margin-top: 10px">
                                        <div class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnSalvarParcela" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Alterações" OnClick="btnSalvarParcela_Click" />
                                        </div>
                                        <div runat="server" id="divInativarParcela" class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnInativarParcela" ImageUrl="~/img/desativado.png" Height="30px" Width="30px" title="Inativar" OnClick="btnInativarParcela_Click"/>
                                        </div>
                                        <div runat="server" id="divAtivarParcela" class="form-group" style="width: 45px">
                                            <asp:ImageButton runat="server" ID="btnAtivarParcela" ImageUrl="~/img/visao.png" Height="30px" Width="30px" title="Ativar" OnClick="btnAtivarParcela_Click"  />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Fim do Collapse -->




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
    <script src="Scripts/jquery.maskedinput.min.js"></script>
    <script src="Scripts/jquery.moneymask.js"></script>
    <!-- js para o auto close do alerta -->
    <script type="text/javascript">
        $(document).ready(function () {
            setTimeout(function () {
                $('#divAlerta').hide('fade');
            }, 5000);
        })
    </script>
    <script>
        //Validações
        $(function () {
            $("#txtRamoSegmento").change(function () { $(this).val($(this).val().toUpperCase()); }); //Letras maiúsculas
            $("#txtNomeCartao").focus(); //auto focus
            $("#dtValidade").mask("99/99/9999");
        });
    </script>

</body>
</html>

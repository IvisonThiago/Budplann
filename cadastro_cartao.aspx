<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastro_cartao.aspx.cs" Inherits="cadastro_cartao" %>

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
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <i class="bi-credit-card"></i>Cadastro de Cartão
                                        </button>
                                    </h5>
                                </div>
                                <!-- collapse show para deixar o collapse aberto -->
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
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
                                            <div class="form-group col-md-4">
                                                <label for="dtValidade">Data de Validade</label>
                                                <input runat="server" type="date" class="form-control" id="dtValidade" />
                                            </div>
                                        </div>
                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnSalvar" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Registro" OnClick="btnSalvar_Click" />
                                            </div>
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnLimpar" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" title="Limpar Tela" OnClick="btnLimpar_Click" />
                                            </div>
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnConsultar" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnConsultar_Click" />
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
                <div runat="server" class="card" id="divGridCartao" style="overflow-y: scroll; height: 350px">
                    <div class="card-body">
                        <asp:GridView ID="grvCartao" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover" OnRowDeleting="grvCartao_RowDeleting" AllowPaging="True" OnPageIndexChanging="grvCartao_PageIndexChanging" PageSize="4">
                            <Columns>
                                <asp:BoundField DataField="cd_cartao" HeaderText="Código" />
                                <asp:BoundField DataField="nm_cartao" HeaderText="Cartão" />
                                <asp:BoundField DataField="dt_validade" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data de Validade" />
                                <asp:BoundField DataField="ds_tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="ds_inativo" HeaderText="Inativo" />
                                <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:HyperLinkField DataNavigateUrlFields="cd_cartao" DataNavigateUrlFormatString="edicao.aspx?codCartao={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>
                            <PagerSettings PageButtonCount="10" />
                        </asp:GridView>
                        <div class="form-group" style="width: 45px;">
                            <asp:ImageButton runat="server" ID="btnFecharGridCartao" ImageUrl="~/img/close.png" ToolTip="Fechar" Height="25px" Width="25px" OnClick="btnFecharGridCartao_Click" />
                        </div>

                    </div>
                </div>
                <!--Fim do GridView Cartões -->
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
                $("#txtNomeCartao").change(function () { $(this).val($(this).val().toUpperCase()); }); //Letras maiúsculas
                $("#txtNomeCartao").focus(); //auto focus
            });
    </script>
        <script>
            //script para remoção de acentuação
            $(function () {
                $("#txtNomeCartao").keyup(function () {
                    var texto = removerAcentos($(this).val());
                    $(this).val(texto);
                });
            });
            function removerAcentos(s) { return s.normalize('NFD').replace(/[\u0300-\u036f|\u00b4|\u0060|\u005e|\u007e]/g, "") }
    </script>
</body>
</html>

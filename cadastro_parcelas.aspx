<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastro_parcelas.aspx.cs" Inherits="cadastro_parcelas" %>

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

            <section>
                <div class="hero" style="background-image: url('');">
                    <!--Inicio do Collapse -->
                    <div class="card">
                        <div class="card-body">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                <i class="bi-calculator-fill"></i>Cadastro de Parcelas</button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collaps show" aria-labelledby="headingThree" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label for="txtParcelas">Parcelas</label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtParcelas" placeholder="Parcelas Ex: 12x"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-row" style="margin-top: 10px">
                                                <div class="form-group" style="width: 45px">
                                                    <asp:ImageButton runat="server" ID="btnSalvarParcelas" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" title="Salvar Registro" OnClick="btnSalvarParcelas_Click" />
                                                </div>
                                                <div class="form-group" style="width: 45px">
                                                    <asp:ImageButton runat="server" ID="btnLimparParcelas" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" title="Limpar Tela" OnClick="btnLimparParcelas_Click" />
                                                </div>
                                                <div class="form-group" style="width: 45px">
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
                    <!--Inicio do GridViwe Parcelas -->
                    <div runat="server" class="card" id="divGridParcelas" style="overflow-y: scroll; height: 370px">
                        <div class="card-body">
                            <asp:GridView ID="grvParcelas" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover" AllowPaging="True" PageSize="4" OnPageIndexChanging="grvParcelas_PageIndexChanging" OnRowDeleting="grvParcelas_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="cd_parcela" HeaderText="Código" />
                                    <asp:BoundField DataField="nr_parcelas" HeaderText="Parcelas" />
                                    <asp:BoundField DataField="ds_inativo" HeaderText="Inativo" />
                                    <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
                                    <asp:HyperLinkField DataNavigateUrlFields="cd_parcela" DataNavigateUrlFormatString="edicao.aspx?codParcela={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:HyperLinkField>
                                </Columns>
                                <PagerSettings PageButtonCount="5" />
                            </asp:GridView>
                            <div class="form-group" style="width: 45px;">
                                <asp:ImageButton runat="server" ID="btnFecharGridParcelas" ImageUrl="~/img/close.png" ToolTip="Fechar" Height="25px" Width="25px" OnClick="btnFecharGridParcelas_Click" />
                            </div>

                        </div>
                    </div>
                    <!--Fim do GridView parcelas -->
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
    <script src="Bootstrap/js/dist/alert.js"></script>
    <script src="Bootstrap/js/dist/util.js"></script>
    <script type="text/javascript">
        //auto close alerta
        $(document).ready(function () {
            setTimeout(function () {
                $('#divAlerta').hide('fade');
            }, 5000);
        })
    </script>
    <script>
        //Validações
        $(function () {
            $("#txtParcelas").focus(); //auto focus
            $('#txtParcelas').keyup(function () { $(this).val(this.value.replace(/\D/g, '')); }); //validação para aceitar somente campo númerico
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

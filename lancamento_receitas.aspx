<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lancamento_receitas.aspx.cs" Inherits="lancamento_receitas" %>

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

    <title>Lançamentos de Receitas</title>

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
                <div class="card">
                    <div class="card-body">
                        <div class="accordion" id="accordionExample">
                            <!-- Inicio do formulário de despesas -->
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                            <i class="bi-cash-stack"></i>Lançamento de Receitas
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtReceita">Receita</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtReceita" placeholder="Descrição da Receita" ToolTip="Informe a receita que deseja lançar"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="txtOrigemReceita">Origem</label>
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtOrigemReceita" placeholder="Origem da Receita"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-3">
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
                                            <div class="form-group col-md-2">
                                                <label for="txtValor">Valor</label>
                                                <asp:TextBox runat="server" ID="txtValor" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-row" style="margin-top: 10px">
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnSalvar" ImageUrl="~/img/salvar.png" Height="30px" Width="30px" OnClick="btnSalvar_Click" />
                                            </div>
                                            <div class="form-group" style="width: 45px">
                                                <asp:ImageButton runat="server" ID="btnLimpar" ImageUrl="~/img/borracha.png" Height="30px" Width="30px" OnClick="btnLimpar_Click" />
                                            </div>
                                            <div class="form-group" style="width: 45px">
                                                <%--<asp:ImageButton runat="server" ID="btnPesquisarDespesas" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnPesquisarDespesas_Click" />--%>
                                                <button type="button" data-toggle="modal" data-target="#modalFiltroPesquisa" style="border: none; background: none">
                                                    <img src="img/lupa.png" height="30px" width="30px" />
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- fim do formulário de despesas -->
                        </div>
                    </div>
                </div>
                <!-- Inicio Modal -->
                <div class="modal fade" id="modalFiltroPesquisa" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Filtrar Pesquisa</h5>
                                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>--%>
                            </div>
                            <div class="modal-body">

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="txtPesquisa1">Data Inicial</label>
                                        <input type="date" runat="server" id="txtPesquisa1" class="form-control" />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtPesquisa1">Data Final</label>
                                        <input type="date" runat="server" id="txtPesquisa2" class="form-control" />
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="ddlFiltroCompetencia">Competência</label>
                                        <asp:DropDownList runat="server" ID="ddlFiltroCompetencia" CssClass="form-control">
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
                                    <div class="form-group col-md-4" style="padding-top: 35px">
                                        <asp:Button runat="server" CssClass="btn btn-primary btn-sm" ID="btnRealizarPesquisa" Text="Pesquisar" OnClick="btnRealizarPesquisa_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button runat="server" ID="btnFecharModal" CssClass="btn btn-secondary" Text="Fechar" OnClick="btnFecharModal_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fim do Modal -->
                <!--Inicio do GridViwe Receita -->
                <div runat="server" class="card" id="divGridReceita" style="overflow-y: scroll; height: 270px">
                    <div class="card-body">
                        <asp:GridView ID="grvReceita" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-hover" AllowPaging="false" OnRowDeleting="grvReceita_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="cd_lancamento_receita" HeaderText="Cod">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ds_receita" HeaderText="Descrição" />
                                <asp:BoundField DataField="ds_origem_receita" HeaderText="Origem" />
                                <asp:BoundField DataField="ds_competencia" HeaderText="Competência">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dt_recebimento" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ds_valor" HeaderText="Valor" DataFormatString="{0:N2}" />
                                <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:HyperLinkField DataNavigateUrlFields="cd_lancamento_receita" DataNavigateUrlFormatString="edicao.aspx?codReceita={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>

                        </asp:GridView>
                        <div class="form-group col-md-4">
                            <asp:Button runat="server" ID="btnFecharDespesas" Text="Fechar" CssClass="btn btn-primary btn-sm" OnClick="btnFecharDespesas_Click" />
                            <asp:Button runat="server" ID="btnCalcular" Text="Somar" CssClass="btn btn-primary btn-sm" OnClick="btnCalcular_Click" />
                            <asp:Button runat="server" ID="btnImprimir" Text="Imprimir" CssClass="btn btn-primary btn-sm" OnClick="btnImprimir_Click" />
                        </div>
                        <div runat="server" id="divValorSomado" class="form-group col-md-2">
                            <asp:TextBox runat="server" ID="txtSomaValor" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!--Fim do GridView Receita -->

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
    <script type="text/javascript">
        //script para auto close dos alertas
        $(document).ready(function () {
            setTimeout(function () {
                $('#divAlerta').hide('fade');
            }, 5000);
        })
    </script>
        <script>
            //Validações
            $(function () {
                $("#txtValor").maskMoney({ prefix: 'R$ ', allowNegative: true, thousands: '.', decimal: ',', affixesStay: false }); //Máscara R$ Valor
                $("#txtReceita, #txtOrigemReceita").change(function () { $(this).val($(this).val().toUpperCase()); }); //Letras maiúsculas
            });
    </script>
</body>
</html>

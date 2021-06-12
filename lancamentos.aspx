﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lancamentos.aspx.cs" Inherits="lancamentos" %>

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
<body style="height: auto">
    <div>
        <form runat="server" id="formLanca">
            <header>
                <%--                <!-- Inicio da barraStatus -->
                <div class="container-fluid" style="background-color: #5161ce;">
                    <div class="d-flex flex-row bd-highlight mb-3">
                        <div class="p-2 bd-highlight" style="margin-top: 08px">
                            <asp:ImageButton runat="server" ID="btnHm" ImageUrl="~/img/casa2.png" Height="40px" Width="40px" OnClick="btnHm_Click" title="Inicio" />
                        </div>
                        <div class="p-2 bd-highlight" style="margin-top: 13px">
                            <asp:ImageButton runat="server" ID="btnLogoff" ImageUrl="~/img/logoff.png" Height="30px" Width="30px" OnClick="btnLogoff_Click" title="Sair" />
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
                <!-- Fim da barraStatus -->--%>
                <!-- Alertas -->
                <div runat="server" id="divAlerta" class="alert alert-warning alert-dismissible" role="alert">
                    <asp:Label runat="server" ID="labelAlerta"></asp:Label>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!--Fim dos alertas -->
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
                                        <div class="form-group col-md-4">
                                            <label for="txtNotaFical">Nota fiscal</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtNotaFical" placeholder="Nota Fiscal"></asp:TextBox>
                                        </div>

                                        <div class="col-sm-2">
                                            <label>Forma de Pagamento</label>
                                            <div class="form-check">
                                                <asp:RadioButton runat="server" CssClass="form-check-input" ID="rdDinheiro" GroupName="radioFormaPagamento" AutoPostBack="true" Checked="true" />
                                                <label class="form-check-label" style="padding-top: 4px; padding-right: 25px">Dinheiro</label>
                                                <asp:RadioButton runat="server" CssClass="form-check-input" ID="rdCartao" GroupName="radioFormaPagamento" AutoPostBack="true" />
                                                <label class="form-check-label" style="padding-top: 4px;">Cartão</label>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="ddlCartao">Cartão</label>
                                            <asp:DropDownList ID="ddlCartao" runat="server" CssClass="form-control"></asp:DropDownList>
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
                                        <div class="form-group col-md-6">
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
                                        <div class="form-group col-md-1" style="margin-left: -40px">
                                            <%--<asp:ImageButton runat="server" ID="btnPesquisarDespesas" ImageUrl="~/img/lupa.png" Height="30px" Width="30px" title="Visualizar" OnClick="btnPesquisarDespesas_Click" />--%>
                                            <button type="button" data-toggle="modal" data-target="#modalFiltroPesquisa" style="border: none; background: none">
                                                <img src="img/lupa.png" height="30px" width="30px" />
                                            </button>
                                        </div>
                                        <div class="form-group col-md-1" style="margin-left: -40px">
                                            <%--<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalFiltroPesquisa">Filtrar</button>--%>
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
            <%--            <!--Inicio do GridViwe Despesas -->
            <div runat="server" class="card" id="divGridDespesas">
                <div class="card-body">
                    <asp:GridView ID="grvDespesas" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-hover" AllowPaging="True" PageSize="10" OnPageIndexChanging="grvDespesas_PageIndexChanging" OnRowDeleting="grvDespesas_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="codLancamento" HeaderText="Cod">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="despesa" HeaderText="Despesa" />
                            <asp:BoundField DataField="origemDespesa" HeaderText="Origem" />
                            <asp:BoundField DataField="formaPagamento" HeaderText="F. Pagamento" />
                            <asp:BoundField DataField="cartao" HeaderText="Cartão">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="parcela" HeaderText="Parcela">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dataCompra" HeaderText="Data Compra" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="competencia" HeaderText="Competência" />
                            <asp:BoundField DataField="nomeSegmento" HeaderText="Segmento" />
                            <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:HyperLinkField DataNavigateUrlFields="codLancamento" DataNavigateUrlFormatString="edicao.aspx?codDespesa={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:HyperLinkField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" />
                    </asp:GridView>
                </div>
                <div class="form-group col-md-6">
                    <asp:Button runat="server" ID="btnFecharDespesas" Text="Fechar" CssClass="btn btn-primary btn-sm" OnClick="btnFecharDespesas_Click" />
                </div>
            </div>
            <!--Fim do GridView Despesas -->--%>

            <!--Inicio do GridViwe Despesas -->
            <div runat="server" class="card" id="divGridDespesas">
                <div class="card-body">
                    <asp:GridView ID="grvDespesas" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-hover" AllowPaging="True" OnPageIndexChanging="grvDespesas_PageIndexChanging" OnRowDeleting="grvDespesas_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="cd_lancamento_despesa" HeaderText="Cod">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nm_lancamento_despesa" HeaderText="Despesa" />
                            <asp:BoundField DataField="ds_origem_despesa" HeaderText="Origem" />
                            <asp:BoundField DataField="ds_forma_pagamento" HeaderText="F. Pagamento" />
                            <asp:BoundField DataField="tb_cartao.nm_cartao" HeaderText="Cartão">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tb_parcelas.nr_parcelas" HeaderText="Parcela">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dt_compra" HeaderText="Data Compra" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="ds_competencia" HeaderText="Competência" />
                            <asp:BoundField DataField="tb_segmento.nm_segmento" HeaderText="Segmento" />
                            <asp:CommandField DeleteText="Deletar" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/img/delete.png">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:HyperLinkField DataNavigateUrlFields="cd_lancamento_despesa" DataNavigateUrlFormatString="edicao.aspx?codDespesa={0}" HeaderText="Editar" Text="<img src='img/editar.png' title='meu texto' />">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:HyperLinkField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" />
                    </asp:GridView>
                </div>
                <div class="form-group col-md-6">
                    <asp:Button runat="server" ID="btnFecharDespesas" Text="Fechar" CssClass="btn btn-primary btn-sm" OnClick="btnFecharDespesas_Click" />
                </div>
            </div>
            <!--Fim do GridView Despesas -->

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
    <!-- js para o auto close do alerta -->
    <script type="text/javascript">
        $(document).ready(function () {
            setTimeout(function () {
                $('#divAlerta').hide('fade');
            }, 5000);
        })
    </script>
    <!-- Fim auto close -->

</body>
</html>

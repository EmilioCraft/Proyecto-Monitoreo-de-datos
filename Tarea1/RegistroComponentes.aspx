<%@ Page Title="Componentes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroComponentes.aspx.cs" Inherits="Tarea1._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Bootstrap -->
    <link href="bootstrap.min%20(4).css" rel="stylesheet" />

    <main class="container mt-4">
        
        <!-- Formulario para agregar nuevos materiales -->
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white">
                <h3 class="mb-0">Agregar componente</h3>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" Placeholder="Nombre" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblModelo" runat="server" Text="Modelo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtModelo" runat="server" Placeholder="Modelo" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblNumeroSerie" runat="server" Text="Número de Serie" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNumeroSerie" runat="server" Placeholder="Número de Serie" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblImagen" runat="server" Text="URL de Imagen" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtImagen" runat="server" Placeholder="URL de Imagen" CssClass="form-control"></asp:TextBox>
                </div>

                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
            </div>
        </div>

        <!-- Tabla para mostrar los materiales -->
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white">
                <h3 class="mb-0">Lista de componentes</h3>
            </div>

        <!-- Buscador -->
            <div class="card-body d-flex">
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control me-2" Placeholder="Buscar"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-success" OnClick="btnBuscar_Click" />
            </div>

            <div class="card-body">
                <asp:GridView ID="gvEspecificacionesComponentes" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-striped table-bordered text-center align-middle"
                    CellPadding="5" GridLines="None" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                        <asp:BoundField DataField="NumeroSerie" HeaderText="Número de Serie" />
                        <asp:BoundField DataField="Imagen" HeaderText="Imagen" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="accionEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-sm me-1" OnClick="accionEditar_Click" />
                                <asp:Button ID="accionElminar" runat="server" Text="Eliminar" CssClass="btn btn-danger btn-sm" OnClick="accionElminar_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </main>
</asp:Content>

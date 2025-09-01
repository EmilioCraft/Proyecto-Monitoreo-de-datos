<%@ Page Title="Inventario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="Tarea1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container mt-4">
    <div class="card shadow-sm mb-4">
        <!--Bootstrap -->
        <link href="bootstrap.min%20(4).css" rel="stylesheet" />
        <!-- Tabla para mostrar los materiales -->
    <div class="card-header bg-success text-white">
            <h3>Lista del inventario</h3>
    </div>
    <div class="card-body">
    <asp:GridView ID="gvInventario" runat="server" 
        CssClass="table table-striped table-bordered text-center align-middle"
        AutoGenerateColumns="False" Width="100%" CellPadding="5" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Numero_Identificador" HeaderText="Numero Identificador" />
            <asp:BoundField DataField="Lote" HeaderText="Lote" />
            <asp:BoundField DataField="Fecha_Componentes" HeaderText="Fecha" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
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

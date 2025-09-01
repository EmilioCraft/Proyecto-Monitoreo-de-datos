<%@ Page Title="Inventario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="Tarea1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <!-- Tabla para mostrar los materiales -->
    <h3>Lista del Inventario</h3>
    <asp:GridView ID="gvInventario" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="5" GridLines="Both">
        <Columns>
            <asp:BoundField DataField="Numero_Identificador" HeaderText="Numero Identificador" />
            <asp:BoundField DataField="Lote" HeaderText="Lote" />
            <asp:BoundField DataField="Fecha_Componentes" HeaderText="Fecha" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
        </Columns>
    </asp:GridView>
    </main>
</asp:Content>

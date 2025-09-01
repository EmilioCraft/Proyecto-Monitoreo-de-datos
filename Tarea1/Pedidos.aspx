<%@ Page Title="Pedidos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Tarea1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
    <!-- Formulario para agregar nuevos materiales -->
    <h3>Pedidos</h3>
    <asp:Label ID="lblDropdown" runat="server" Text="Selecciona el componente"></asp:Label>
    <asp:DropDownList ID="ddlComponentes" runat="server"></asp:DropDownList><br />

    <asp:Label ID="lblCantidad" runat="server" Text="Cantidad"></asp:Label>
    <asp:TextBox ID="txtCantidad" runat="server" Placeholder="Cantidad"></asp:TextBox><br />

    <asp:Label ID="lblFecha" runat="server" Text="Fecha"></asp:Label>
    <asp:Calendar ID="CalendarFecha" runat="server"></asp:Calendar>

    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />

    </main>
</asp:Content>

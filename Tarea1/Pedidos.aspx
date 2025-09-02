<%@ Page Title="Pedidos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Tarea1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container mt-4">
    <!--Bootstrap -->
    <link href="bootstrap.min%20(4).css" rel="stylesheet" />

    <!-- Formulario para agregar nuevos materiales -->
    <div class="card shadow-sm mb-4">
    
    <div class="card-header bg-primary text-white">
            <h3>Pedidos</h3>
    </div>
    <div class="card-body">
           <div>
       <asp:HiddenField ID="HiddenFieldID" runat="server" />
  </div>
        <div class="mb-3">
            <asp:Label ID="lblDropdown" runat="server" Text="Selecciona el componente" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlComponentes" runat="server" class="form-select"></asp:DropDownList><br />
        </div>
        <div class="mb-3">
            <asp:Label ID="lblCantidad" runat="server" Text="Cantidad" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtCantidad" runat="server" Placeholder="Cantidad" CssClass="form-control" TextMode="Number"></asp:TextBox><br />
        </div>
        <div class="mb-3">
            <asp:Label ID="lblFecha" runat="server" Text="Fecha" CssClass="form-label"></asp:Label>
            <asp:Calendar ID="CalendarFecha" runat="server" class="border-rounded"></asp:Calendar>
        </div>
        <div class="mb-3">
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary" OnClick="btnRegistrar_Click" />
        </div>
   </div>
    </div>
    </main>
</asp:Content>

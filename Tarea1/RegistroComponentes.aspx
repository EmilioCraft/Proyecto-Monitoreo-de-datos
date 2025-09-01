<%@ Page Title="Componentes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroComponentes.aspx.cs" Inherits="Tarea1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <!-- Formulario para agregar nuevos materiales -->
    <h3>Agregar componente</h3>
    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
    <asp:TextBox ID="txtNombre" runat="server" Placeholder="Nombre"></asp:TextBox><br />

    <asp:Label ID="lblModelo" runat="server" Text="Modelo"></asp:Label>
    <asp:TextBox ID="txtModelo" runat="server" Placeholder="Modelo"></asp:TextBox><br />

    <asp:Label ID="lblNumeroSerie" runat="server" Text="Número de Serie"></asp:Label>
    <asp:TextBox ID="txtNumeroSerie" runat="server" Placeholder="Número de Serie"></asp:TextBox><br />

    <asp:Label ID="lblImagen" runat="server" Text="URL de Imagen"></asp:Label>
    <asp:TextBox ID="txtImagen" runat="server" Placeholder="URL de Imagen"></asp:TextBox><br />

    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />

        <!-- Tabla para mostrar los materiales -->
    <h3>Lista de componentes</h3>
        <div style="display:flex; align-items:center;">
            <asp:TextBox ID="txtBuscar" runat="server" OnTextChanged="txtBuscar_TextChanged">Buscar</asp:TextBox> 
            <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>     
    <asp:GridView ID="gvEspecificacionesComponentes" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="5" GridLines="Both">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
            <asp:BoundField DataField="NumeroSerie" HeaderText="Número de Serie" />
            <asp:BoundField DataField="Imagen" HeaderText="Imagen" />
            <asp:TemplateField HeaderText = "Acciones">
                    <ItemTemplate>
                    <asp:Button ID="accionEditar" runat="server" Text="Editar" CssClass="btn" OnClick="accionEditar_Click"/>
                    <asp:Button ID="accionElminar" runat="server" Text="Eliminar" CssClass="btn" OnClick="accionElminar_Click"/>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>

    </main>

</asp:Content>

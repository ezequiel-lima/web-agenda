<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.Master" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="WebAgenda.Contato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label2" runat="server" Text="Inserir novo contato"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelNome" runat="server" Text="Nome"></asp:Label>
    <br />
    <asp:TextBox ID="TxbNome" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
    <br />
    <asp:TextBox ID="TxbEmail" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelTelefone" runat="server" Text="Telefone"></asp:Label>
    <br />
    <asp:TextBox ID="TxbTelefone" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="ButtonInserir" runat="server" OnClick="ButtonInserir_Click" Text="Inserir" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Lista de Contatos"></asp:Label>
    <br />
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceContatos" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceContatos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Contato] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Contato] ([Nome], [Email], [Telefone]) VALUES (@Nome, @Email, @Telefone)" SelectCommand="SELECT * FROM [Contato]" UpdateCommand="UPDATE [Contato] SET [Nome] = @Nome, [Email] = @Email, [Telefone] = @Telefone WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Nome" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telefone" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Nome" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telefone" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

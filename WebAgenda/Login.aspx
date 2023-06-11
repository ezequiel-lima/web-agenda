<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAgenda.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
        <br />
        <asp:TextBox ID="TxbEmail" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Senha"></asp:Label>
        <br />
        <asp:TextBox ID="TxbSenha" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonEntrar" runat="server" Text="Entrar" Width="85px" OnClick="ButtonEntrar_Click" />
        <br />
        <asp:Label ID="LabelInfo" runat="server"></asp:Label>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="WebAgenda.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h3>Lista de usuários</h3>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Email" DataSourceID="SqlDataSourceUsuario" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" CssClass="btn btn-danger" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-primary" />
                    </td>
                    <td>
                        <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="SenhaLabel" runat="server" Text='<%# Eval("Senha") %>' CssClass="form-control"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" CssClass="btn btn-primary" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-secondary" />
                    </td>
                    <td>
                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:TextBox ID="SenhaTextBox" runat="server" Text='<%# Bind("Senha") %>' CssClass="form-control"/>
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Inserir" CssClass="btn btn-success" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-secondary" />
                    </td>
                    <td>
                        <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:TextBox ID="SenhaTextBox" runat="server" Text='<%# Bind("Senha") %>' CssClass="form-control"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" CssClass="btn btn-danger" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-primary" />
                    </td>
                    <td>
                        <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="SenhaLabel" runat="server" Text='<%# Eval("Senha") %>' CssClass="form-control"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server">
                                <tr runat="server">
                                    <th runat="server"></th>
                                    <th runat="server">Nome</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Senha</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" CssClass="btn btn-danger" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-primary" />
                    </td>
                    <td>
                        <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"/>
                    </td>
                    <td>
                        <asp:Label ID="SenhaLabel" runat="server" Text='<%# Eval("Senha") %>' CssClass="form-control"/>
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Usuario] WHERE [Email] = @Email" InsertCommand="INSERT INTO [Usuario] ([Nome], [Email], [Senha]) VALUES (@Nome, @Email, @Senha)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [Nome] = @Nome, [Senha] = @Senha WHERE [Email] = @Email" OnInserted="SqlDataSourceUsuariosInserted" OnUpdated="SqlDataSourceUsuariosUpdated">
        <DeleteParameters>
            <asp:Parameter Name="Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Senha" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="Senha" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Font-Size="Large"></asp:Label>
</asp:Content>

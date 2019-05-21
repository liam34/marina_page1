<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="/" method="post">
        User Name: <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        Password: <br />
        <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Error. Please re-enter your username or password" Visible="False"></asp:Label>
    </form>
</asp:Content>

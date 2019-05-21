<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication1.Registration_page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="/" method="post">
        First Name: <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        Last Name: <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        Phone: <br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        City: <br />
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
        User Name: <br />
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
        Password: <br />
        <asp:TextBox ID="TextBox6" TextMode="Password" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </form>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    </asp:Content>

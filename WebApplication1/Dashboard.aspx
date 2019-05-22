<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication1.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
    <br />

    <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" />


    <asp:Button ID="Button2" runat="server" Height="44px" PostBackUrl="~/LeaseSlipPage.aspx" style="margin-left: 117px" Text="Booking" Width="109px" />


</asp:Content>

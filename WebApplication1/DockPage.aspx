<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DockPage.aspx.cs" Inherits="WebApplication1.WebForm2" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
<asp:Label ID="Label1" runat="server" Text="All Docks in the Facility of Marina"></asp:Label>
<br />
<br />




<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
        <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
    </Columns>
</asp:GridView>
<br />
<asp:Label ID="Label2" runat="server" Text="All Lease in the Facility of Marina"></asp:Label>
<br />
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceLease" AllowPaging="True" Height="263px" Width="294px">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
        <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
        <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceLease" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString3 %>" SelectCommand="SELECT * FROM [Slip]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceList" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString2 %>" SelectCommand="SELECT * FROM [Slip]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Available Slips in the Dock of Marina  Facility"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource2">
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    <br />
<br />
<br />
<br />
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT * FROM [Dock]"></asp:SqlDataSource>
&nbsp;<asp:Image ID="Image1" runat="server" />




</asp:Content>

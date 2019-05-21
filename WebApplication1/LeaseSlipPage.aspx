<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaseSlipPage.aspx.cs" Inherits="WebApplication1.LeaseSlipPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
        <br />
        <h1>Slip Reservation</h1>
        <p>Welcome       <asp:Label ID="Label3" runat="server" Text="John"></asp:Label>
            <asp:Label ID="custID" runat="server" Text="1" Visible="False"></asp:Label>
        </p>
        <p>please choose&nbsp; Dock :<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="au<asp:SqlDataSource runat=" server="">
                <asp:ListItem Value="1">Dock 1</asp:ListItem>
                <asp:ListItem Value="2">Dock 2</asp:ListItem>
                <asp:ListItem Value="3">Dock 3</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString4 %>" SelectCommand="SELECT * FROM [Slip] WHERE (([Width] = @Width) AND ([Length] = @Length) AND ([DockID] = @DockID) and (Slip.ID not in (select SlipID from Lease) )       )">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="8" Name="Width" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2" DefaultValue="16" Name="Length" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="DockID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString5 %>" SelectCommand="SELECT * FROM [Lease] WHERE ([CustomerID] = @CustomerID)" OnUpdating="SqlDataSource2_Updating">
                <SelectParameters>
                    <asp:ControlParameter ControlID="custID" DefaultValue="1" Name="CustomerID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>Please input the information of your boat:</p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Boat Width(ft):"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="87px" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Boat Length(ft):"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" Width="75px" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        </p>
        <p>
      
<asp:Button ID="Button6" runat="server" CssClass="auto-style10" Text="Arrive date" Width="78px" OnClick="Button6_Click" Height="29px" />

            <asp:TextBox ID="TextBox3" runat="server" Width="96px"></asp:TextBox>

<asp:Button ID="Button8" runat="server" Text="Leave date" CssClass="auto-style11" OnClick="Button8_Click" Height="31px" />
            <asp:TextBox ID="TextBox4" runat="server" Width="90px"></asp:TextBox>
            <asp:Calendar ID="Calendar1" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="262px" OnSelectionChanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar2_SelectionChanged" TitleFormat="Month" Visible="False" Width="258px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
        </p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnCreatingModelDataSource="GridView1_CreatingModelDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <div>
            <img alt="Dock Map" class="auto-style9" src="images/cvm_marina_map.png" />&nbsp;
            <br />
            <asp:Button ID="Button2" runat="server" Text="Lease" OnClick="Button2_Click" CssClass="auto-style7" Width="86px" />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style4" OnClick="Button1_Click" Text="Check your Lease " Width="118px" Height="20px" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Cancel Lease" CssClass="auto-style5" Height="21px" Width="106px" />
            <asp:Button ID="Button5" runat="server" Height="21px" Text="Check out" Width="91px" CssClass="auto-style6" />
            <br />

        </div>
            <asp:GridView ID="GridView2" runat="server" CssClass="auto-style3" Height="16px" Width="16px" Visible="False" AutoPostBack="true" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="SlipID" HeaderText="SlipID" SortExpression="SlipID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
    </form>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaseSlipPage.aspx.cs" Inherits="WebApplication1.LeaseSlipPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        
  
    <div  class="btn-info" style="margin-left:250px"> 
    <form id="form10" ">
        <br />
        <h1 >Slip Reservation</h1>
        <p>Welcome       <asp:Label ID="Label3" runat="server" Text="John"></asp:Label>
        </p>
         <p>
            <asp:Label ID="custID" runat="server" Text="2" Visible="False"></asp:Label>
        </p>
        <p>&nbsp;&nbsp; <asp:Button ID="Button16" runat="server" Height="31px" style="margin-left:-14px" Text="Check dock information" OnClick="Button16_Click" Width="195px" />
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="au<asp:SqlDataSource runat=" server="" style="margin-left: 161px">
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString5 %>" SelectCommand="SELECT * FROM [Lease] WHERE ([CustomerID] = @CustomerID)" OnUpdating="SqlDataSource2_Updating" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Lease] WHERE [ID] = @original_ID AND [SlipID] = @original_SlipID AND [CustomerID] = @original_CustomerID AND (([ArriveDate] = @original_ArriveDate) OR ([ArriveDate] IS NULL AND @original_ArriveDate IS NULL)) AND (([LeaveDate] = @original_LeaveDate) OR ([LeaveDate] IS NULL AND @original_LeaveDate IS NULL))" InsertCommand="INSERT INTO [Lease] ([SlipID], [CustomerID], [ArriveDate], [LeaveDate]) VALUES (@SlipID, @CustomerID, @ArriveDate, @LeaveDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Lease] SET [SlipID] = @SlipID, [CustomerID] = @CustomerID, [ArriveDate] = @ArriveDate, [LeaveDate] = @LeaveDate WHERE [ID] = @original_ID AND [SlipID] = @original_SlipID AND [CustomerID] = @original_CustomerID AND (([ArriveDate] = @original_ArriveDate) OR ([ArriveDate] IS NULL AND @original_ArriveDate IS NULL)) AND (([LeaveDate] = @original_LeaveDate) OR ([LeaveDate] IS NULL AND @original_LeaveDate IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_SlipID" Type="Int32" />
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_ArriveDate" />
                    <asp:Parameter DbType="Date" Name="original_LeaveDate" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SlipID" Type="Int32" />
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ArriveDate" />
                    <asp:Parameter DbType="Date" Name="LeaveDate" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="custID" DefaultValue="1" Name="CustomerID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SlipID" Type="Int32" />
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ArriveDate" />
                    <asp:Parameter DbType="Date" Name="LeaveDate" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_SlipID" Type="Int32" />
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_ArriveDate" />
                    <asp:Parameter DbType="Date" Name="original_LeaveDate" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString7 %>" DeleteCommand="DELETE FROM [Customer] WHERE [ID] = @original_ID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Phone] = @original_Phone AND [City] = @original_City AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([PassWrd] = @original_PassWrd) OR ([PassWrd] IS NULL AND @original_PassWrd IS NULL))" InsertCommand="INSERT INTO [Customer] ([FirstName], [LastName], [Phone], [City], [UserName], [PassWrd]) VALUES (@FirstName, @LastName, @Phone, @City, @UserName, @PassWrd)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer] WHERE ([UserName] = @UserName)" UpdateCommand="UPDATE [Customer] SET [FirstName] = @FirstName, [LastName] = @LastName, [Phone] = @Phone, [City] = @City, [UserName] = @UserName, [PassWrd] = @PassWrd WHERE [ID] = @original_ID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Phone] = @original_Phone AND [City] = @original_City AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([PassWrd] = @original_PassWrd) OR ([PassWrd] IS NULL AND @original_PassWrd IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_UserName" Type="String" />
                    <asp:Parameter Name="original_PassWrd" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="PassWrd" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label3" DefaultValue="Sara" Name="UserName" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="PassWrd" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_UserName" Type="String" />
                    <asp:Parameter Name="original_PassWrd" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString8 %>" SelectCommand="SELECT * FROM [Dock]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource4" Visible="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" Visible="False">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="PassWrd" HeaderText="PassWrd" SortExpression="PassWrd" />
                </Columns>
            </asp:GridView>
        </p>
        <p>Please input the information of your boat:</p>
        <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button13" runat="server" CausesValidation="False" CssClass="offset-sm-0" Text="Boat width(ft):" style="margin-left: -20px" Width="115px" />
            &nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="49px" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged" Height="28px" CssClass="offset-sm-0"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Width from 8 to 12" ForeColor="Red" MaximumValue="12" MinimumValue="8" Type="Integer"></asp:RangeValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button12" runat="server" CausesValidation="False" Text="Boat Lenth(ft):" CssClass="offset-sm-0" style="margin-left:-20px" Width="122px" />
            <asp:TextBox ID="TextBox2" runat="server" Width="52px" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged" Height="27px"></asp:TextBox>
        &nbsp;<asp:Button ID="Button6" runat="server" CssClass="auto-style10" Text="Arrive date" Width="119px" OnClick="Button6_Click" Height="33px" CausesValidation="False" style="margin-left: 58px" />

            <asp:TextBox ID="TextBox3" runat="server" Width="96px" Visible="False"></asp:TextBox>

<asp:Button ID="Button8" runat="server" Text="Leave date" CssClass="auto-style11" OnClick="Button8_Click" Height="33px" style="margin-left: 43px" CausesValidation="False" Width="112px" />
            <asp:TextBox ID="TextBox4" runat="server" Width="97px" Visible="False"></asp:TextBox>
        </p>
        <p>
      
            <asp:Calendar ID="Calendar1" runat="server" Visible="False" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="Calendar1_SelectionChanged" style="margin-left: 546px" BorderStyle="Solid" CellSpacing="1">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" BorderStyle="Solid" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
            <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False" Width="330px" style="margin-left: 983px;margin-top:-250px; " BorderStyle="Solid" CellSpacing="1">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" BorderStyle="Solid" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
        </p>
         <p>
      
             <asp:Button ID="Button11" runat="server" CausesValidation="False" OnClick="Button11_Click" style="margin-left: 0px" Text="See Available Slips " Width="149px" />
        &nbsp;</p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnCreatingModelDataSource="GridView1_CreatingModelDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False">
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
            <asp:Button ID="Button17" runat="server" Text=" Lease" OnClick="Button2_Click" CssClass="auto-style7" Width="114px" Height="55px" style="margin-left: 1px" CausesValidation="False" />
            <br />
            <br />
       
            <asp:Label ID="Label5" runat="server" Text="Customer Lease Record "></asp:Label>
            <asp:GridView ID="GridView2" runat="server" CssClass="auto-style3" Height="16px" Width="16px" AutoPostBack="true" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" style="margin-top:0px" AutoGenerateDeleteButton="True" AutoGenerateSelectButton="True" OnRowDeleted="GridView2_RowDeleted" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="SlipID" HeaderText="SlipID" SortExpression="SlipID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="ArriveDate" HeaderText="ArriveDate" SortExpression="ArriveDate" />
                    <asp:BoundField DataField="LeaveDate" HeaderText="LeaveDate" SortExpression="LeaveDate" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <br />
            <br />
     
            <asp:Button ID="Button9" runat="server" Height="37px" OnClick="Button9_Click" style="margin-left: 0px" Text="See Map" Width="126px" CausesValidation="False" />
            <asp:Button ID="Button10" runat="server" CausesValidation="False" Height="37px" OnClick="Button10_Click" style="margin-left: 82px" Text="Check available slip" Width="153px" />
            <asp:Button ID="Button14" runat="server" Height="37px" OnClick="Button14_Click" style="margin-left: 75px" Text="Check customer lease record" Width="221px" />
            <asp:Button ID="Button5" runat="server" Height="37px" Text="Check out" Width="124px" CssClass="auto-style6" style="margin-left: 80px" />
            <br />
            <br />
   
            <img alt="Dock Map" longdesc="Dock Map" src="images/cvm_marina_map.png" style="width: 1297px; height: 873px" /><br />
            <br />
            <asp:Button ID="Map_Button" runat="server" OnClick="Map_Button_Click" Text="Go back to Menu" />
            <br />
            <br />

        </div>
    </form>
        </div>.
     

</asp:Content>

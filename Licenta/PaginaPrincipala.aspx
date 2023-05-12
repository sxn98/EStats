<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipala.aspx.cs" Inherits="Licenta.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        function schimba(){
            document.getElementById('FileUpload1').focus() / click();
        }
   </script>
    <title></title>
</head>
<body style="background-color:#6981B9">
    <form id="form1" runat="server">


        <asp:Panel ID="Panel1" runat="server" Height="73px" style="position:relative; top: -5px; left: -4px;" BackColor="#000066" BorderColor="#003366" BorderStyle="Solid" BorderWidth="10px">
            <asp:Button ID="Button1" runat="server" Text="Pariuri puse" style="position:absolute; top: 0px; left: 1475px; height: 73px; width: 93px;" BorderColor="White" BackColor="#000066" ForeColor="White" OnClick="Button1_Click"/>
            <asp:Button ID="Button2" runat="server" BorderColor="White" style="position:absolute; top: 0px; left: 1383px; height: 73px; width: 93px;" BackColor="#000066" ForeColor="White" Text="Log Out" OnClick="Button2_Click" />
            <asp:Label ID="Label2" runat="server" ForeColor="White" style="position:absolute; top: 4px; left: 129px; height: 32px; width: 93px; right: 1348px;">Bine ai venit, </asp:Label>
            <asp:Button ID="Button4" runat="server" BackColor="#000066" BorderColor="White" ForeColor="White" OnClick="Button4_Click" style="position:absolute; top: 0px; left: 1291px; height: 73px; width: 93px;" Text="Administrare" />
            <asp:LinkButton ID="LinkButton1" runat="server" style="position:absolute; top: 34px; left: 260px; right: 1289px; width: 21px;" Font-Underline="True" ForeColor="White" OnClick="LinkButton1_Click">0</asp:LinkButton>
            <asp:Label ID="Label5" runat="server" Text="Banii dumneavostra" style="position:absolute; top: 34px; left: 129px;" ForeColor="White"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" Font-Underline="True" ForeColor="White" OnClick="LinkButton2_Click" style="position:absolute; top: 5px; left: 220px; right: 1329px; width: 21px;"></asp:LinkButton>
            <asp:Image ID="Image1" runat="server" Width="81px" style="position:absolute; top: 0px; left: 25px; height: 70px; right: 1464px;"/>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server"  style="position:absolute; top: 211px; left: 590px; width: 947px; height: 672px; margin-top: 0px;" BackColor="#000066" Visible="False">
            <asp:GridView ID="GridView1" runat="server" style="position:absolute; top: 38px; left: 30px; height: 179px; width: 224px; " AutoGenerateColumns="False" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderColor="Black" DataKeyNames="NUMEJOC" ForeColor="White">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="" >
                    <ItemStyle ForeColor="White" />
                    </asp:CommandField>
                    <asp:BoundField DataField="NUMEJOC" HeaderText="NUMEJOC" >
                    <ControlStyle BackColor="#FF3399" />
                    </asp:BoundField>
                </Columns>
                <SelectedRowStyle BackColor="Black" />
            </asp:GridView>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderColor="Black" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="5" style="position:absolute; top: 38px; left: 326px; height: 179px; width: 590px; margin-right: 2px;" ForeColor="White">
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="" ShowSelectButton="True" />
                    <asp:BoundField DataField="IDMECI" HeaderText="IDMECI" />
                    <asp:BoundField DataField="JUCATORI" HeaderText="JUCATORI" />
                    <asp:BoundField DataField="DATA" HeaderText="DATA" />
                    <asp:BoundField DataField="ORA" HeaderText="ORA" />
                    <asp:BoundField DataField="PREDICTIE" HeaderText="PREDICTIE" />
                    <asp:BoundField DataField="REZULTAT" HeaderText="REZULTAT" />
                </Columns>
                <SelectedRowStyle BackColor="Black" />
            </asp:GridView>
            <asp:Label ID="Label6" runat="server" Text="Suma pariata" style="position:absolute; top: 579px; left: 7px;" ForeColor="White" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" onkeypress="return isNumberKey(event)" style="position:absolute; top: 578px; left: 105px; width: 50px;" Visible="False"></asp:TextBox>
            <asp:Button ID="Button5" runat="server" Text="Confirma" style="position:absolute; top: 628px; left: 12px;" Visible="False" OnClick="Button5_Click"/>
            <asp:DropDownList ID="DropDownList1" runat="server" style="position:absolute; top: 528px; left: 7px;" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Label ID="Label7" runat="server" ForeColor="White" style="position:absolute; top: 522px; left: 143px; height: 33px; width: 82px;" Visible="False"></asp:Label>
            <asp:Label ID="Label8" runat="server" ForeColor="White" style="position:absolute; top: 523px; left: 97px; height: 32px; width: 82px;" Visible="False">Sansa: </asp:Label>
        </asp:Panel>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUME&quot; FROM &quot;TURNEE&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUME&quot; FROM &quot;TURNEETERMINATE&quot;"></asp:SqlDataSource>

        <asp:Menu ID="Menu2" runat="server" ForeColor="White" style="position:absolute; top: 200px; left: 20px " OnMenuItemClick="Menu2_MenuItemClick">
        </asp:Menu>

            <asp:Label ID="Label4" runat="server" ForeColor="White" style="position:absolute; top: 223px; left: 607px; height: 32px; width: 82px;"></asp:Label>


    </form>
</body>
</html>

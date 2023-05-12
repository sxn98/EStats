<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Licenta.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button 1" />

        <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>

        <asp:Label ID="Label19" runat="server" Text="Label" style="position:absolute; top: 301px; left: 356px;"></asp:Label>

        <asp:Label ID="Label20" runat="server" Text="Label" style="position:absolute; top: 306px; left: 551px;"></asp:Label>

        <asp:Label ID="Label21" runat="server" Text="Label" style="position:absolute; top: 355px; left: 356px;"></asp:Label>

        <asp:Label ID="Label22" runat="server" Text="Label" style="position:absolute; top: 357px; left: 537px;"></asp:Label>

        <asp:Label ID="Label23" runat="server" Text="Label" style="position:absolute; top: 134px; left: 371px;"></asp:Label>

        <asp:Label ID="Label24" runat="server" Text="Label" style="position:absolute; top: 136px; left: 460px;"></asp:Label>

        <asp:Label ID="Label25" runat="server" Text="Label" style="position:absolute; top: 192px; left: 367px;"></asp:Label>

        <asp:Label ID="Label26" runat="server" Text="Label" style="position:absolute; top: 195px; left: 459px;"></asp:Label>

        <asp:Label ID="Label27" runat="server" Text="Label" style="position:absolute; top: 305px; left: 38px; right: 1538px;"></asp:Label>

        <asp:Label ID="Label28" runat="server" Text="Label" style="position:absolute; top: 308px; left: 187px; height: 19px; width: 38px;"></asp:Label>

        <asp:Label ID="Label29" runat="server" Text="Label" style="position:absolute; top: 359px; left: 38px;"></asp:Label>

        <asp:Label ID="Label30" runat="server" Text="Label" style="position:absolute; top: 356px; left: 188px;"></asp:Label>

        <asp:Label ID="Label31" runat="server" Text="Label" style="position:absolute; top: 98px; left: 149px;"></asp:Label>

        <asp:Button ID="Button2" runat="server" Text="Button 2" style="position:absolute; top: 97px; left: 4px;" OnClick="Button2_Click"/>

        <asp:Label ID="Label32" runat="server" Text="Label" style="position:absolute; top: 99px; left: 85px; bottom: 210px;"></asp:Label>

        <asp:Label ID="Label33" runat="server" Text="Label" style="position:absolute; top: 133px; left: 89px;"></asp:Label>

        <asp:Label ID="Label34" runat="server" Text="Label" style="position:absolute; top: 171px; left: 86px;" Visible="False"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" style="position:absolute; top: 86px; left: 786px;" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="IDMECI" HeaderText="IDMECI" />
                <asp:BoundField DataField="PREDICTIE" HeaderText="PREDICTIE" />
                <asp:BoundField DataField="REZULTAT" HeaderText="REZULTAT" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="Label35" runat="server" Text="Label" style="position:absolute; top: 115px; left: 678px;" Visible="False"></asp:Label>

        <asp:Label ID="Label36" runat="server" Text="Label" style="position:absolute; top: 165px; left: 676px;" Visible="False"></asp:Label>

        <asp:Label ID="Label37" runat="server" Text="Label" style="position:absolute; top: 90px; left: 1171px;"></asp:Label>

        <asp:Label ID="Label38" runat="server" Text="Label" style="position:absolute; top: 132px; left: 1168px;"></asp:Label>

        <asp:Label ID="Label39" runat="server" Text="Label" style="position:absolute; top: 181px; left: 1170px;"></asp:Label>

        <asp:Label ID="Label40" runat="server" Text="Matricea ridicata la puterea 4" style="position:absolute; top: 255px; left: 19px;"></asp:Label>

        <asp:Label ID="Label41" runat="server" Text="Matricea construita" style="position:absolute; top: 253px; left: 355px;"></asp:Label>

        <asp:Label ID="Label42" runat="server" Text="Matricea perechilor" style="position:absolute; top: 98px; left: 323px;"></asp:Label>

        <asp:Label ID="Label43" runat="server" Text="Label" style="position:absolute; top: 224px; left: 1169px;"></asp:Label>

        <asp:Calendar ID="Calendar1" runat="server" style="position:absolute; top: 321px; left: 1158px;" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>

        <asp:Label ID="Label44" runat="server" Text="Label" style="position:absolute; top: 266px; left: 1168px;"></asp:Label>


    </form>
</body>
</html>

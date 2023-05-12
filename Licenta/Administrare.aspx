<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrare.aspx.cs" Inherits="Licenta.Administrare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body style="background-color:#6981B9">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 32px; left: 19px; height: 313px; width: 355px;" BorderColor="Black" BorderStyle="Solid" BackColor="#000066">

        <asp:TextBox ID="TextBox4" runat="server" style="position:absolute; top: 250px; left: 130px; width: 101px;"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Grup A" style="position:absolute; top: 150px; left: 33px" ForeColor="White"></asp:Label>

        <asp:Label ID="Label2" runat="server" Text="Grup B" style="position:absolute; top: 200px; left: 33px; height: 21px; width: 55px; bottom: 73px;" ForeColor="White"></asp:Label>

        <asp:Label ID="Label3" runat="server" Text="Joc Jucat" style="position:absolute; top: 100px; left: 33px;" ForeColor="White"></asp:Label>

        <asp:Label ID="Label4" runat="server" Text="Data" style="position:absolute; top: 250px; left: 45px;" ForeColor="White"></asp:Label>


        <asp:Label ID="Label5" runat="server" Text="Adaugare meci" style="position:absolute; top: 10px; left: 26px" ForeColor="White"></asp:Label>
      
            <asp:DropDownList ID="DropDownList1" runat="server" style="position:absolute; top: 150px; left: 130px;" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
      
            <asp:DropDownList ID="DropDownList2" runat="server" style="position:absolute; top: 200px; left: 130px;" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" style="position:absolute; top: 100px; left: 130px;" DataSourceID="SqlDataSource2" DataTextField="NUMEJOC" DataValueField="IDJOC" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
      
            <asp:Label ID="Label21" runat="server" ForeColor="White" style="position:absolute; top: 50px; left: 33px;" Text="Turneu"></asp:Label>
            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="NUME" DataValueField="IDTURNEU" style="position:absolute; top: 50px; left: 130px;" AppendDataBoundItems="True">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
      
            <asp:Label ID="Label22" runat="server" Text="Ora" style="position:absolute; top: 283px; left: 46px;" ForeColor="White"></asp:Label>
            <asp:TextBox ID="TextBox13" runat="server" style="position:absolute; top: 281px; left: 128px; width: 71px;" ToolTip="hh:mm"></asp:TextBox>
      
        </asp:Panel>

            <asp:ImageButton ID="ImageButton2" runat="server" style="position:absolute; top: 286px; left: 269px; height: 16px;" OnClick="ImageButton2_Click" ImageUrl="~/Icoane/calendar.png" />

            <asp:Calendar ID="Calendar2" runat="server" style="position:absolute; top: 303px; left: 263px; width: 181px;" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False" ForeColor="White"></asp:Calendar>

        <asp:Panel ID="Panel3" runat="server" style="position:absolute; top: 55px; left: 844px; height: 103px; width: 304px;" BorderStyle="Solid" BackColor="#000066">
        <asp:TextBox ID="TextBox10" runat="server" style="position:absolute; top: 50px; left: 130px;"></asp:TextBox>

        <asp:Label ID="Label12" runat="server" Text="Nume grup" style="position:absolute; top: 55px; left: 38px" ForeColor="White"></asp:Label>

        <asp:Label ID="Label16" runat="server" Text="Adaugare grup" style="position:absolute; top: 10px; left: 26px;" ForeColor="White"></asp:Label>


            

        </asp:Panel>

        <asp:Panel ID="Panel4" runat="server" style="position:absolute; top: 53px; left: 1167px; height: 102px; width: 304px;" BorderStyle="Solid" BackColor="#000066">
        <asp:TextBox ID="TextBox11" runat="server" style="position:absolute; top: 50px; left: 130px;"></asp:TextBox>

        <asp:Label ID="Label17" runat="server" Text="Nume joc" style="position:absolute; top: 50px; left: 33px" ForeColor="White"></asp:Label>

        <asp:Label ID="Label18" runat="server" Text="Adaugare joc" style="position:absolute; top: 10px; left: 26px;" ForeColor="White"></asp:Label>


            <asp:Panel ID="Panel5" runat="server" style="position:absolute; top: -1px; left: -661px; height: 182px; width: 304px;" BorderStyle="Solid" BackColor="#000066">
                <asp:TextBox ID="TextBox12" runat="server" style="position:absolute; top: 50px; left: 130px;"></asp:TextBox>
                <asp:Label ID="Label19" runat="server" ForeColor="White" style="position:absolute; top: 50px; left: 33px" Text="Nume turneu"></asp:Label>
                <asp:Label ID="Label20" runat="server" ForeColor="White" style="position:absolute; top: 10px; left: 26px;" Text="Adaugare turneu"></asp:Label>
                <asp:TextBox ID="TextBox14" runat="server" style="position:absolute; top: 94px; left: 132px; width: 101px;"></asp:TextBox>
            <asp:TextBox ID="TextBox15" runat="server" style="position:absolute; top: 131px; left: 132px; width: 101px;"></asp:TextBox>
            <asp:Label ID="Label23" runat="server" ForeColor="White" style="position:absolute; top: 93px; left: 29px" Text="Data inceput"></asp:Label>
            <asp:Label ID="Label24" runat="server" ForeColor="White" style="position:absolute; top: 131px; left: 33px" Text="Data sfarsit"></asp:Label>
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Icoane/calendar.png" OnClick="ImageButton3_Click" style="position:absolute; top: 98px; left: 265px; height: 16px; width: 16px;" />
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Icoane/calendar.png" OnClick="ImageButton4_Click" style="position:absolute; top: 133px; left: 265px; height: 16px;" />
            <asp:Calendar ID="Calendar3" runat="server" ForeColor="White" OnSelectionChanged="Calendar3_SelectionChanged" style="position:absolute; top: 117px; left: 273px; width: 181px;" Visible="False"></asp:Calendar>
            <asp:Calendar ID="Calendar4" runat="server" ForeColor="White" OnSelectionChanged="Calendar4_SelectionChanged" style="position:absolute; top: 154px; left: 274px; width: 181px;" Visible="False"></asp:Calendar>

            </asp:Panel>


        </asp:Panel>

        <asp:Button ID="Button1" runat="server" Text="Adauga meci turneu" style="position:absolute; top: 352px; left: 38px; width: 139px; height: 28px;" OnClick="Button1_Click" />

        <asp:Button ID="Button3" runat="server" Text="Adauga grup" style="position:absolute; top: 183px; left: 1042px; right: 459px;" OnClick="Button3_Click" />

        <asp:Button ID="Button4" runat="server" Text="Adauga joc" style="position:absolute; top: 163px; left: 1195px;" OnClick="Button4_Click" />

        <asp:Button ID="Button5" runat="server" Text="Adauga turneu" style="position:absolute; top: 255px; left: 511px;" OnClick="Button5_Click" />

        <asp:Panel ID="Panel6" runat="server" style="position:absolute; top: 489px; left: 20px; height: 101px; width: 193px; right: 1391px; margin-right: 6px;" Visible="False">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMEGRUP&quot;, &quot;ID&quot; FROM &quot;GRUPURI&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TURNEE&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMEJOC&quot;, &quot;IDJOC&quot; FROM &quot;JOCURI&quot;" ></asp:SqlDataSource>
        </asp:Panel>

        <asp:Button ID="Button6" runat="server" Text="Inapoi" style="position:absolute; top: 396px; left: 37px;" OnClick="Button6_Click"/>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Licenta.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:#6981B9">
    <form id="form1" runat="server">

        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 202px; left: 555px; height: 233px; width: 502px;" BackColor="#000066" BorderWidth="10px">
            <asp:Label ID="Label1" runat="server" Text="Nume" style="position:absolute; top: 28px; left: 21px; height: 32px; width: 82px;" ForeColor="White"></asp:Label>
            <asp:Label ID="Label2" runat="server" ForeColor="White" style="position:absolute; top: 74px; left: 21px; height: 32px; width: 82px;" Text="Parola"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="position:absolute; top: 25px; left: 95px;"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" style="position:absolute; top: 74px; left: 95px;" TextMode="Password"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Inregistreaza-te" style="position:absolute; top: 168px; left: 309px;" BackColor="#000099" BorderColor="#000099" BorderWidth="5px" ForeColor="White" OnClick="Button2_Click"/>
            <asp:Button ID="Button1" runat="server" BackColor="#000099" BorderColor="#000099" BorderWidth="5px" ForeColor="White" OnClick="Button1_Click" style="position:absolute; top: 168px; left: 89px;" Text="Logheaza-te" />
        </asp:Panel>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="Licenta.Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:#6981B9">
    <form id="form1" runat="server">

        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 202px; left: 555px; height: 331px; width: 701px;" BackColor="#000066" BorderWidth="10px">
            <asp:Label ID="Label1" runat="server" Text="Nume" style="position:absolute; top: 28px; left: 21px; height: 32px; width: 82px; bottom: 271px;" ForeColor="White"></asp:Label>
            <asp:Label ID="Label2" runat="server" ForeColor="White" style="position:absolute; top: 74px; left: 21px; height: 32px; width: 82px;" Text="Parola"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="position:absolute; top: 25px; left: 95px;" ></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" style="position:absolute; top: 75px; left: 95px;" TextMode="Password" ></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Creaza Cont" style="position:absolute; top: 268px; left: 275px;" BackColor="#000099" BorderColor="#000099" BorderWidth="5px" ForeColor="White" OnClick="Button2_Click"/>
            <asp:Label ID="Label3" runat="server" ForeColor="White" style="position:absolute; top: 116px; left: 21px; height: 38px; width: 82px;" Text="Confirma Parola"></asp:Label>
            <asp:Label ID="Label4" runat="server" ForeColor="White" style="position:absolute; top: 174px; left: 21px; height: 32px; width: 82px;" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" style="position:absolute; top: 124px; left: 95px;" TextMode="Password" ></asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server" style="position:absolute; top: 170px; left: 95px;"></asp:TextBox>
        </asp:Panel>

    </form>
</body>
</html>

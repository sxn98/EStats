<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pariuri.aspx.cs" Inherits="Licenta.Pariuri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body  style="background-color:#6981B9">
    <form id="form1" runat="server">

        <asp:GridView ID="GridView1" runat="server" ForeColor="White">
        </asp:GridView>

        <asp:Button ID="Button1" runat="server" Text="Salveaza" style="position:absolute; top: 53px; left: 806px;" OnClick="Button1_Click"/>

        <asp:Label ID="Label1" runat="server" Text="Schimba poza" style="position:absolute; top: 22px; left: 805px;" ForeColor="White"></asp:Label>

        <asp:FileUpload ID="FileUpload1" runat="server" style="position:absolute; top: 19px; left: 903px;" ForeColor="White"/>

    </form>
</body>
</html>

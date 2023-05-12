<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdaugareBani.aspx.cs" Inherits="Licenta.AdaugareBani" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script>
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;    
         return true;
           }
           function isLetterKey(evt) {
               var charCode = (evt.which) ? evt.which : evt.keyCode;
               if (charCode > 31 && (charCode < 48 || charCode > 57))
                   return true;
               return false;
           }
   </script>
    <title></title>
</head>
<body style="background-color:#6981B9">
    <form id="form1" runat="server">

        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 39px; left: 507px; height: 379px; width: 383px; margin-top: 27px;" BackColor="#000066">
            <asp:TextBox ID="TextBox1" runat="server" style="position:absolute; top: 70px; left: 130px; width: 130px;"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" onkeypress="return isLetterKey(event)" style="position:absolute; top: 110px; left: 130px; width: 130px;"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" onkeypress="return isNumberKey(event)" style="position:absolute; top: 150px; left: 150px; width: 47px;"></asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server" onkeypress="return isNumberKey(event)" style="position:absolute; top: 190px; left: 160px; width: 40px;" MaxLength="4"></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server" onkeypress="return isNumberKey(event)" style="position:absolute; top: 190px; left: 210px; width: 40px;" MaxLength="4"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" onkeypress="return isNumberKey(event)" style="position:absolute; top: 190px; left: 260px; width: 40px;" MaxLength="4"></asp:TextBox>

            <asp:Label ID="Label1" runat="server" Text="Numele" style="position:absolute; top: 70px; left: 46px;" ForeColor="White"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Prenumele" style="position:absolute; top: 110px; left: 46px;" ForeColor="White"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Suma dorita($)" style="position:absolute; top: 150px; left: 48px;" ForeColor="White"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="Numarul cardului" style="position:absolute; top: 190px; left: 48px;" ForeColor="White"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="position:absolute; top: 230px; left: 48px;" Text="Codul de protectie" ForeColor="White"></asp:Label>

            <asp:RadioButton ID="RadioButton1" runat="server" style="position:absolute; top: 20px; left: 12px; width: 23px; height: 22px;" AutoPostBack="True" GroupName="plata" />

            <asp:RadioButton ID="RadioButton2" runat="server" style="position:absolute; top: 20px; left: 177px; width: 23px; height: 22px;" AutoPostBack="True" GroupName="plata" />
            <asp:Image ID="Image1" runat="server" style="position:absolute; top: 10px; left: 60px; height: 50px; width: 80px;" ImageUrl="~/Icoane/Visa-Logo.png"/>

            <asp:Image ID="Image2" runat="server" style="position:absolute; top: 7px; left: 226px; height: 50px; width: 80px;" ImageUrl="~/Icoane/MasterCard_Logo.png" />

            <asp:Button ID="Button1" runat="server" Text="Confirmare" style="position:absolute; top: 300px; left: 111px;" OnClick="Button1_Click" BackColor="#000099" BorderColor="#000099" ForeColor="White"/>



            <asp:TextBox ID="TextBox7" runat="server" MaxLength="3" onkeypress="return isNumberKey(event)" style="position:absolute; top: 230px; left: 180px; width: 40px;"></asp:TextBox>



        </asp:Panel>

    </form>
</body>
</html>

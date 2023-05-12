using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using Oracle.ManagedDataAccess.Client;

namespace Licenta
{
    public partial class Signin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Verificare())
            {
                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into Utilizatori(Nume,Parola,Email) values('" + TextBox1.Text + "','" + Eramake.eCryptography.Encrypt(TextBox2.Text) + "','" + TextBox4.Text + "')";

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Cont realizat cu succes!");
                Response.Redirect("Login.aspx"); 
            }
                

        }
        private bool Verificare()
        {
            if(TextBox1.Text=="")
            {
                MessageBox.Show("completati numele");
                return false;
            }
            if (TextBox2.Text=="")
            {
                MessageBox.Show("completati parola");
                return false;
            }
            if (TextBox3.Text=="")
            {
                MessageBox.Show("completati verificarea parolei");
                return false;
            }
            if (TextBox3.Text != TextBox2.Text)
            {
                MessageBox.Show("Verificarea parolei este gresita");
                return false;
            }
            if (TextBox2.Text.Length < 8)
            {
                MessageBox.Show("Parola este prea scurta");
                return false;
            }
            if (TextBox4.Text=="")
            {
                MessageBox.Show("completati email-ul");
                return false;
            }
            if (!TextBox4.Text.Contains("@"))
            {
                MessageBox.Show("email incorect");
                return false;
            }
            return true;

        }

    }
}
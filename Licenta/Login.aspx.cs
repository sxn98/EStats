using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using Oracle.ManagedDataAccess.Client;

namespace Licenta
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleDataAdapter da = new OracleDataAdapter("Select Count(*) From Utilizatori Where Nume='" + TextBox1.Text + "' AND Parola='" + Eramake.eCryptography.Encrypt(TextBox2.Text) + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows[0][0].ToString() == "1" && Verificare())
            {
                Global.nume = TextBox1.Text;
                Response.Redirect("PaginaPrincipala.aspx");
            }
            else
                MessageBox.Show("Numele sau parola este gresita!");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("Signin.aspx");
        }
        private bool Verificare()
        {
            if (TextBox1.Text == "")
            {
                MessageBox.Show("completati numele");
                return false;
            }
            if (TextBox2.Text == "")
            {
                MessageBox.Show("completati parola");
                return false;
            }
            return true;

        }
    }
}

public static class Global
{
    public static string nume;
    public static int cont;
}
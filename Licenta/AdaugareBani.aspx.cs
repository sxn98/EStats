using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Licenta
{
    public partial class AdaugareBani : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "" || TextBox7.Text == "")
            {
                MessageBox.Show("Completati datele!");
                return;
            }
            else
            {

                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "update UTILIZATORI set CONT=" + TextBox3.Text + "+" + Global.cont + " WHERE NUME='" + Global.nume + "'";
                MessageBox.Show(cmd.CommandText);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Bani adaugati cu succes");
                Response.Redirect("PaginaPrincipala.aspx");
            }
        }
    }
}
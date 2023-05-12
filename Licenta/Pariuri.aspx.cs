using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Licenta
{
    public partial class Pariuri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            con.Open();
            OracleCommand cmd = new OracleCommand("SELECT TURNEE.NUME,GRUPURI.NUMEGRUP||' vs. '||g.NUMEGRUP MECI,TO_CHAR(MECIURI.DATA, 'DD-MON-RRRR') as DATA,MECIURI.ORA,PARIURI.ECHIPA,PARIURI.SANSA,PARIURI.SUMAPARIATA,PARIURI.CASTIG FROM((((UTILIZATORI INNER JOIN PARIURI ON UTILIZATORI.IDUTILIZATOR = PARIURI.IDUTILIZATOR) INNER JOIN MECIURI ON MECIURI.IDMECI = PARIURI.IDMECI) INNER JOIN GRUPURI ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID) INNER JOIN TURNEE ON MECIURI.IDTURNEU=TURNEE.IDTURNEU WHERE UTILIZATORI.NUME = '" + Global.nume+"'", con);
            OracleDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(FileUpload1.PostedFile!=null)
            {
                string extensie = Path.GetExtension(FileUpload1.PostedFile.FileName);
                if(extensie!=".jpeg" && extensie!=".jpg" && extensie != ".png")
                {
                    MessageBox.Show("Aceasta extensie nu este acceptata");
                    return;
                }
                if (FileUpload1.PostedFile.ContentLength < 512000)
                {

                    string nume = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Poze/") + nume);
                }
                else
                {
                    MessageBox.Show("Dimensiunea fisierului este prea mare");
                }
                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE UTILIZATORI SET POZA='" + Path.GetFileName(FileUpload1.PostedFile.FileName) + "' WHERE NUME='"+Global.nume+"'";
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


            }
        }
    }
}
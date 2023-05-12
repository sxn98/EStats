using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Licenta
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static readonly Random rnd = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleDataAdapter DA = new OracleDataAdapter("SELECT POZA,ADMINISTRATOR FROM UTILIZATORI WHERE NUME='"+Global.nume+"'", con);//WHERE DATASFARSIT>sysdate
            DataTable DT = new DataTable();
            DA.Fill(DT);
            Image1.ImageUrl = "~/Poze/" + DT.Rows[0][0];

            if (Int32.Parse(DT.Rows[0][1].ToString()) == 0)
                Button4.Visible = false;

            LinkButton2.Text=Global.nume;
            Menu2.Items.Clear();
            MenuItem parinte2 = new MenuItem("Turnee");
            Menu2.Items.Add(parinte2);
           
            OracleDataAdapter da = new OracleDataAdapter("SELECT IDTURNEU,CONCAT(CONCAT(CONCAT(CONCAT(nume,' '), DATAINCEPUT),' '),  DATASFARSIT) NUME FROM TURNEE", con);//WHERE DATASFARSIT>sysdate
            DataTable dt = new DataTable();
            da.Fill(dt);

            foreach (DataRow drr in dt.Rows)
            {
                MenuItem men2 = new MenuItem(drr["NUME"].ToString());
                Menu2.FindItem("Turnee").ChildItems.Add(men2);
            }

            if (!Page.IsPostBack)
            {

                DateTime dateAndTime = DateTime.Now;
                //Label34.Text = dateAndTime.ToString("dd-MMM-yyyy H:mm");

                OracleDataAdapter daaa = new OracleDataAdapter();
                OracleDataAdapter daaaa = new OracleDataAdapter();
                OracleDataAdapter dAAA = new OracleDataAdapter();
                OracleDataAdapter dAAAA = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "select MECIURI.IDMECI,MECIURI.PREDICTIE,MECIURI.REZULTAT,PARIURI.SANSA FROM ((MECIURI INNER JOIN PARIURI ON MECIURI.IDMECI=PARIURI.IDMECI) INNER JOIN GRUPURI ON MECIURI.IDGRUPA=GRUPURI.ID) INNER JOIN GRUPURI g ON g.ID=MECIURI.IDGRUPB WHERE TO_DATE(MECIURI.DATA, 'dd-MON-YYYY') <= (SELECT DATA FROM(select TO_DATE(sysdate, 'dd-MON-yyyy') as DATA, TO_DATE(sysdate, 'HH24:MI') as ORA from dual)) AND MECIURI.REZULTAT is null ORDER BY PARIURI.IDUTILIZATOR";
                daaa.SelectCommand = cmd;
                cmd.Connection = con;
                DataTable dttt = new DataTable();
                DataTable dTTT = new DataTable();
                DataTable dTTTT = new DataTable();
                DataTable dtttt = new DataTable();
                daaa.Fill(dttt);
                cmd.CommandText = "select MECIURI.IDMECI,MECIURI.PREDICTIE,MECIURI.REZULTAT FROM(MECIURI INNER JOIN GRUPURI ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON g.ID = MECIURI.IDGRUPB WHERE TO_DATE(MECIURI.DATA, 'dd-MON-YYYY') <= (SELECT DATA FROM(select TO_DATE(sysdate, 'dd-MON-yyyy') as DATA from dual)) AND MECIURI.REZULTAT is null ORDER BY MECIURI.IDMECI";
                daaaa.SelectCommand = cmd;
                cmd.Connection = con;
                daaaa.Fill(dtttt);
                con.Open();
                int x = dttt.Rows.Count;
                String s = "";
                for(int ii = 0; ii < dtttt.Rows.Count; ii++)
                {
                    if (dttt.Rows[ii][2].ToString() == "")
                    {

                        double sansa = Double.Parse(dttt.Rows[ii][1].ToString());
                        dttt.Rows[ii][2] = generare(sansa);
                        for (int iii = 0; iii < x; iii++)
                        {
                            dttt.Rows[iii][2] = dttt.Rows[ii][2];

                        }

                        s = dttt.Rows[ii][2].ToString();

                        cmd.CommandText = "update MECIURI set REZULTAT='" + s + "' WHERE IDMECI=" + dttt.Rows[ii][0];
                        cmd.ExecuteNonQuery();

                    }

                        //MessageBox.Show("nu mai e null");
                    con.Close();
                }

                for (int i = 0; i < x; i++)
                {

                    cmd.CommandText = "Select IDUTILIZATOR,SUMAPARIATA,SANSA,CASTIG FROM PARIURI WHERE IDMECI=" + dttt.Rows[i][0] + " and CASTIG IS NULL AND ROWNUM=1 ORDER BY IDUTILIZATOR";

                    if ((dttt.Rows[i][2].ToString() == "W" && dttt.Rows[i][3].ToString() == dttt.Rows[i][1].ToString()) || (dttt.Rows[i][2].ToString() == "L" && dttt.Rows[i][3].ToString() != dttt.Rows[i][1].ToString()))
                    {
                        con.Open();
                        dAAA.SelectCommand = cmd;
                        dAAA.Fill(dTTT);
                        int y = dTTT.Rows.Count;

                        for (int j = 0; j < y; j++)
                        {
                            cmd.CommandText = "update PARIURI set CASTIG=ROUND((100/" + dTTT.Rows[j][2] + ")*" + dTTT.Rows[j][1] + ") WHERE IDMECI=" + dttt.Rows[i][0] + " AND IDUTILIZATOR=" + dTTT.Rows[j][0]+"AND CASTIG IS NULL AND ROWNUM=1";
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = "UPDATE UTILIZATORI SET CONT=CONT+ROUND((100/" + dTTT.Rows[j][2] + ")*" + dTTT.Rows[j][1] + ") WHERE IDUTILIZATOR=" + dTTT.Rows[j][0];
                            cmd.ExecuteNonQuery();
                        }
                        dTTT.Clear();
                        con.Close();
                    }
                    else
                    {
                        //MessageBox.Show("Intra si aici"+i);
                        con.Open();
                        dAAAA.SelectCommand = cmd;
                        dAAAA.Fill(dTTTT);
                        int y = dTTTT.Rows.Count;
                        for (int j = 0; j < y; j++)
                        {
                            cmd.CommandText = "update PARIURI set CASTIG=0 WHERE IDMECI=" + dttt.Rows[i][0] + " AND IDUTILIZATOR=" + dTTTT.Rows[j][0] +"AND CASTIG IS NULL AND ROWNUM=1";
                            cmd.ExecuteNonQuery();
                        }
                        dTTTT.Clear();
                        con.Close();
                    }

                }


            }
            OracleDataAdapter daa = new OracleDataAdapter("SELECT CONT FROM UTILIZATORI WHERE NUME='" + Global.nume + "'", con);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            LinkButton1.Text = dtt.Rows[0][0].ToString() + "$";
            Global.cont = Int32.Parse(dtt.Rows[0][0].ToString());
        }
        private string generare(double sansa)
        {

            if (sansa > rnd.Next(0, 100))
                return "W";
            else return "L";

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            Global.nume = "";
            Response.Redirect("Login.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrare.aspx");
        }

            /*  DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataColumn col in dt.Columns)
            {

                Label3.Text = Menu1.SelectedValue.ToString();
                BoundField newColumnName = new BoundField();

                newColumnName.DataField = col.ColumnName;
                newColumnName.HeaderText = "New Header";

                GridView1.Columns.Add(newColumnName);
            }*/
        
        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            Panel2.Visible = true;
            GridView1.SelectedIndex = -1;
            GridView2.SelectedIndex = -1;
            GridView2.DataSource = null;
            GridView2.DataBind();
            Label4.Text = Menu2.SelectedValue.Remove(Menu2.SelectedValue.IndexOf(" "));
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            con.Open();
            OracleCommand cmd = new OracleCommand("SELECT DISTINCT JOCURI.NUMEJOC FROM (MECIURI INNER JOIN JOCURI ON MECIURI.JOCJUCAT=JOCURI.IDJOC) INNER JOIN TURNEE ON TURNEE.IDTURNEU=MECIURI.IDTURNEU WHERE TURNEE.NUME='" + Menu2.SelectedValue.Remove(Menu2.SelectedValue.IndexOf(" ")) + "' ", con); //AND MECIURI.DATA>sysdate
            OracleDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            con.Close();

            DropDownList1.Items.Clear();
            Label8.Visible = false;
            Label7.Visible = false;
            TextBox1.Visible = false;
            Label6.Visible = false;
            DropDownList1.Visible = false;
            Button5.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Label4.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
            GridView2.SelectedIndex = -1;
            GridView2.Columns[1].Visible = true;
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");

            con.Open();
            OracleCommand cmd = new OracleCommand("SELECT IDMECI,GRUPURI.NUMEGRUP||' vs. '||g.NUMEGRUP JUCATORI,TO_CHAR(MECIURI.DATA, 'DD-MON-RRRR') as DATA,MECIURI.ORA,MECIURI.PREDICTIE,MECIURI.REZULTAT FROM(((MECIURI INNER JOIN TURNEE ON MECIURI.IDTURNEU = TURNEE.IDTURNEU) INNER JOIN GRUPURI ON MECIURi.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID) INNER JOIN JOCURI ON MECIURI.JOCJUCAT = JOCURI.IDJOC WHERE TURNEE.NUME = '" + Label4.Text+"' AND JOCURI.NUMEJOC = '"+GridView1.SelectedRow.Cells[1].Text+"' ORDER BY MECIURI.DATA", con);
            OracleDataReader rdr = cmd.ExecuteReader();
            GridView2.DataSource = rdr;
            GridView2.DataBind();
            con.Close();
            GridView2.Columns[1].Visible = false;

            DropDownList1.Items.Clear();
            Label8.Visible = false;
            Label7.Visible = false;
            TextBox1.Visible = false;
            Label6.Visible = false;
            DropDownList1.Visible = false;
            Button5.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdaugareBani.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pariuri.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Columns[1].Visible = true;
            DropDownList1.Items.Clear();
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleCommand cmd = new OracleCommand();
            cmd.CommandText = "SELECT GRUPURI.NUMEGRUP,g.NUMEGRUP FROM (((GRUPURI INNER JOIN MECIURI ON GRUPURI.ID=MECIURI.IDGRUPA) INNER JOIN GRUPURI g ON g.ID=MECIURI.IDGRUPB) INNER JOIN JOCURI ON JOCURI.IDJOC=MECIURI.JOCJUCAT) INNER JOIN TURNEE ON TURNEE.IDTURNEU=MECIURI.IDTURNEU WHERE JOCURI.NUMEJOC = '" + GridView1.SelectedValue.ToString() + "' AND TURNEE.NUME = '" + Label4.Text + "' AND MECIURI.IDMECI =" + Int32.Parse(GridView2.SelectedRow.Cells[1].Text);
            cmd.Connection = con;
            con.Open();
            GridView2.Columns[1].Visible = false;
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            DropDownList1.Items.Add(dt.Rows[0][0].ToString());
            DropDownList1.Items.Add(dt.Rows[0][1].ToString());

            if (GridView2.SelectedRow.Cells[6].Text.ToString() == "W" || GridView2.SelectedRow.Cells[6].Text.ToString() == "L")
            {
                DropDownList1.Items.Clear();
                Label8.Visible = false;
                Label7.Visible = false;
                TextBox1.Visible = false;
                Label6.Visible = false;
                DropDownList1.Visible = false;
                Button5.Visible = false;
            }
            else
            {
                DropDownList1.DataBind();
                Label8.Visible = true;
                Label7.Visible = true;
                Label7.Text = "";
                TextBox1.Visible = true;
                Label6.Visible = true;
                DropDownList1.Visible = true;
                Button5.Visible = true;
                
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Columns[1].Visible = true;
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleCommand cmd = new OracleCommand();
            cmd.CommandText = "SELECT GRUPURI.NUMEGRUP,g.NUMEGRUP,meciuri.predictie FROM (((GRUPURI INNER JOIN MECIURI ON GRUPURI.ID=MECIURI.IDGRUPA) INNER JOIN GRUPURI g ON g.ID=MECIURI.IDGRUPB) INNER JOIN JOCURI ON JOCURI.IDJOC=MECIURI.JOCJUCAT) INNER JOIN TURNEE ON TURNEE.IDTURNEU=MECIURI.IDTURNEU WHERE JOCURI.NUMEJOC = '" + GridView1.SelectedValue.ToString() + "' AND TURNEE.NUME = '" + Label4.Text + "' AND MECIURI.IDMECI =" + Int32.Parse(GridView2.SelectedRow.Cells[1].Text);
            cmd.Connection = con;
            con.Open();
            GridView2.Columns[1].Visible = false;
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            if (DropDownList1.SelectedValue==dt.Rows[0][0].ToString())
            {
                double a = Convert.ToDouble(dt.Rows[0][2].ToString());
                Label7.Text = a.ToString();
            }
            else
            {
                 double a = Convert.ToDouble(dt.Rows[0][2].ToString());
                 a = 100-a;
                Label7.Text = a.ToString();
            }
               
            
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pariuri.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if(Global.cont-Int32.Parse(TextBox1.Text) < 0)
            {
                MessageBox.Show("Bani insuficienti");
                return;
            }

            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = con;
            cmd.CommandText = "update UTILIZATORI set CONT=" + Global.cont + "-"+TextBox1.Text+" WHERE NUME='" + Global.nume + "'";
           // MessageBox.Show(cmd.CommandText);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            OracleDataAdapter daa = new OracleDataAdapter("SELECT IDUTILIZATOR,CONT FROM UTILIZATORI WHERE NUME='" + Global.nume + "'", con);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            LinkButton1.Text = dtt.Rows[0][1].ToString() + "$";
            Global.cont = Int32.Parse(dtt.Rows[0][0].ToString());
            GridView2.Columns[1].Visible = true;
            cmd.CommandText = "INSERT INTO PARIURI(IDMECI,IDUTILIZATOR,ECHIPA,SANSA,SUMAPARIATA) VALUES("+ Int32.Parse(GridView2.SelectedRow.Cells[1].Text) + ","+ dtt.Rows[0][0].ToString() + ",'" + DropDownList1.SelectedValue + "'," + Convert.ToDouble(Label7.Text) + "," +TextBox1.Text+")";
            //MessageBox.Show(cmd.CommandText);
            GridView2.Columns[1].Visible = false;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Pariu realizat cu succes!");
        }


    }
}
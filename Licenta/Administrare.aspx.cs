using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Licenta
{
    public partial class Administrare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == "" || TextBox13.Text == "" || DropDownList6.SelectedItem.ToString() is "" || DropDownList3.SelectedItem.ToString() is "" || DropDownList2.SelectedItem.ToString() is "")
            {
                MessageBox.Show("Completati toate campurile!");
            }
            else
            {

                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleDataAdapter da = new OracleDataAdapter("SELECT MECIURI.REZULTAT FROM(MECIURI INNER JOIN GRUPURI  ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID WHERE((GRUPURI.NUMEGRUP = '"+DropDownList1.SelectedItem+"' AND g.NUMEGRUP = '"+DropDownList2.SelectedItem+ "') OR (GRUPURI.NUMEGRUP = '" + DropDownList2.SelectedItem + "' AND g.NUMEGRUP = '" + DropDownList1.SelectedItem + "')) AND MECIURI.JOCJUCAT = "+DropDownList3.SelectedValue+ " AND MECIURI.REZULTAT IS NOT NULL ORDER BY MECIURI.IDMECI", con);
                OracleDataAdapter daa = new OracleDataAdapter("Select COUNT(MECIURI.REZULTAT) FROM(MECIURI INNER JOIN GRUPURI  ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID WHERE((GRUPURI.NUMEGRUP = '" + DropDownList1.SelectedItem + "' AND g.NUMEGRUP = '" + DropDownList2.SelectedItem + "') OR (GRUPURI.NUMEGRUP = '" + DropDownList2.SelectedItem + "' AND g.NUMEGRUP = '" + DropDownList1.SelectedItem + "')) AND MECIURI.JOCJUCAT = " + DropDownList3.SelectedValue + " ORDER BY MECIURI.IDMECI", con);
                OracleDataAdapter daaa = new OracleDataAdapter("select nume,datainceput,datasfarsit from turnee where nume='"+DropDownList6.SelectedItem+"'",con);
                // MessageBox.Show("SELECT MECIURI.REZULTAT FROM(MECIURI INNER JOIN GRUPURI  ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID WHERE((GRUPURI.NUMEGRUP = '" + DropDownList1.SelectedItem + "' AND g.NUMEGRUP = '" + DropDownList2.SelectedItem + "') OR (GRUPURI.NUMEGRUP = '" + DropDownList2.SelectedItem + "' AND g.NUMEGRUP = '" + DropDownList1.SelectedItem + "')) AND MECIURI.JOCJUCAT = " + DropDownList3.SelectedValue + " ORDER BY MECIURI.IDMECI");
                DataTable dt = new DataTable();
                DataTable dtt = new DataTable();
                DataTable dttt = new DataTable();
                da.Fill(dt);
                daa.Fill(dtt);
                daaa.Fill(dttt);
                int a = 0;
                for (int i= 0;i< dttt.Rows.Count;i++)
                if (DateTime.Compare(DateTime.Parse(TextBox4.Text), DateTime.Parse(dttt.Rows[i][1].ToString())) >= 0 && DateTime.Compare(DateTime.Parse(TextBox4.Text), DateTime.Parse(dttt.Rows[i][2].ToString())) <= 0)
                {
                        a++;


                }else
                 {

                        a--;
                 }
                if (a <0)
                {
                    MessageBox.Show("Meciul este programat intr-o data in care nici un turneu cu acest nume nu are loc"); return;
                }
                int nr = Convert.ToInt32(dtt.Rows[0][0]);
                string rezultat = "";

                 for (int i = 0; i < nr; i++)
                 {/*
                     if (Convert.ToInt32(dt.Rows[i][0]) == Int32.Parse(DropDownList1.SelectedValue))
                         rezultat = rezultat + "W";
                     else if (Convert.ToInt32(dt.Rows[i][1]) == Int32.Parse(DropDownList1.SelectedValue))
                         rezultat = rezultat + "L";
                         */
                     if (dt.Rows[i][0].ToString() == "W")
                         rezultat = rezultat + "W";
                     else if (dt.Rows[i][0].ToString() == "L")
                         rezultat = rezultat + "L";

                 }
                 char[] lista = rezultat.ToCharArray();
                 double ultimMeci = calcul(lista, nr);

                 OracleCommand cmd = new OracleCommand();
                 cmd.Connection = con;
                 cmd.CommandText = "insert into MECIURI(IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,ORA,PREDICTIE) values(" + DropDownList6.SelectedValue + "," + DropDownList1.SelectedValue + "," + DropDownList2.SelectedValue + "," + DropDownList3.SelectedValue + ",'"+TextBox4.Text+"','"+TextBox13.Text+"'," + ultimMeci*100+")";
                // MessageBox.Show(cmd.CommandText);
                 con.Open();
                 cmd.ExecuteNonQuery();
                 con.Close();
                 MessageBox.Show("Meci adaugat!");  
            }
        }
        private double calcul(char[] lista, int nr)
        {
            int ww = 0, wl = 0, lw = 0, ll = 0, tw = 0, tl = 0;
            double WW = 0, WL = 0, LW = 0, LL = 0;
            for (int i = 0; i < nr - 1; i++)
            {
                if (lista[i].ToString().Equals("W") && lista[i + 1].ToString().Equals("W"))
                    ww++;
                if (lista[i].ToString().Equals("W") && lista[i + 1].ToString().Equals("L"))
                    wl++;
                if (lista[i].ToString().Equals("L") && lista[i + 1].ToString().Equals("W"))
                    lw++;
                if (lista[i].ToString().Equals("L") && lista[i + 1].ToString().Equals("L"))
                    ll++;
            }
            tw = wl + ww;
            tl = ll + lw;
            WW = (double)ww / tw;
            WL = (double)wl / tw;
            LW = (double)lw / tl;
            LL = (double)ll / tl;

            double WW2 = 0, WL2 = 0, LW2 = 0, LL2 = 0, WW4 = 0, WL4 = 0, LW4 = 0, LL4 = 0;
            LL2 = (LL * LL) + (LW * WL);
            LW2 = (LL * LW) + (LW * WW);
            WL2 = (WL * LL) + (WW * WL);
            WW2 = (WL * LW) + (WW * WW);

            LL4 = (LL2 * LL2) + (LW2 * WL2);
            LW4 = (LL2 * LW2) + (LW2 * WW2);
            WL4 = (WL2 * LL2) + (WW2 * WL2);
            WW4 = (WL2 * LW2) + (WW2 * WW2);

            if (lista[nr - 1].ToString().Equals("W"))
                return WW4;
            else return LW4;


        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible == false)
                Calendar2.Visible = true;
            else Calendar2.Visible = false;
        }
        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {

            if(DateTime.Parse(DateTime.Now.ToString("dd-MMM-yyyy")) > DateTime.Parse(Calendar2.SelectedDate.ToString("dd-MMM-yyyy")))
            {
                MessageBox.Show("Data introdusa trebuie sa fie mai mare fata de cea din momentul acesta");
                return;
            }
            TextBox4.Text = Calendar2.SelectedDate.ToString("dd-MMM-yyyy");
            Calendar2.Visible = false;
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox10.Text != "")
            {
                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into GRUPURI(NUMEGRUP) values('" + TextBox10.Text + "')";
                //MessageBox.Show(cmd.CommandText);
                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch { MessageBox.Show("Grupul exista deja");return; }

                con.Close();
                MessageBox.Show("Grup nou adaugat!");
            }
            else
            {
                MessageBox.Show("Introduceti numele unei echipe noi");
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox11.Text != "")
            {
                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into JOCURI(NUMEJOC) values('" + TextBox11.Text + "')";
               // MessageBox.Show(cmd.CommandText);
                con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch { MessageBox.Show("Jocul deja exista");return; }
                con.Close();
                MessageBox.Show("Joc adaugat!");
            }
            else
            {
                MessageBox.Show("Introduceti numele unui joc nou");
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

            if (TextBox12.Text != "" && TextBox14.Text !="" && TextBox15.Text!="")
            {
                if (DateTime.Compare(DateTime.Parse(TextBox14.Text), DateTime.Parse(TextBox15.Text)) >= 0)
                {
                    MessageBox.Show("Data inceputului e mai mare decat data sfarsitului");
                    return;
                }
                if (DateTime.Compare(DateTime.Parse(TextBox14.Text), DateTime.Parse(DateTime.Today.ToString("dd/MMM/yyyy"))) <= 0)
                {
                    MessageBox.Show("data inceperii e mai mica decat data de azi");
                    return;
                }
                if (DateTime.Compare(DateTime.Parse(TextBox15.Text), DateTime.Parse(DateTime.Today.ToString("dd/MMM/yyyy"))) <= 0)
                {
                    MessageBox.Show("data sfarsitului e mai mica decat data de azi");
                    return;
                }
                OracleDataAdapter da = new OracleDataAdapter();
                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "Select NUME,DATAINCEPUT,DATASFARSIT FROM TURNEE WHERE NUME='"+TextBox12.Text+"'";
               // MessageBox.Show(cmd.CommandText);
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                for(int i = 0; i < dt.Rows.Count; i++)
                {
                    if (DateTime.Parse(dt.Rows[i][1].ToString()).Date <= DateTime.Parse(TextBox14.Text).Date && DateTime.Parse(dt.Rows[i][2].ToString()).Date >= DateTime.Parse(TextBox14.Text).Date)
                    {
                        MessageBox.Show("Data de inceput turneului introdus este in aceeasi perioada cu data altui turneu cu acelasi nume");
                        return;
                    }else if(DateTime.Parse(dt.Rows[i][1].ToString()).Date <= DateTime.Parse(TextBox15.Text).Date && DateTime.Parse(dt.Rows[i][2].ToString()).Date >= DateTime.Parse(TextBox15.Text).Date)
                    {
                        MessageBox.Show("Data de sfarsit turneului introdus este in aceeasi perioada cu data altui turneu cu acelasi nume");
                        return;
                    }else if (DateTime.Parse(dt.Rows[i][1].ToString()).Date >= DateTime.Parse(TextBox14.Text).Date && DateTime.Parse(dt.Rows[i][2].ToString()).Date <= DateTime.Parse(TextBox15.Text).Date)
                    {
                        MessageBox.Show("Data noului turneu este invalida deoarece exista un alt turneu cu acelasi nume programat in perioada aceasta");
                        return;
                    }


                }
                cmd.CommandText = "insert into TURNEE(NUME,DATAINCEPUT,DATASFARSIT) values('" + TextBox12.Text + "','"+TextBox14.Text+"','"+TextBox15.Text+"')";
                //MessageBox.Show(cmd.CommandText);
                con.Open();
                cmd.ExecuteNonQuery();

                con.Close();
                MessageBox.Show("Turneu adaugat!");
            }
            else
            {
                MessageBox.Show("Completati toate campurile!");
                return;
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == DropDownList2.SelectedValue)
            {
               // MessageBox.Show("nu e trb");
                DropDownList2.SelectedValue = null;
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleCommand cmd = new OracleCommand();
           // cmd.CommandText = " SELECT DISTINCT GRUPURI.ID,GRUPURI.NUMEGRUP FROM((Grupuri INNER JOIN Meciuri  ON GRUPURI.ID = MECIURI.IDGRUPA) INNER JOIN Grupuri g ON g.ID = MECIURI.IDGRUPB) INNER JOIN JOCURI ON MECIURI.JocJucat = JOCURI.IDJOC WHERE JOCURI.IDJOC = '" + DropDownList3.SelectedValue + "' AND GRUPURI.NumeGrup<>'" + DropDownList1.SelectedValue+"'";
            cmd.CommandText = " SELECT ID, NUMEGRUP FROM GRUPURI WHERE ID<>'" + DropDownList1.SelectedValue + "' ORDER BY ID";

            cmd.Connection = con;
            con.Open();
           // MessageBox.Show(cmd.CommandText);
            DataTable dt = new DataTable();

            dt.Load(cmd.ExecuteReader());
            con.Close();

            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "NUMEGRUP";
            DropDownList2.DataValueField = "ID";
            DropDownList2.DataBind();
            DropDownList2.Items.Remove(DropDownList1.SelectedItem);
            if (DropDownList1.SelectedValue == DropDownList2.SelectedValue)
            {
               // MessageBox.Show("nu e trb");
                DropDownList1.SelectedValue = null;
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList1.Items.Clear();
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            OracleCommand cmd = new OracleCommand();
            //  cmd.CommandText = " SELECT DISTINCT GRUPURI.ID,GRUPURI.NUMEGRUP FROM((Grupuri INNER JOIN Meciuri  ON GRUPURI.ID = MECIURI.IDGRUPA) INNER JOIN Grupuri g ON g.ID = MECIURI.IDGRUPB) INNER JOIN JOCURI ON MECIURI.JocJucat = JOCURI.IDJOC WHERE JOCURI.IDJOC = '" + DropDownList3.SelectedValue + "'";
            cmd.CommandText = "SELECT ID, NUMEGRUP FROM GRUPURI ORDER BY ID";
            cmd.Connection = con;
            con.Open();
            //MessageBox.Show(cmd.CommandText);
            DataTable dt = new DataTable();

            dt.Load(cmd.ExecuteReader());
            con.Close();

            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "NUMEGRUP";
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataBind();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipala.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar3.Visible == false)
                Calendar3.Visible = true;
            else Calendar3.Visible = false;
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar4.Visible == false)
                Calendar4.Visible = true;
            else Calendar4.Visible = false;
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            TextBox14.Text = Calendar3.SelectedDate.ToString("dd-MMM-yyyy");
            Calendar3.Visible = false;
        }

        protected void Calendar4_SelectionChanged(object sender, EventArgs e)
        {
            TextBox15.Text = Calendar4.SelectedDate.ToString("dd-MMM-yyyy");
            Calendar4.Visible = false;
        }
    }
  }

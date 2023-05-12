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
    public partial class test : System.Web.UI.Page
    {
        private static readonly Random rnd = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Label37.Text = "asd";
                Label38.Text = Eramake.eCryptography.Encrypt(Label37.Text);
                Label39.Text = Eramake.eCryptography.Decrypt(Label38.Text);

                DateTime dateAndTime = DateTime.Now;
                Label34.Text = dateAndTime.ToString("dd-MMM-yyyy H:mm");

                OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
                OracleDataAdapter da = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "select MECIURI.IDMECI,MECIURI.PREDICTIE,MECIURI.REZULTAT FROM (MECIURI INNER JOIN GRUPURI ON MECIURI.IDGRUPA=GRUPURI.ID) INNER JOIN GRUPURI g ON g.ID=MECIURI.IDGRUPB WHERE TO_DATE(MECIURI.DATA, 'dd-MON-YYYY') <= (SELECT DATA FROM(select TO_DATE(sysdate, 'dd-MON-yyyy') as DATA, TO_DATE(sysdate, 'HH24:MI') as ORA from dual)) AND MECIURI.REZULTAT is null ORDER BY MECIURI.IDMECI";
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                DataTable dtt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Open();
                int x = dt.Rows.Count;
                string s = "";
                for (int i = 0; i < x; i++)
                {
                    double sansa = Double.Parse(dt.Rows[i][1].ToString());
                    dt.Rows[i][2] = generare(sansa);
                    s = dt.Rows[i][2].ToString();

                    cmd.CommandText = "update MECIURI set REZULTAT='"+s+"' WHERE IDMECI="+dt.Rows[i][0];
                    cmd.ExecuteNonQuery();

                    if(dt.Rows[i][2].ToString()=="W")
                    {
                        MessageBox.Show("e W");
                        cmd.CommandText = "Select IDUTILIZATOR,SUMAPARIATA FROM PARIURI WHERE IDMECI=" + dt.Rows[i][0];
                        da.SelectCommand = cmd;
                        da.Fill(dtt);
                        int y = dtt.Rows.Count;
                        if (da != null)
                        {
                            for (int j = 0; j < y; j++)
                            {
                                cmd.CommandText = "update PARIURI set CASTIG=ROUND((100/" + dt.Rows[i][1] + ")*" + dtt.Rows[j][1] + ") WHERE IDMECI=" + dt.Rows[i][0] + " AND IDUTILIZATOR=" + dtt.Rows[j][0];
                                cmd.ExecuteNonQuery();
                                cmd.CommandText = "UPDATE UTILIZATORI SET CONT=CONT+ROUND((100/" + dt.Rows[i][1] + ")*" + dtt.Rows[j][1] + ") WHERE IDUTILIZATOR=" + dtt.Rows[j][0];
                                cmd.ExecuteNonQuery();
                                MessageBox.Show(cmd.CommandText);
                            }
                            dtt.Clear();
                        }

                    }
                    else
                    {
                        MessageBox.Show("e L");
                          
                          cmd.CommandText = "Select IDUTILIZATOR,SUMAPARIATA FROM PARIURI WHERE IDMECI=" + dt.Rows[i][0];
                          da.SelectCommand = cmd;
                          da.Fill(dtt);
                          int y = dtt.Rows.Count;
                        for (int j = 0; j < y; j++)
                        {
                            cmd.CommandText = "update PARIURI set CASTIG=0 WHERE IDMECI=" + dt.Rows[i][0] + " AND IDUTILIZATOR=" + dtt.Rows[j][0];
                            cmd.ExecuteNonQuery();
                        }
                        dtt.Clear();
                    }

                }
                con.Close();

                GridView1.DataSource = dt;
                GridView1.DataBind();
                Random rnd = new Random();
                Label35.Text = rnd.Next(0, 100).ToString();
                Label36.Text = rnd.Next(0, 100).ToString();

            }
        }
       
        private string generare(double sansa)
        {

                if (sansa > rnd.Next(0, 100))
                    return "W";
                else return "L";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE = localhost:1521 / orcl; USER ID = SORUN; Password=Sorin1998");
            //OracleDataAdapter da = new OracleDataAdapter("SELECT IDGRUPA,IDGRUPB FROM ISTORIC Where ((IDGRUPA=2 AND IDGRUPB=1) OR (IDGRUPA=1 AND IDGRUPB=2)) AND JOCJUCAT=1", con);
            //OracleDataAdapter daa = new OracleDataAdapter("Select COUNT(IDGRUPA) From ISTORIC Where ((IDGRUPA=2 AND IDGRUPB=1) OR (IDGRUPA=1 AND IDGRUPB=2)) AND JOCJUCAT=1", con);
            OracleDataAdapter da = new OracleDataAdapter("SELECT MECIURI.REZULTAT FROM(MECIURI INNER JOIN GRUPURI  ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID WHERE((GRUPURI.NUMEGRUP = 'Fnatic' AND g.NUMEGRUP = 'G2') OR (GRUPURI.NUMEGRUP = 'G2' AND g.NUMEGRUP = 'Fnatic')) AND MECIURI.JOCJUCAT = 1 ORDER BY MECIURI.IDMECI", con);
            OracleDataAdapter daa = new OracleDataAdapter("Select COUNT(MECIURI.REZULTAT) FROM(MECIURI INNER JOIN GRUPURI  ON MECIURI.IDGRUPA = GRUPURI.ID) INNER JOIN GRUPURI g ON MECIURI.IDGRUPB = g.ID WHERE((GRUPURI.NUMEGRUP = 'Fnatic' AND g.NUMEGRUP = 'G2') OR (GRUPURI.NUMEGRUP = 'G2' AND g.NUMEGRUP = 'Fnatic')) AND MECIURI.JOCJUCAT = 1 ORDER BY MECIURI.IDMECI", con);
            DataTable dt = new DataTable();
            DataTable dtt = new DataTable();
            da.Fill(dt);
            daa.Fill(dtt);
            int nr = Convert.ToInt32(dtt.Rows[0][0]);
            string rezultat = "";


            for (int i = 0; i < nr; i++)
            {
                if (dt.Rows[i][0].ToString() == "W")
                    rezultat = rezultat + "W";
                else if (dt.Rows[i][0].ToString() == "L")
                    rezultat = rezultat + "L";
            }
            Label18.Text = rezultat;
            char[] lista = rezultat.ToCharArray();
            double ultimMeci = calcul(lista, nr);
            Label31.Text = ultimMeci.ToString();
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
            Label19.Text = LL.ToString();
            Label20.Text = LW.ToString();
            Label21.Text = WL.ToString();
            Label22.Text = WW.ToString();
            Label23.Text = ll.ToString();
            Label24.Text = lw.ToString();
            Label25.Text = wl.ToString();
            Label26.Text = ww.ToString();

            double WW2 = 0, WL2 = 0, LW2 = 0, LL2 = 0, WW4 = 0, WL4 = 0, LW4 = 0, LL4 = 0;
            LL2 = (LL * LL) + (LW * WL);
            LW2 = (LL * LW) + (LW * WW);
            WL2 = (WL * LL) + (WW * WL);
            WW2 = (WL * LW) + (WW * WW);

            LL4 = (LL2 * LL2) + (LW2 * WL2);
            LW4 = (LL2 * LW2) + (LW2 * WW2);
            WL4 = (WL2 * LL2) + (WW2 * WL2);
            WW4 = (WL2 * LW2) + (WW2 * WW2);
            Label27.Text = LL4.ToString();
            Label28.Text = LW4.ToString();
            Label29.Text = WL4.ToString();
            Label30.Text = WW4.ToString();

            if (lista[nr - 1].ToString().Equals("W"))
                return WW4;
            else return LW4;
        }

        protected void Button2_Click(object sender, EventArgs e)
        { 
           Random rnd = new Random();
           int procent = rnd.Next(0, 100);
            if (Double.Parse(Label31.Text)*100 > procent)
                Label32.Text = "W";
            else Label32.Text = "L";
            Label33.Text = procent.ToString();
            

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label43.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            Label44.Text = Calendar1.SelectedDate.ToString("dd-MMM-yyyy");
            if (DateTime.Parse(Label43.Text) == DateTime.Parse(Label44.Text))
                MessageBox.Show("egale");
            else if (DateTime.Parse(Label43.Text) > DateTime.Parse(Label44.Text))
                MessageBox.Show("ziua selectata e mai mica");
            else
                MessageBox.Show("ziua selectata e mai mare");
        }
    }
}
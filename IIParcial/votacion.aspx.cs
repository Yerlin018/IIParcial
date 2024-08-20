using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IIParcial
{
    public partial class votacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }

        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido FROM ALMACENAMIENTODATOS"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Bvotar_Click(object sender, EventArgs e)
        {

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("INSERT INTO  ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES('" + tcedula_Vot.Text + "' ,'" + tnombre_Vot.Text + "','" + tapellido_Vot.Text + "' ," + int.Parse(tedad_Vot.Text) + ", '" + tnombre_elegido.Text + "')", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            tnombre_Vot.Text = "";
            tapellido_Vot.Text = "";
            tedad_Vot.Text = "";
            tnombre_elegido.Text = "";
            LlenarGrid();
        }

        protected void Beliminar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" DELETE ALMACENAMIENTODATOS WHERE Cedula_Vot = '" + tcedula_Vot.Text + "' ", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();

        }
    }
}
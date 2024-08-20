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
    public partial class inscripcion : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT Cedula, Nombre, Apellido, Telefono, Edad, Partido, Estado FROM CANDIDATOS"))
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

        protected void Binscribir_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES('" + tnombre.Text + "','" + tapellido.Text + "' , '" + ttelefono.Text + "', " + int.Parse(tedad.Text) + ", '" + tpartido.Text + "' , '" + testado.Text + "')", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            tnombre.Text = "";
            tapellido.Text = "";
            ttelefono.Text = "";
            tedad.Text = "";
            tpartido.Text = "";
            testado.Text = "";
            LlenarGrid();
        }

        protected void Beliminar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" DELETE CANDIDATOS WHERE CEDULA = '" + tcedula.Text + "' ", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();

        }

        protected void Bactualizar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(s))
            {
                conexion.Open();

                // Crear la consulta SQL para actualizar los datos
                SqlCommand comando = new SqlCommand("UPDATE CANDIDATOS SET Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono, Edad = @Edad, Partido = @Partido, Estado = @Estado WHERE CEDULA = @Cedula", conexion);

                // Agregar los parámetros con los valores de los controles
                comando.Parameters.AddWithValue("@Nombre", tnombre.Text);
                comando.Parameters.AddWithValue("@Apellido", tapellido.Text);
                comando.Parameters.AddWithValue("@Telefono", ttelefono.Text);
                comando.Parameters.AddWithValue("@Edad", int.Parse(tedad.Text));  
                comando.Parameters.AddWithValue("@Partido", tpartido.Text);
                comando.Parameters.AddWithValue("@Estado", testado.Text);
                comando.Parameters.AddWithValue("@Cedula", tcedula.Text);  // Se usa la cédula para identificar el registro a modificar

                // Ejecutar la consulta SQL
                comando.ExecuteNonQuery();

                // Cerrar la conexión
                conexion.Close();

                // Limpiar los campos de texto después de la actualización
                tnombre.Text = "";
                tapellido.Text = "";
                ttelefono.Text = "";
                tedad.Text = "";
                tpartido.Text = "";
                testado.Text = "";
                tcedula.Text = "";  // También limpiar la cédula

                // Volver a llenar el GridView con los datos actualizados
                LlenarGrid();
                // String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                // SqlConnection conexion = new SqlConnection(s);
                // conexion.Open();
                // SqlCommand comando = new SqlCommand("UPDATE CANDIDATOS SET Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono, Edad = @Edad, Partido = @Partido, Estado = @Estado WHERE CEDULA = @Cedula", conexion);
                //// SqlCommand comando = new SqlCommand("UPDATE  CANDIDATOS WHERE CEDULA = '" + tcedula.Text + "' SET (Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES('" + tnombre.Text + "','" + tapellido.Text + "' , '" + ttelefono.Text + "', " + int.Parse(tedad.Text) + ", '" + tpartido.Text + "' , '" + testado.Text + "')", conexion);
                // comando.ExecuteNonQuery();
                // conexion.Close();
                // tnombre.Text = "";
                // tapellido.Text = "";
                // ttelefono.Text = "";
                // tedad.Text = "";
                // tpartido.Text = "";
                // testado.Text = "";
                // LlenarGrid();
            }
        }
    }
}
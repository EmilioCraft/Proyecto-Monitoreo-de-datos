using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tarea1
{
    public partial class _Default : Page
    {
        public class EspecificaionesComponentes
        {
            public string Nombre { get; set; }
            public string Modelo { get; set; }
            public string NumeroSerie { get; set; }
            public string Imagen { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "select Modelo, NumeroSerie, Nombre, Imagen from EspecificacionesComponentes;";
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                List<EspecificaionesComponentes> materiales = new List<EspecificaionesComponentes>();
                while (reader.Read())
                {
                    materiales.Add(new EspecificaionesComponentes
                    {
                        Nombre = reader["Nombre"].ToString(),
                        Modelo = reader["Modelo"].ToString(),
                        NumeroSerie = reader["NumeroSerie"].ToString(),
                        Imagen = reader["Imagen"].ToString(),
                    });
                }
                gvEspecificacionesComponentes.DataSource = materiales;
                gvEspecificacionesComponentes.DataBind();
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO EspecificacionesComponentes (Nombre, Modelo, NumeroSerie, Imagen) " +
                    "VALUES (@Nombre, @Modelo, @NumeroSerie, @Imagen);";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Modelo", txtModelo.Text);
                cmd.Parameters.AddWithValue("@NumeroSerie", txtNumeroSerie.Text);
                cmd.Parameters.AddWithValue("@Imagen", txtImagen.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            txtNombre.Text = txtNumeroSerie.Text = txtModelo.Text = txtImagen.Text = "";
            CargarDatos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "select Modelo, NumeroSerie, Nombre, Imagen from EspecificacionesComponentes WHERE Modelo LIKE '%' + @Modelo + '%';";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Modelo", txtBuscar.Text);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                List<EspecificaionesComponentes> materiales = new List<EspecificaionesComponentes>();
                while (reader.Read())
                {
                    materiales.Add(new EspecificaionesComponentes
                    {
                        Nombre = reader["Nombre"].ToString(),
                        Modelo = reader["Modelo"].ToString(),
                        NumeroSerie = reader["NumeroSerie"].ToString(),
                        Imagen = reader["Imagen"].ToString(),
                    });
                }
                gvEspecificacionesComponentes.DataSource = materiales;
                gvEspecificacionesComponentes.DataBind();
            }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (txtBuscar.Text == string.Empty)
            {
                CargarDatos();
            }
            else
            {
                btnBuscar_Click(sender, e);
            }
        }

        protected void accionEditar_Click(object sender, EventArgs e)
        {

        }

        protected void accionElminar_Click(object sender, EventArgs e)
        {

        }
    }
}
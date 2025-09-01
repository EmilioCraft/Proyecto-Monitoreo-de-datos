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
    public partial class About : Page
    {
        public class EspecificaionesComponentes
        {
            public string NumeroIdentificador { get; set; }
            public string Lote { get; set; }
            public string Fecha_Componentes { get; set; }
            public string Nombre { get; set; }
            public string Modelo { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        public void CargarDatos()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "select Inventario.NumeroIdentificador, Inventario.Lote, Componentes.Fecha, EspecificacionesComponentes.Nombre, Componentes.Modelo " +
                    "from Inventario " +
                    "inner join Componentes on Inventario.IDRegistro = Componentes.IDRegistro " +
                    "inner join EspecificacionesComponentes on Componentes.Modelo = EspecificacionesComponentes.Modelo;";
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                List<EspecificaionesComponentes> materiales = new List<EspecificaionesComponentes>();
                while (reader.Read())
                {
                    materiales.Add(new EspecificaionesComponentes
                    {
                        NumeroIdentificador = reader["NumeroIdentificador"].ToString(),
                        Lote = reader["Lote"].ToString(),
                        Fecha_Componentes = reader["Fecha"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Modelo = reader["Modelo"].ToString(),
                    });
                }
                gvInventario.DataSource = materiales;
                gvInventario.DataBind();
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
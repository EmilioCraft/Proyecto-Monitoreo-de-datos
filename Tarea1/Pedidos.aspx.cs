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
    public partial class Contact : Page
    {
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
                string query = "select Modelo, Nombre from EspecificacionesComponentes;";
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ddlComponentes.Items.Add(new ListItem
                    {
                        Text = reader["Nombre"].ToString(),
                        Value = reader["Modelo"].ToString()
                    });
                }
            }
        }
        public void btnRegistrar_Click(object sender, EventArgs e)
        {

        }
    }
}
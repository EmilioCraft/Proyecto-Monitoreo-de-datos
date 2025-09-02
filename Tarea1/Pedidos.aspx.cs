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
        string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosCombo();
            }
        }
        public void CargarDatosCombo()
        {

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

        public void QueryRegistrarPedido()
        {      
            string cantidad= txtCantidad.Text;
            string fecha= CalendarFecha.SelectedDate.ToString();
            string modelo= ddlComponentes.SelectedValue.ToString();

            //se ocupa mostrar id para poder referenciarlo en el query de registrar en inventario HIDDENIDFLIED

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Componentes (Cantidad, Fecha, Modelo) " +
                    "VALUES (@Cantidad, @Fecha, @Modelo);";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Cantidad", cantidad);
                cmd.Parameters.AddWithValue("@Fecha", fecha);
                cmd.Parameters.AddWithValue("@Modelo", modelo);

                conn.Open();

                cmd.ExecuteNonQuery();
            }
            GenerarInventario(cantidad, fecha, modelo);

            
            txtCantidad.Text = "";
            ddlComponentes.ClearSelection();
            HiddenFieldID.Value = "";


        }

        public void GenerarInventario(string cantidad,string fecha,string modelo)
        {
            int lote;
            string numeroidentificador; ///MODELO-LOTE-NUMERO INCREMENTABLE-FECHA-
            if (Convert.ToInt32(cantidad)>1000)
            {
                //separar por lotes de 1000 pero verificar en la tabla de inventario cual es el que se quedo pendiente con query

            }

            //armar numero identificador usando modelo + lote + numero incrementable y fecha
            for (int i = 0; i < cantidad.Length; i++) {


                //string numeroIdentificador = $"{modelo}-{lote}-{numeroIncremental}-{fecha:yyyyMMdd}";

                //string query = "INSERT INTO Inventario (NumeroIdentificador, Lote, IDRegistro) " +
                //               "VALUES (@NumeroIdentificador, @Lote, @IDRegistro);";

                //SqlCommand cmd = new SqlCommand(query, conn);
                //cmd.Parameters.AddWithValue("@NumeroIdentificador", numeroIdentificador);
                //cmd.Parameters.AddWithValue("@Lote", lote);
                ////cmd.Parameters.AddWithValue("@IDRegistro", idRegistro);

                //cmd.ExecuteNonQuery();
                //numeroidentificador =
                    //query para registrar en inventario ya con los datos obtennidos

            }


        }

        public void btnRegistrar_Click(object sender, EventArgs e)
        {

            QueryRegistrarPedido();
        }
    }
}
using System;
using System.Data;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using FirebirdSql.Data.FirebirdClient;

namespace MiProyectoMicrosip
{
    public partial class FormSalida : Form
    {
        private FbConnection connection;
        private FbDataAdapter adapterConceptos;
        private FbDataAdapter adapterAlmacenes;
        private DataSet dataSetConceptos;
        private DataSet dataSetAlmacenes;

        private const string DllPath = @"C:\Users\Luilm\source\repos\PRUEBASMICROSIP\ApiMicrosip2022\ApiMicrosip.dll";

        [DllImport(DllPath, SetLastError = true)]
        public static extern int NuevaSalida(int ConceptoInId, int AlmacenId, int AlmacenDestinoId,
                                             string Fecha, string Folio, string Descripcion, int CentroCostoId);

        [DllImport(DllPath, SetLastError = true)]
        public static extern int AplicaSalida();

        [DllImport(DllPath, SetLastError = true)]
        public static extern int RenglonSalida(int ArticuloId, double Unidades, double CostoUnitario, double CostoTotal);

        public FormSalida()
        {
            InitializeComponent();

            // Agregar columnas al DataGridView si no están ya agregadas
            if (dataGridViewArticulos.Columns.Count == 0)
            {
                dataGridViewArticulos.Columns.Add("ClaveArticulo", "Clave del Artículo");
                dataGridViewArticulos.Columns.Add("ArticuloId", "ID del Artículo");
                dataGridViewArticulos.Columns.Add("NombreArticulo", "Nombre del Artículo");
                dataGridViewArticulos.Columns.Add("Unidades", "Unidades");
            }

            // Suscribir el evento CellValueChanged
            dataGridViewArticulos.CellValueChanged += dataGridViewArticulos_CellValueChanged;

            // Suscribir el evento KeyDown para manejar la tecla Enter
            dataGridViewArticulos.KeyDown += dataGridViewArticulos_KeyDown;
        }

        private void FormSalida_Load(object sender, EventArgs e)
        {
            string connectionString = "User=SYSDBA;Password=masterkey;Database=\"C:\\Microsip datos\\SUPER CARQUIN.FDB\";DataSource=server;Port=3050;Dialect=3;Charset=UTF8;";
            string queryConceptos = "SELECT * FROM CONCEPTOS_IN";
            string queryAlmacenes = "SELECT * FROM ALMACENES";

            connection = new FbConnection(connectionString);
            adapterConceptos = new FbDataAdapter(queryConceptos, connection);
            adapterAlmacenes = new FbDataAdapter(queryAlmacenes, connection);
            dataSetConceptos = new DataSet();
            dataSetAlmacenes = new DataSet();

            try
            {
                connection.Open();
                adapterConceptos.Fill(dataSetConceptos, "CONCEPTOS_IN");
                adapterAlmacenes.Fill(dataSetAlmacenes, "ALMACENES");

                comboBox1.DataSource = dataSetConceptos.Tables["CONCEPTOS_IN"];
                comboBox1.DisplayMember = "NOMBRE";

                // Llenar comboBox2 (almacén de origen)
                comboBox2.DataSource = dataSetAlmacenes.Tables["ALMACENES"].Copy(); // Copiar el DataTable para evitar conflictos de asignación
                comboBox2.DisplayMember = "NOMBRE";

                // Llenar comboBox3 (almacén de destino)
                comboBox3.DataSource = dataSetAlmacenes.Tables["ALMACENES"].Copy(); // Copiar el DataTable para evitar conflictos de asignación
                comboBox3.DisplayMember = "NOMBRE";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al conectar a la base de datos: " + ex.Message);
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            connection?.Dispose();
            adapterConceptos?.Dispose();
            adapterAlmacenes?.Dispose();
            dataSetConceptos?.Dispose();
            dataSetAlmacenes?.Dispose();
        }

        private void buttonGenerarSalida_Click(object sender, EventArgs e)
        {
            try
            {
                int conceptoId = ((DataRowView)comboBox1.SelectedItem).Row.Field<int>("CONCEPTO_IN_ID");
                int almacenOrigenId = ((DataRowView)comboBox2.SelectedItem).Row.Field<int>("ALMACEN_ID");
                int almacenDestinoId = ((DataRowView)comboBox3.SelectedItem).Row.Field<int>("ALMACEN_ID");
                string fecha = dateTimePickerFecha.Value.ToString("d/M/yyyy");
                string folio = textBoxFolio.Text;
                string descripcion = textBox1.Text;
                int centroCostoId = 0; // Ajusta según tu lógica

                int resultadoNuevaSalida = NuevaSalida(conceptoId, almacenOrigenId, almacenDestinoId, fecha, folio, descripcion, centroCostoId);

                if (resultadoNuevaSalida == 0) // Suponiendo que 0 es éxito
                {
                    foreach (DataGridViewRow row in dataGridViewArticulos.Rows)
                    {
                        if (row.IsNewRow) continue;

                        string claveArticulo = row.Cells["ClaveArticulo"].Value.ToString(); // Obtener clave manualmente desde la celda

                        // Buscar nombre del artículo por clave
                        (int articuloId, string nombreArticulo) = ObtenerArticuloPorClave(claveArticulo);

                        double unidades = Convert.ToDouble(row.Cells["Unidades"].Value);

                        // Llenar las celdas correspondientes en el DataGridView
                        row.Cells["ArticuloId"].Value = articuloId;
                        row.Cells["NombreArticulo"].Value = nombreArticulo;
                        row.Cells["Unidades"].Value = unidades;

                        // Agregar renglon de salida
                        int resultadoRenglonSalida = RenglonSalida(articuloId, unidades, 0.0, 0.0); // Ajusta los parámetros de costo según tu lógica

                        if (resultadoRenglonSalida != 0) // Suponiendo que 0 es éxito
                        {
                            MessageBox.Show("Error al agregar el renglón de salida. Código de error: " + resultadoRenglonSalida);
                            return;
                        }
                    }

                    int resultadoAplicaSalida = AplicaSalida();

                    if (resultadoAplicaSalida == 0) // Suponiendo que 0 es éxito
                    {
                        MessageBox.Show("Salida generada y aplicada exitosamente.");
                    }
                    else
                    {
                        MessageBox.Show("Error al aplicar la salida. Código de error: " + resultadoAplicaSalida);
                    }
                }
                else
                {
                    MessageBox.Show("Error al generar la salida. Código de error: " + resultadoNuevaSalida);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }


        private (int, string) ObtenerArticuloPorClave(string claveArticulo)
        {
            int articuloId = 0;
            string nombreArticulo = "";

            try
            {
                connection.Open();

                string query = @"SELECT DISTINCT A.ARTICULO_ID, A.NOMBRE
                                 FROM ARTICULOS A
                                 INNER JOIN CLAVES_ARTICULOS C ON A.ARTICULO_ID = C.ARTICULO_ID
                                 WHERE C.CLAVE_ARTICULO = @ClaveArticulo";

                FbCommand command = new FbCommand(query, connection);
                command.Parameters.AddWithValue("@ClaveArticulo", claveArticulo);

                FbDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    articuloId = reader.GetInt32(reader.GetOrdinal("ARTICULO_ID"));
                    nombreArticulo = reader["NOMBRE"].ToString();
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al obtener el artículo: " + ex.Message);
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

            return (articuloId, nombreArticulo);
        }

        private void dataGridViewArticulos_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex == dataGridViewArticulos.Columns["ClaveArticulo"].Index)
            {
                string claveArticulo = dataGridViewArticulos.Rows[e.RowIndex].Cells["ClaveArticulo"].Value.ToString();
                (int articuloId, string nombreArticulo) = ObtenerArticuloPorClave(claveArticulo);
                dataGridViewArticulos.Rows[e.RowIndex].Cells["ArticuloId"].Value = articuloId;
                dataGridViewArticulos.Rows[e.RowIndex].Cells["NombreArticulo"].Value = nombreArticulo;
            }
        }

        private void dataGridViewArticulos_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                int rowIndex = dataGridViewArticulos.CurrentCell.RowIndex;
                int columnIndex = dataGridViewArticulos.CurrentCell.ColumnIndex;

                if (columnIndex == dataGridViewArticulos.Columns["ClaveArticulo"].Index)
                {
                    string claveArticulo = dataGridViewArticulos.Rows[rowIndex].Cells[columnIndex].Value.ToString();
                    (int articuloId, string nombreArticulo) = ObtenerArticuloPorClave(claveArticulo);
                    dataGridViewArticulos.Rows[rowIndex].Cells["ArticuloId"].Value = articuloId;
                    dataGridViewArticulos.Rows[rowIndex].Cells["NombreArticulo"].Value = nombreArticulo;
                }
            }
        }
    }
}

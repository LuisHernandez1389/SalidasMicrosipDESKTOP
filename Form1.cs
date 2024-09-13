using System;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

namespace MiProyectoMicrosip
{
    public partial class Form1 : Form
    {
        // Ruta completa al archivo DLL
        private const string DllPath = @"C:\Users\Luilm\source\repos\PRUEBASMICROSIP\ApiMicrosip2022\ApiMicrosip.dll";

        [DllImport(DllPath, SetLastError = true)]
        public static extern int NewDB();

        [DllImport(DllPath, CallingConvention = CallingConvention.Cdecl)]
        public static extern void SetErrorHandling(int eType, int eLevel);

        [DllImport(DllPath, CallingConvention = CallingConvention.Cdecl)]
        public static extern int NewTrn(int db, int op);

        [DllImport(DllPath, CallingConvention = CallingConvention.Cdecl)]
        public static extern int DBConnect(int db, string path, string user, string pass);

        [DllImport(DllPath, CallingConvention = CallingConvention.StdCall)]
        public static extern int SetDBInventarios(int dbHandle);

        [DllImport(DllPath, CallingConvention = CallingConvention.Cdecl)]
        public static extern int GetLastErrorMessage(StringBuilder msg);

        [DllImport(DllPath, CallingConvention = CallingConvention.Cdecl)]
        public static extern void DBDisconnect(int db);

        public Form1()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            // Crea una nueva conexión a la base de datos
            int dbHandle = NewDB();

            // Configura el manejo de errores
            SetErrorHandling(0, 0);

            // Inicia una nueva transacción
            int trn = NewTrn(dbHandle, 3);

            // Obtiene los valores de los TextBox
            string path = txtDatabasePath.Text;
            string user = txtUsername.Text;
            string pass = txtPassword.Text;
            string server = txtServer.Text;

            // Conéctate a la base de datos
            string connectionString = $"{server}:{path}";
            int conecta = DBConnect(dbHandle, connectionString, user, pass);

            // Verifica si hubo un error en la conexión
            if (conecta != 0)
            {
                StringBuilder obtieneError = new StringBuilder(1000);
                GetLastErrorMessage(obtieneError);
                lblMessage.Text = $"Error al conectar: {obtieneError.ToString()}";
                return;
            }

            // Llama a SetDBInventarios con el dbHandle
            int setDbResult = SetDBInventarios(dbHandle);
            if (setDbResult != 0)
            {
                lblMessage.Text = $"SetDBInventarios: Error {setDbResult}";
                return;
            }

            lblMessage.Text = "Conexión exitosa y SetDBInventarios ejecutado correctamente.";
            FormSalida formsalida = new FormSalida();
            formsalida.Show();
            

            // Desconéctate de la base de datos

        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            // Inicializar cualquier cosa necesaria al cargar el formulario
        }
    }
}

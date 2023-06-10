using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebAgenda
{
    public partial class Contato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonInserir_Click(object sender, EventArgs e)
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("~");
            ConnectionStringSettings connectionStringSettings = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = connectionStringSettings.ToString();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = "INSERT INTO CONTATO (Nome, Email, Telefone) VALUES (@Nome, @Email, @Telefone)";
            sqlCommand.Parameters.AddWithValue("Nome", TxbNome.Text);
            sqlCommand.Parameters.AddWithValue("Email", TxbEmail.Text);
            sqlCommand.Parameters.AddWithValue("Telefone", LabelTelefone.Text);
            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();

            GridView1.DataBind();
        }
    }
}
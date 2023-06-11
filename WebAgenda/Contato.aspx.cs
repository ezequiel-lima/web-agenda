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
            try
            {
                if (string.IsNullOrEmpty(TxbEmail.Text) || string.IsNullOrEmpty(TxbNome.Text) || string.IsNullOrEmpty(TxbTelefone.Text))
                {
                    Response.Write("<script> alert('Campo obrigatório está vazio'); </script>");
                };

                Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("~");
                ConnectionStringSettings connectionStringSettings = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

                SqlConnection sqlConnection = new SqlConnection();
                sqlConnection.ConnectionString = connectionStringSettings.ToString();
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandText = "INSERT INTO CONTATO (Nome, Email, Telefone) VALUES (@Nome, @Email, @Telefone)";
                sqlCommand.Parameters.AddWithValue("Nome", TxbNome.Text);
                sqlCommand.Parameters.AddWithValue("Email", TxbEmail.Text);
                sqlCommand.Parameters.AddWithValue("Telefone", TxbTelefone.Text);
                sqlConnection.Open();
                sqlCommand.ExecuteNonQuery();
                sqlConnection.Close();

                GridView1.DataBind();
            }
            catch (Exception error)
            {
                Response.Write("<script> alert('" + error.Message + "'); </script>");
            }          
        }
    }
}
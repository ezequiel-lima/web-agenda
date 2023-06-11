using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAgenda
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonEntrar_Click(object sender, EventArgs e)
        {
            string email = TxbEmail.Text;
            string senha = TxbSenha.Text;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(senha))
            {
                LabelInfo.Text = "Email ou senha vazio";
                return;
            }

            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("~");
            ConnectionStringSettings connectionStringSettings = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = connectionStringSettings.ToString();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = "SELECT Email, Senha FROM Usuario WHERE Email = @Email AND Senha = @Senha";
            sqlCommand.Parameters.AddWithValue("Email", TxbEmail.Text);
            sqlCommand.Parameters.AddWithValue("Senha", TxbSenha.Text);

            sqlConnection.Open();
            SqlDataReader registro = sqlCommand.ExecuteReader();
            if (registro.HasRows)
            {
                HttpCookie login = new HttpCookie("login", TxbEmail.Text);
                Response.Cookies.Add(login);

                Response.Redirect("~/Index.aspx");
            }
            else
            {
                Response.Write("<script> alert('email ou senha invalido'); </script>");
            }
            sqlConnection.Close();
        }
    }
}
using System;
using System.Web.UI.WebControls;

namespace WebAgenda
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceUsuariosInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Validate(e);
        }

        protected void SqlDataSourceUsuariosUpdated(object sender, SqlDataSourceStatusEventArgs e)
        {
            Validate(e);
        }

        private void Validate(SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Response.Write($"<script> alert('{e.Exception.Message}') </script>");
                Label1.Text = e.Exception.Message;
                e.ExceptionHandled = true;
            }
        }
    }
}
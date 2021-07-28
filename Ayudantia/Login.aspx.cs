using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        DTOUsuarios nuevo = new DTOUsuarios();
        nuevo.Rut_user = Convert.ToInt32(UserRut.Text);
        nuevo.Clave_user = UserClave.Text;

        int resultado = new DAOUsuarios().LoginUsuario(nuevo);

        if (resultado >= 0)
        {
            Session["RUT"] = nuevo.Rut_user;
            Session["CLAVE"] = nuevo.Clave_user;
            Session["ROL"] = "ROL";

            DTOUsuarios Rol_user = new DTOUsuarios();
            String ROL = new DAOUsuarios().GetUsuario(nuevo);

            if (ROL.Equals("Admin"))
            {
                Response.Redirect("Vistas/admin/home.aspx");
            }
            else if (ROL.Equals("Alumno"))
            {
                Response.Redirect("Vistas/alumno/home.aspx");
            }
            else if (ROL.Equals("Profesor"))
            {
                Response.Redirect("Vistas/profesor/home.aspx");
            }
            else
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}
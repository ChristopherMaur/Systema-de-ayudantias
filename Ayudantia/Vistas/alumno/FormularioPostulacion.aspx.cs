using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Windows.Forms;
public partial class Vistas_alumno_FormularioPostulacion : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox_cod_asig.Text = Request.QueryString["Valor"];
        }

    }
    protected void Button_Volver_Click(object sender, EventArgs e)
    {
        Response.Redirect("PostularAyudantia.aspx");
    }
    protected void Guardar_Formulario(object sender, EventArgs e)
    {

        DTOPostulacionAyudante nuevo = new DTOPostulacionAyudante();
        nuevo.Rut_ayudante = Convert.ToInt32(TextBox_Rut_Postulacion.Text);
        nuevo.Codigo_asig = Convert.ToInt32(Request.QueryString["Valor"]);
        nuevo.Fecha_postulacion = Convert.ToDateTime(TextBox_Fecha_Postulación.Text);
        nuevo.Comentarios_postulacion = TextBox_Comentarios.Text;
        nuevo.Horas_postulacion = Convert.ToInt32(DropDownList_Horas.SelectedItem.Text);
        nuevo.Estado_postulacion = "Pendiente";


      
        int resultado = new DAOPostulacionAyudante().IngresarPostulacion(nuevo);

        if (resultado >= 0)
        {
            
            DTOVerPostulaciones postulante = new DTOVerPostulaciones();
            postulante.Rut_postulacion = nuevo.Rut_ayudante;
            postulante.Id_oferta = Convert.ToInt32(Request.QueryString["Valor2"]);
            int resul = new DAOVerPostulaciones().IngresarListadoPostulacion(postulante);


            if (resul >=0) {
                MessageBox.Show("Su postulación ha sido ingresada");
                Response.Redirect("PostularAyudantia.aspx");
            }
        }
        else
        {

            MessageBox.Show("ERROR al ingresar postulacion");
            Response.Redirect("/Error.aspx");
        }

    }
}
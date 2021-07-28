using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Vistas_profesor_FormularioSeleccion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox_rut_ayudante.Text = Request.QueryString["Valor"];
            TextBox_asig_ayudante.Text = Request.QueryString["Valor2"];
            TextBox_sec_ayudante.Text = Request.QueryString["Valor3"];
            TextBox_ano_periodo_academico.Text = Request.QueryString["Valor4"];
        }
    }

    protected void Button_Volver_Click(object sender, EventArgs e) {
        Response.Redirect("VerPostulaciones.aspx");
    }
    protected void Guardar_Formulario(object sender, EventArgs e)
    {
        DTOAyudante ayudante = new DTOAyudante();
        ayudante.Rut_ayudante = Convert.ToInt32(Request.QueryString["Valor"]);
        ayudante.Asignatura_ayudante = Request.QueryString["Valor2"].ToString();
        ayudante.Seccion_ayudante = Convert.ToInt32(Request.QueryString["Valor3"]);
        ayudante.Ano_periodo_academico = Request.QueryString["Valor4"].ToString();
        ayudante.Horas_ayudante = Convert.ToInt32(TextBox_horas_ayudante.Text);
        ayudante.Fecha_seleccion_ayudante = Convert.ToDateTime(TextBox_fecha_seleccion_ayudante.Text);
        ayudante.Detalle_horario = TextBox_detalle_horario.Text;

        int resultado = new DAOAyudante().IngresarAyudante(ayudante);

        if (resultado >= 0)
        {
            int res = new DAOPostulacionAyudante().ActualizarPostulacion(ayudante.Rut_ayudante);
            int ras = new DAOAyudantias().IngresarAyudantia(ayudante);


            if (res >=0 && ras >=0) {

                MessageBox.Show("Su Selección ha sido ingresada");
                Response.Redirect("Ayudantias.aspx");
            }
        }
        else
        {

            MessageBox.Show("ERROR al ingresar Seleccion");
            Response.Redirect("/Error.aspx");
        }

    }
    
}
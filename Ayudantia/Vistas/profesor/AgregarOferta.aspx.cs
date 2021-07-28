using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Vistas_profesor_AgregarOferta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsCallback) {
            LLenarDroDown( DropDownList_Carrera,"SELECT nombre_car,codigo_car FROM CARRERAS");
        }
    }

    protected void DropDownList_Carrera_SelectedIndexChanged(object sender, EventArgs e)
    {
        String Codigo_car = DropDownList_Carrera.SelectedValue.ToString();
        LLenarDroDown(DropDownList_Asignatura, "SELECT A.nombre_asig,A.codigo_asig FROM ASIGNATURAS A,CARRERAS C,CARRERA_ASIGNATURA CA WHERE C.codigo_car= CA.codigo_car and CA.codigo_asig=A.codigo_asig and C.codigo_car="+ Codigo_car+"");

    }

    protected void DropDownList_Asignatura_SelectedIndexChanged(object sender, EventArgs e)
    {
        String Codigo_asig = DropDownList_Asignatura.SelectedValue.ToString();
        LLenarDroDown(DropDownList_Seccion, "SELECT SA.numero_sec,SA.codigo_sec FROM SECCION_ASIGNATURA SA, CARRERA_ASIGNATURA CA,ASIGNATURAS A WHERE A.codigo_asig=CA.codigo_asig and SA.codigo_car_asig=CA.codigo_car_asig and A.codigo_asig="+ Codigo_asig +"");

    }

    private void LLenarDroDown(DropDownList Example,String sql)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AyudantiaConnectionString"].ConnectionString);

        try
        {
            SqlCommand comm = conn.CreateCommand();
            comm = conn.CreateCommand();
            comm.CommandText =sql;
            comm.CommandType = CommandType.Text;
            conn.Open();
            SqlDataReader dr = comm.ExecuteReader();
            Example.Items.Add(new
                ListItem("Seleccione Item"));
            while (dr.Read())
            {
                Example.Items.Add(new
                ListItem(dr[0].ToString(),dr[1].ToString()));
 
            }
        }
        catch (Exception e)
        {
            MessageBox.Show("ERROR " + e.Message);
            Response.Redirect("/Error.aspx");
        }
        finally
        {
            conn.Close();
        }
 
    }

    protected void Button_Volver_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    protected void Guardar_Formulario(object sender, EventArgs e)
    {
        DTOPostularAyudantia nueva = new DTOPostularAyudantia();
 
        nueva.Codigo_car = Convert.ToInt32(DropDownList_Carrera.SelectedValue);
        nueva.Codigo_sec = Convert.ToInt32(DropDownList_Seccion.SelectedValue);
        nueva.Horas_oferta = Convert.ToInt32(DropDownList_Horas_Ayudantia.SelectedItem.Text);
        nueva.Requisito_oferta = TextBox_Requisitos_oferta.Text;

        int resultado = new  DAOPostularAyudantia().AgregarOferta(nueva);

        if (resultado >=0) {
            MessageBox.Show("Su Oferta ha sido ingresada");
            Response.Redirect("home.aspx");
        }
        else {
            MessageBox.Show("ERROR al ingresar los datos");
            Response.Redirect("/Error.aspx");
        }

       
    }
}
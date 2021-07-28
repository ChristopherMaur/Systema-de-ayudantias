using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vistas_profesor_VerPostulaciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "Select LI.id_listado,LI.id_oferta,LI.rut_postulacion,U.nombre_user,U.apellido_paterno_user, C.nombre_car, A.nombre_asig,SA.numero_sec,PA.estado_postulacion FROM LISTADO_POSTULACIONES LI, POSTULACION_AYUDANTE PA,ASIGNATURAS A, OFERTA_AYUDANTIA_ASIGNATURA O,CARRERAS C, SECCION_ASIGNATURA SA,USUARIOS U WHERE LI.rut_postulacion = PA.rut_postulacion and PA.codigo_asig = A.codigo_asig and LI.id_oferta = O.id_oferta and O.codigo_car = C.codigo_car and O.codigo_sec = SA.codigo_sec and LI.rut_postulacion = U.rut_user";
            GridView.DataSource = this.GetData(sql);
            GridView.DataBind();
        }
    }

    private DataTable GetData(string sql)
    {
        string constr = ConfigurationManager.ConnectionStrings["AyudantiaConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = con;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }



    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (TableCell cell in e.Row.Cells)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.blackgroundColor = 'orange'");
                e.Row.BackColor = Color.FromName("lightgray");
            }
        }

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = "Listado";
            e.Row.Cells[1].Text = "Número Oferta";
            e.Row.Cells[2].Text = "Rut Postulación";
            e.Row.Cells[3].Text = "Nombre Postulante";
            e.Row.Cells[4].Text = "Apellido Postulante";
            e.Row.Cells[5].Text = "Carrera Postulada";
            e.Row.Cells[6].Text = "Asignatura Postulada";
            e.Row.Cells[7].Text = "Sección Postulada";
            e.Row.Cells[8].Text = "Estado Postulante";
            e.Row.BackColor = Color.Pink;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView.SelectedRow;
        DTOAyudante ayudante = new DTOAyudante();
        ayudante.Rut_ayudante = Convert.ToInt32((row.Cells[2].FindControl("lblRut_postulacion") as Label).Text);
        ayudante.Asignatura_ayudante = (row.Cells[6].FindControl("lblNombre_asig") as Label).Text;
        ayudante.Seccion_ayudante = Convert.ToInt32((row.Cells[7].FindControl("lblNumero_sec") as Label).Text);
        ayudante.Ano_periodo_academico = "2018-1";

        Response.Redirect(string.Format("FormularioSeleccion.aspx?Valor={0}&Valor2={1}&Valor3={2}&Valor4={3}", ayudante.Rut_ayudante, ayudante.Asignatura_ayudante, ayudante.Seccion_ayudante, ayudante.Ano_periodo_academico));
        //Response.Redirect("FormularioSeleccion.aspx");
    }
}
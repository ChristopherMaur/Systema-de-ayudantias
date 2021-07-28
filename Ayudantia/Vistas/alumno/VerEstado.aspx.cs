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

public partial class Vistas_alumno_VerEstado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int Rut_postulante = Convert.ToInt32(Session["RUT"].ToString());

            string sql = "Select LI.id_listado,LI.id_oferta,LI.rut_postulacion,U.nombre_user,U.apellido_paterno_user, C.nombre_car, A.nombre_asig,SA.numero_sec,PA.estado_postulacion FROM LISTADO_POSTULACIONES LI, POSTULACION_AYUDANTE PA,ASIGNATURAS A, OFERTA_AYUDANTIA_ASIGNATURA O,CARRERAS C, SECCION_ASIGNATURA SA,USUARIOS U WHERE LI.rut_postulacion = PA.rut_postulacion and PA.codigo_asig = A.codigo_asig and LI.id_oferta = O.id_oferta and O.codigo_car = C.codigo_car and O.codigo_sec = SA.codigo_sec and LI.rut_postulacion = U.rut_user  and LI.rut_postulacion IN (SELECT LIS.rut_postulacion FROM LISTADO_POSTULACIONES LIS WHERE LIS.rut_postulacion=" + Rut_postulante + ")";
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

    protected void Button_Volver_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }

}
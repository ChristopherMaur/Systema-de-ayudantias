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

public partial class Vistas_profesor_Ayudantias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "Select A.id_ayudantia,A.rut_ayudante,U.nombre_user,U.apellido_paterno_user,A.codigo_car,C.nombre_car,A.codigo_asig,ASI.nombre_asig,A.codigo_sec,SA.numero_sec,A.ano_periodo_academico FROM AYUDANTIAS A,USUARIOS U,CARRERAS C,ASIGNATURAS ASI,SECCION_ASIGNATURA SA WHERE U.rut_user=A.rut_ayudante and A.codigo_car=C.codigo_car and A.codigo_asig=ASI.codigo_asig and A.codigo_sec=SA.codigo_sec";
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
            e.Row.Cells[0].Text = "Id Ayudantia";
            e.Row.Cells[1].Text = "Rut Ayudante";
            e.Row.Cells[2].Text = "Nombre Ayudante";
            e.Row.Cells[3].Text = "Apellido Ayudante";
            e.Row.Cells[4].Text = "Codigo Carrera";
            e.Row.Cells[5].Text = "Nombre Carrera";
            e.Row.Cells[6].Text = "Codigo Asignatura";
            e.Row.Cells[7].Text = "Nombre Asignatura";
            e.Row.Cells[8].Text = "Codigo Seccion";
            e.Row.Cells[9].Text = "Numero Seccion";
            e.Row.Cells[10].Text = "Periodo Ayudantia";
            e.Row.BackColor = Color.Pink;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView.SelectedRow;
        int rut_postulante = Convert.ToInt32((row.Cells[2].FindControl("lblRut_ayudante") as Label).Text);
        Response.Redirect(string.Format("PostulantesPorAsignatura.aspx?Valor={0}", rut_postulante));
        //Response.Redirect("FormularioSeleccion.aspx");
    }
}
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

public partial class Vistas_alumno_PostularAyudantia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "Select O.id_oferta, O.codigo_sec, O.codigo_car, O.horas_oferta," +
                " O.requisito_oferta,A.nombre_asig,C.nombre_car,S.numero_sec FROM OFERTA_AYUDANTIA_ASIGNATURA O," +
                " CARRERAS C,ASIGNATURAS A,SECCION_ASIGNATURA S,CARRERA_ASIGNATURA CA " +
                "WHERE O.codigo_sec=S.codigo_sec and CA.codigo_car_asig=S.codigo_car_asig" +
                " and A.codigo_asig = CA.codigo_asig and CA.codigo_car = C.codigo_car";
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
            e.Row.Cells[0].Text = "Id Oferta Postulación";
            e.Row.Cells[1].Text = "Codigo Seccion";
            e.Row.Cells[2].Text = "Codigo Carrera";
            e.Row.Cells[3].Text = "Nombre Carrera";
            e.Row.Cells[4].Text = "Nombre Asignatura";
            e.Row.Cells[5].Text = "Numero Sección";
            e.Row.Cells[6].Text = "Horas";
            e.Row.Cells[7].Text = "Requisitos";
            e.Row.BackColor = Color.Pink;
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView.SelectedRow;
        int Cod_sec = Convert.ToInt32((row.Cells[1].FindControl("lblCodigo_sec") as Label).Text);
        int id_oferta = Convert.ToInt32((row.Cells[0].FindControl("lblId_oferta") as Label).Text);
        int resultado = new DAOPostularAyudantia().BuscarAsignatura(Cod_sec);

        Response.Redirect(string.Format("FormularioPostulacion.aspx?Valor={0}&Valor2={1}", resultado, id_oferta));
        //Response.Redirect("FormularioPostulacion.aspx?Valor=" + resultado);

    }

        protected void Eliminar(Object sender, GridViewDeleteEventArgs e)
    {
        DAOPostularAyudantia daopostulante = new DAOPostularAyudantia();
        int id = Convert.ToInt32(GridView.Rows[e.RowIndex].RowIndex);
        daopostulante.EliminarPostulante(id);
        GridView.DataSource = daopostulante.CargarDatos();
        GridView.DataBind();
    }

}
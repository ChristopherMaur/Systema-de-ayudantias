using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Dao_Usuarios
/// </summary>
public class DAOPostularAyudantia
{
    private SqlDataAdapter da;
    private DataSet ds;
    private Conectar conexion;

    public DAOPostularAyudantia()
    {
        conexion = new Conectar();
        String sql = "select * from OFERTA_AYUDANTIA_ASIGNATURA";
        ds = new DataSet();
        da = new SqlDataAdapter(sql, conexion.Conexion);
        SqlCommandBuilder builder = new SqlCommandBuilder(da);
        da.Fill(ds, "OFERTA_AYUDANTIA_ASIGNATURA");
    }

    public List<DTOPostularAyudantia> CargarDatos()
    {
        List<DTOPostularAyudantia> listapostulacionayudante = new List<DTOPostularAyudantia>();

        foreach (DataRow row in ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows)
        {
            DTOPostularAyudantia postulante = new DTOPostularAyudantia();
            postulante.Id_oferta = Convert.ToInt32(row["id_oferta"]);
            postulante.Codigo_sec = Convert.ToInt32(row["codigo_sec"]);
            postulante.Codigo_car = Convert.ToInt32(row["codigo_car"]);
            postulante.Horas_oferta = Convert.ToInt32(row["horas_oferta"]);
            postulante.Requisito_oferta = row["requisito_oferta"].ToString();

            listapostulacionayudante.Add(postulante);
        }

        return listapostulacionayudante;
    }

    public int AgregarOferta(DTOPostularAyudantia nueva)
    {
        String sql = "Insert into OFERTA_AYUDANTIA_ASIGNATURA (id_oferta,codigo_sec,codigo_car,horas_oferta,requisito_oferta) values(@id_oferta,@codigo_sec,@codigo_car,@horas_oferta,@requisito_oferta)";
        return conexion.EjecutarNonQuery_oferta_ayu_asig(sql, nueva, "insert");
    }

    public void Actualizar()
    {
        da.Update(ds, "OFERTA_AYUDANTIA_ASIGNATURA");
    }

    public void SetDs(DataSet ds)
    {
        da.Fill(ds, "OFERTA_AYUDANTIA_ASIGNATURA");
    }

    public void AgregarPostulante(DTOPostularAyudantia postulante)
    {
        DataRow dr = ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].NewRow();
        dr["id_oferta"] = postulante.Id_oferta;
        dr["codigo_sec"] = postulante.Codigo_sec;
        dr["codigo_car"] = postulante.Codigo_car;
        dr["horas_oferta"] = postulante.Horas_oferta;
        dr["requisito_oferta"] = postulante.Requisito_oferta;

        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows.Add(dr);
        Actualizar();
    }

    public int BuscarAsignatura(int cod_sec)
    {

        String sql1 = "Select codigo_car_asig FROM SECCION_ASIGNATURA WHERE codigo_sec=@cod_sec";

        int codigo_car_asig = conexion.EjecutarNonQuery_Joins(sql1,cod_sec,"select_sec");

  
        String sql2 = "Select codigo_asig FROM CARRERA_ASIGNATURA WHERE codigo_car_asig=@codigo_car_asig";

        int cod_asig = conexion.EjecutarNonQuery_Joins(sql2, codigo_car_asig, "select_asig");

        return cod_asig;
    }

    public void EliminarPostulante(int numeroFila)
    {
        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows[numeroFila].Delete();
        Actualizar();
    }

    public void ActualizarPostulante(DTOPostularAyudantia postulante, int numeroFila)
    {

        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows[numeroFila]["id_oferta"] = postulante.Id_oferta;
        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows[numeroFila]["codigo_sec"] = postulante.Codigo_sec;
        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows[numeroFila]["codigo_car"] = postulante.Codigo_car;
        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows[numeroFila]["horas_oferta"] = postulante.Horas_oferta;
        ds.Tables["OFERTA_AYUDANTIA_ASIGNATURA"].Rows[numeroFila]["requisito_oferta"] = postulante.Requisito_oferta;
        Actualizar();

    }
}
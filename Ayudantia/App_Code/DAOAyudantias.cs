using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DAOAyudantias
/// </summary>
public class DAOAyudantias
{
    private Conectar conexion;

    public DAOAyudantias()
    {
        conexion = new Conectar();
    }

    public int IngresarAyudantia(DTOAyudante ayudante)
    {
        String sql = "Select A.codigo_asig From CARRERA_ASIGNATURA A, SECCION_ASIGNATURA SA WHERE SA.rut_user = @rut_ayudante and SA.codigo_car_asig = A.codigo_car_asig";
        String sql2 = "Select A.codigo_car From CARRERA_ASIGNATURA A, SECCION_ASIGNATURA SA WHERE SA.rut_user = @rut_ayudante and SA.codigo_car_asig = A.codigo_car_asig";
        String sql3 = "Select SA.codigo_sec From SECCION_ASIGNATURA SA WHERE SA.rut_user = @rut_ayudante ";

        DTOAyudantias nueva = new DTOAyudantias();
        nueva.Rut_ayudante = ayudante.Rut_ayudante;
        nueva.Codigo_asig = conexion.EjecutarNonQuery_Ayu(sql,ayudante,"select");
        nueva.Codigo_car = conexion.EjecutarNonQuery_Ayu(sql2, ayudante, "select");
        nueva.Codigo_sec = conexion.EjecutarNonQuery_Ayu(sql3, ayudante, "select");
        nueva.Ano_periodo_academico = ayudante.Ano_periodo_academico;


        String sql4 = "Insert into AYUDANTIAS (id_ayudantia,codigo_asig,rut_ayudante,codigo_car,codigo_sec,ano_periodo_academico) values(@id_ayudantia,@codigo_asig,@rut_ayudante,@codigo_car,@codigo_sec,@ano_periodo_academico)";
        return conexion.EjecutarNonQuery_Ayudantias(sql4, nueva, "insert");
    }

    public int BuscarPostulantes(string rut_postulante)
    {
        DTOAyudantias nuevo = new DTOAyudantias();
        nuevo.Rut_ayudante = Convert.ToInt32(rut_postulante.ToString());
        string sql2 = "Select id_oferta FROM LISTADO_POSTULACIONES WHERE rut_postulacion=@rut_postulacion";

        return conexion.EjecutarNonQuery_Ayudantias(sql2,nuevo,"buscar");
    }
}
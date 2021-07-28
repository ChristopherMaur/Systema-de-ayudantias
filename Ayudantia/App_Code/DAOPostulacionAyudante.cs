using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DAOPostulacionAyudante
/// </summary>
public class DAOPostulacionAyudante
{
    private Conectar conexion;

    public DAOPostulacionAyudante()
    {
        conexion = new Conectar();
    }

    public int IngresarPostulacion(DTOPostulacionAyudante nuevo)
    {
        String sql = "Insert into POSTULACION_AYUDANTE " +
            "(rut_postulacion,codigo_asig,fecha_postulacion,comentarios_postulacion," +
            "horas_postulacion,estado_postulacion ) values(@rut_postulacion," +
            " @codigo_asig, @fecha_postulacion, @comentarios_postulacion," +
            " @horas_postulacion, @estado_postulacion)";
        return conexion.EjecutarNonQuery_pos_ayu(sql, nuevo, "insert");
    }

    public int ActualizarPostulacion(int rut_ayudante)
    {
        DTOPostulacionAyudante nuevo = new DTOPostulacionAyudante();
        nuevo.Rut_ayudante = rut_ayudante;

        String sql = "UPDATE POSTULACION_AYUDANTE SET estado_postulacion = 'Seleccionado' " +
            "WHERE rut_postulacion = @rut_ayudante";
        return conexion.EjecutarNonQuery_pos_ayu(sql, nuevo, "update");
    }
}

 
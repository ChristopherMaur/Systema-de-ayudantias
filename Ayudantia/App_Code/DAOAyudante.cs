using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DAOAyudante
/// </summary>
public class DAOAyudante
{
    private Conectar conexion;
    public DAOAyudante()
    {
        conexion = new Conectar();
    }

    public int IngresarAyudante(DTOAyudante ayudante)
    {
        String sql = "Insert into AYUDANTE (rut_ayudante,ano_periodo_academico,asignatura_ayudante,seccion_ayudante,horas_ayudante,fecha_seleccion_ayudante,detalle_horario ) values(@rut_ayudante, @ano_periodo_academico, @asignatura_ayudante, @seccion_ayudante, @horas_ayudante, @fecha_seleccion_ayudante,@detalle_horario)";
        return conexion.EjecutarNonQuery_Ayu(sql, ayudante, "insert");
    }
}
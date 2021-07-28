using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOPostulacionAyudante
/// </summary>
public class DTOPostulacionAyudante
{
    private int rut_ayudante;
    private int codigo_asig;
    private DateTime fecha_postulacion;
    private String comentarios_postulacion;
    private int horas_postulacion;
    private String estado_postulacion;

    public DTOPostulacionAyudante()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Rut_ayudante { get => rut_ayudante; set => rut_ayudante = value; }
    public int Codigo_asig { get => codigo_asig; set => codigo_asig = value; }
    public DateTime Fecha_postulacion { get => fecha_postulacion; set => fecha_postulacion = value; }
    public string Comentarios_postulacion { get => comentarios_postulacion; set => comentarios_postulacion = value; }
    public int Horas_postulacion { get => horas_postulacion; set => horas_postulacion = value; }
    public string Estado_postulacion { get => estado_postulacion; set => estado_postulacion = value; }
}
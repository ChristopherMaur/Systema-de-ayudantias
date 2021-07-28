using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOAyudante
/// </summary>
public class DTOAyudante
{
    private int rut_ayudante;
    private String ano_periodo_academico;
    private String asignatura_ayudante;
    private int seccion_ayudante;
    private int horas_ayudante;
    private DateTime fecha_seleccion_ayudante;
    private String detalle_horario;

    public DTOAyudante()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Rut_ayudante { get => rut_ayudante; set => rut_ayudante = value; }
    public String Ano_periodo_academico { get => ano_periodo_academico; set => ano_periodo_academico = value; }
    public string Asignatura_ayudante { get => asignatura_ayudante; set => asignatura_ayudante = value; }
    public int Seccion_ayudante { get => seccion_ayudante; set => seccion_ayudante = value; }
    public int Horas_ayudante { get => horas_ayudante; set => horas_ayudante = value; }
    public DateTime Fecha_seleccion_ayudante { get => fecha_seleccion_ayudante; set => fecha_seleccion_ayudante = value; }
    public string Detalle_horario { get => detalle_horario; set => detalle_horario = value; }
}
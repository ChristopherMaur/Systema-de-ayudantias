using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOSeccionAsignatura
/// </summary>
public class DTOSeccionAsignatura
{
    private int codigo_sec;
    private int codigo_car_asig;
    private int rut_user;
    private int numero_sec;
    private DateTime fecha_registro_sec;

    public DTOSeccionAsignatura()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Codigo_sec { get => codigo_sec; set => codigo_sec = value; }
    public int Codigo_car_asig { get => codigo_car_asig; set => codigo_car_asig = value; }
    public int Rut_user { get => rut_user; set => rut_user = value; }
    public int Numero_sec { get => numero_sec; set => numero_sec = value; }
    public DateTime Fecha_registro_sec { get => fecha_registro_sec; set => fecha_registro_sec = value; }
}
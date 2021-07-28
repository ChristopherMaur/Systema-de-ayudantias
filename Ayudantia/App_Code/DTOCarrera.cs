using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOCarrera
/// </summary>
public class DTOCarrera
{
    private int codigo_car;
    private String nombre_car;
    private DateTime fecha_registro_car;

    public DTOCarrera()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Codigo_car { get => codigo_car; set => codigo_car = value; }
    public string Nombre_car { get => nombre_car; set => nombre_car = value; }
    public DateTime Fecha_registro_car { get => fecha_registro_car; set => fecha_registro_car = value; }
}
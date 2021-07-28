using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOCarreraAsignatura
/// </summary>
public class DTOCarreraAsignatura
{
    private int codigo_car_asig;
    private int codigo_car;
    private int codigo_asig;
    private DateTime fecha_registro_car_asig;

    public DTOCarreraAsignatura()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Codigo_car_asig { get => codigo_car_asig; set => codigo_car_asig = value; }
    public int Codigo_car { get => codigo_car; set => codigo_car = value; }
    public int Codigo_asig { get => codigo_asig; set => codigo_asig = value; }
    public DateTime Fecha_registro_car_asig { get => fecha_registro_car_asig; set => fecha_registro_car_asig = value; }
}
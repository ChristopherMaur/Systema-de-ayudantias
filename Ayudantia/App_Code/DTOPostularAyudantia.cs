using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOPostularAyudantia
/// </summary>
public class DTOPostularAyudantia
{
    private int id_oferta;
    private int codigo_sec;
    private String nombre_car;
    private String nombre_asig;
    private int numero_sec;
    private int codigo_car;
    private int horas_oferta;
    private String requisito_oferta;

    public DTOPostularAyudantia()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Id_oferta { get => id_oferta; set => id_oferta = value; }
    public int Codigo_sec { get => codigo_sec; set => codigo_sec = value; }
    public string Nombre_car { get => nombre_car; set => nombre_car = value; }
    public string Nombre_asig { get => nombre_asig; set => nombre_asig = value; }
    public int Numero_sec { get => numero_sec; set => numero_sec = value; }
    public int Codigo_car { get => codigo_car; set => codigo_car = value; }
    public int Horas_oferta { get => horas_oferta; set => horas_oferta = value; }
    public string Requisito_oferta { get => requisito_oferta; set => requisito_oferta = value; }
}
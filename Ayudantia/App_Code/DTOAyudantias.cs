using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOAyudantias
/// </summary>
public class DTOAyudantias
{
    private int id_ayudantia;
    private int rut_ayudante;
    private String nombre_user;
    private String apellido_paterno_user;
    private int codigo_car;
    private String nombre_car;
    private int codigo_asig;
    private String nombre_asig;
    private int codigo_sec;
    private int numero_sec;
    private String ano_periodo_academico;

    public DTOAyudantias()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Id_ayudantia { get => id_ayudantia; set => id_ayudantia = value; }
    public int Rut_ayudante { get => rut_ayudante; set => rut_ayudante = value; }
    public string Nombre_user { get => nombre_user; set => nombre_user = value; }
    public string Apellido_paterno_user { get => apellido_paterno_user; set => apellido_paterno_user = value; }
    public int Codigo_car { get => codigo_car; set => codigo_car = value; }
    public string Nombre_car { get => nombre_car; set => nombre_car = value; }
    public int Codigo_asig { get => codigo_asig; set => codigo_asig = value; }
    public string Nombre_asig { get => nombre_asig; set => nombre_asig = value; }
    public int Codigo_sec { get => codigo_sec; set => codigo_sec = value; }
    public int Numero_sec { get => numero_sec; set => numero_sec = value; }
    public string Ano_periodo_academico { get => ano_periodo_academico; set => ano_periodo_academico = value; }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DTOVerPostulaciones
/// </summary>
public class DTOVerPostulaciones
{
    private int id_listado;
    private int id_oferta;
    private int rut_postulacion;
    private String nombre_user;
    private String apellido_paterno_user;
    private String nombre_car;
    private String nombre_asig;
    private int numero_sec;
    private String estado_postulacion;

    public DTOVerPostulaciones()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Id_listado { get => id_listado; set => id_listado = value; }
    public int Id_oferta { get => id_oferta; set => id_oferta = value; }
    public int Rut_postulacion { get => rut_postulacion; set => rut_postulacion = value; }
    public string Nombre_user { get => nombre_user; set => nombre_user = value; }
    public string Apellido_paterno_user { get => apellido_paterno_user; set => apellido_paterno_user = value; }
    public string Nombre_car { get => nombre_car; set => nombre_car = value; }
    public string Nombre_asig { get => nombre_asig; set => nombre_asig = value; }
    public int Numero_sec { get => numero_sec; set => numero_sec = value; }
    public string Estado_postulacion { get => estado_postulacion; set => estado_postulacion = value; }
}
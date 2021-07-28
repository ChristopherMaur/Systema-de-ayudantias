using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Dto_Usuarios
/// </summary>
public class DTOUsuarios
{
    private int rut_user;
    private int dv_user;
    private String nombre_user;
    private String apellido_paterno_user;
    private String apellido_materno_user;
    private DateTime fecha_registro_user;
    private String clave_user;
    private String email_user;
    private int telefono_user;
    private String rol_user;

    public DTOUsuarios()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int Rut_user { get => rut_user; set => rut_user = value; }
    public int Dv_user { get => dv_user; set => dv_user = value; }
    public string Nombre_user { get => nombre_user; set => nombre_user = value; }
    public string Apellido_paterno_user { get => apellido_paterno_user; set => apellido_paterno_user = value; }
    public string Apellido_materno_user { get => apellido_materno_user; set => apellido_materno_user = value; }
    public DateTime Fecha_registro_user { get => fecha_registro_user; set => fecha_registro_user = value; }
    public string Clave_user { get => clave_user; set => clave_user = value; }
    public string Email_user { get => email_user; set => email_user = value; }
    public int Telefono_user { get => telefono_user; set => telefono_user = value; }
    public string Rol_user { get => rol_user; set => rol_user = value; }
}
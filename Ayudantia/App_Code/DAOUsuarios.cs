using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Dao_Usuarios
/// </summary>
public class DAOUsuarios
{
    private SqlDataAdapter da;
    private DataSet ds;
    private Conectar conexion;

    public DAOUsuarios()
    {
        conexion = new Conectar();
        String sql = "select * from USUARIOS";
        ds = new DataSet();
        da = new SqlDataAdapter(sql, conexion.Conexion);
        SqlCommandBuilder builder = new SqlCommandBuilder(da);
        da.Fill(ds, "USUARIOS");
    }

    public List<DTOUsuarios> CargarDatos()
    {
        List<DTOUsuarios> listaUsuarios = new List<DTOUsuarios>();

        foreach (DataRow row in ds.Tables["USUARIOS"].Rows)
        {
            DTOUsuarios usuario = new DTOUsuarios();
            usuario.Rut_user = Convert.ToInt32(row["rut_user"].ToString());
            usuario.Clave_user = row["clave_user"].ToString();
            usuario.Dv_user = Convert.ToInt32(row["dv_user"]);
            usuario.Nombre_user = row["nombre_user"].ToString();
            usuario.Apellido_paterno_user = row["apellido_paterno_user"].ToString();
            usuario.Apellido_materno_user = row["apellido_materno_user"].ToString();
            usuario.Fecha_registro_user = Convert.ToDateTime(row["fecha_registro_user"]);
            usuario.Email_user = row["email_user"].ToString();
            usuario.Telefono_user = Convert.ToInt32(row["telefono_user"]);
            usuario.Rol_user = row["rol_user"].ToString();

            listaUsuarios.Add(usuario);
        }

        return listaUsuarios;
    }

    public String GetUsuario(DTOUsuarios usuario)
    {
        String sql = "SELECT rol_user FROM USUARIOS WHERE rut_user=@rut and clave_user=@clave";
        return conexion.getUsuario(sql, usuario);
    }

    public void Actualizar()
    {
        da.Update(ds, "USUARIOS");
    }

    public void SetDs(DataSet ds)
    {
        da.Fill(ds, "USUARIOS");

    }

    public void AgregarUsuario(DTOUsuarios usuario)
    {

        DataRow dr = ds.Tables["USUARIOS"].NewRow();
        dr["rut_user"] = usuario.Rut_user;
        dr["clave_user"] = usuario.Clave_user;
        dr["dv_user"] = usuario.Dv_user;
        dr["nombre_user"] = usuario.Nombre_user;
        dr["apellido_paterno_user"] = usuario.Apellido_paterno_user;
        dr["apellido_materno_user"] = usuario.Apellido_materno_user;
        dr["fecha_registro_user"] = usuario.Fecha_registro_user;
        dr["email_user"] = usuario.Email_user;
        dr["telefono_user"] = usuario.Telefono_user;
        dr["rol_user"] = usuario.Rol_user;

        ds.Tables["USUARIOS"].Rows.Add(dr);
        Actualizar();
    }

    public void EliminarUsuario(int numeroFila)
    {
        ds.Tables["USUARIOS"].Rows[numeroFila].Delete();
        Actualizar();
    }

    public void ActualizarUsuario(DTOUsuarios usuario, int numeroFila)
    {
        ds.Tables["USUARIOS"].Rows[numeroFila]["rut_user"] = usuario.Rut_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["clave_user"] = usuario.Clave_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["dv_user"] = usuario.Dv_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["nombre_user"] = usuario.Nombre_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["apellido_paterno_user"] = usuario.Apellido_paterno_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["apellido_materno_user"] = usuario.Apellido_materno_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["email_user"] = usuario.Email_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["telefono_user"] = usuario.Telefono_user;
        ds.Tables["USUARIOS"].Rows[numeroFila]["rol_user"] = usuario.Rol_user;

        Actualizar();
    }

    public int LoginUsuario(DTOUsuarios usuario)
    {
        String agregar = "SELECT * FROM USUARIOS WHERE rut_user=@rut and clave_user=@clave";
        return conexion.EjecutarNonQuery(agregar, usuario, "select");
    }
}
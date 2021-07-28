using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

/// <summary>
/// Descripción breve de Conectar
/// </summary>
public class Conectar
{
    private String connectionString;
    private SqlConnection conexion;

    public Conectar()
    {
        connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["AyudantiaConnectionString"].ConnectionString;
        conexion = new SqlConnection(connectionString);
        conexion.Open();
    }

    public String getUsuario(String sql, DTOUsuarios user)
    {
        String ROL = "";
        try
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(sql, conexion);
            cmd.Parameters.AddWithValue("@rut", user.Rut_user);
            cmd.Parameters.AddWithValue("@clave", user.Clave_user);

            SqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ROL = dr[0].ToString();
            }
            CerrarConexion();
            return ROL;

        }
        catch
        {
            return ROL;
        }

    }

    internal int EjecutarNonQuery_Ayudantias(string sql, DTOAyudantias ayudantias, string tipo)
    {
        int cantidadFilas;
        try
        {
            if (tipo.Equals("insert"))
            {
                ayudantias.Id_ayudantia = Contar2();
                SqlCommand cmd2 = new SqlCommand(sql, conexion);
                cmd2.Parameters.AddWithValue("@id_ayudantia", ayudantias.Id_ayudantia);
                cmd2.Parameters.AddWithValue("@codigo_asig", ayudantias.Codigo_asig);
                cmd2.Parameters.AddWithValue("@rut_ayudante", ayudantias.Rut_ayudante);
                cmd2.Parameters.AddWithValue("@codigo_car", ayudantias.Codigo_car);
                cmd2.Parameters.AddWithValue("@codigo_sec", ayudantias.Codigo_sec);
                cmd2.Parameters.AddWithValue("@ano_periodo_academico", ayudantias.Ano_periodo_academico);
                cantidadFilas = Convert.ToInt32(cmd2.ExecuteScalar());
                cmd2.Dispose();
                CerrarConexion();
                return cantidadFilas;
            }
            if (tipo.Equals("buscar"))
            {
                SqlCommand cmd2 = new SqlCommand(sql, conexion);
                cmd2.Parameters.AddWithValue("@rut_postulacion", ayudantias.Rut_ayudante);
                int id_oferta = (Int32)cmd2.ExecuteScalar();
                cmd2.Dispose();
                CerrarConexion();
                return id_oferta;
            }
            return -2;  
        }
        catch (SqlException ex)
        {
            MessageBox.Show(ex.Message);
            return -3;
        }
    }

    internal int EjecutarNonQuery_oferta_ayu_asig(string sql, DTOPostularAyudantia nueva, string tipo)
    {
        int cantidadFilas;
        try
        {
            if (tipo.Equals("insert"))
        {
            nueva.Id_oferta = Contar3();
            SqlCommand cmd = new SqlCommand(sql, conexion);
            cmd.Parameters.AddWithValue("@id_oferta", nueva.Id_oferta);
            cmd.Parameters.AddWithValue("@codigo_sec", nueva.Codigo_sec);
            cmd.Parameters.AddWithValue("@codigo_car", nueva.Codigo_car);
            cmd.Parameters.AddWithValue("@horas_oferta", nueva.Horas_oferta);
            cmd.Parameters.AddWithValue("@requisito_oferta", nueva.Requisito_oferta);
            cantidadFilas = cmd.ExecuteNonQuery();
            cmd.Dispose();
            CerrarConexion();
            return cantidadFilas;
        }
        return -2;
        }
        catch (SqlException ex)
        {
            MessageBox.Show(ex.Message);
            return -3;
        }
    }

    internal int EjecutarNonQuery_Ayu(string sql, DTOAyudante ayudante, string tipo)
    {
        int cantidadFilas;
        try
        {
            if (tipo.Equals("select"))
            {
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@rut_ayudante", ayudante.Rut_ayudante);
                cantidadFilas = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Dispose();
                return cantidadFilas;
            }
            if (tipo.Equals("insert"))
            {
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@rut_ayudante", ayudante.Rut_ayudante);
                cmd.Parameters.AddWithValue("@ano_periodo_academico", ayudante.Ano_periodo_academico);
                cmd.Parameters.AddWithValue("@asignatura_ayudante", ayudante.Asignatura_ayudante);
                cmd.Parameters.AddWithValue("@seccion_ayudante", ayudante.Seccion_ayudante);
                cmd.Parameters.AddWithValue("@horas_ayudante", ayudante.Horas_ayudante);
                cmd.Parameters.AddWithValue("@fecha_seleccion_ayudante", ayudante.Fecha_seleccion_ayudante);
                cmd.Parameters.AddWithValue("@detalle_horario", ayudante.Detalle_horario);
                cantidadFilas = cmd.ExecuteNonQuery();
                cmd.Dispose();
                CerrarConexion();
                return cantidadFilas;
            }
            return -2;
        }
        catch (SqlException ex)
        {
            MessageBox.Show(ex.Message);
            return -3;
        }
    }

    internal int EjecutarNonQuery_Lis_Post(string sql, DTOVerPostulaciones postulante, string tipo)
    {
        int cantidadFilas;
        try
        {
            if (tipo.Equals("insert"))
            {
                postulante.Id_listado = Contar();
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@id_listado", postulante.Id_listado);
                cmd.Parameters.AddWithValue("@id_oferta", postulante.Id_oferta);
                cmd.Parameters.AddWithValue("@rut_postulacion", postulante.Rut_postulacion);

                cantidadFilas = cmd.ExecuteNonQuery();
                cmd.Dispose();
                CerrarConexion();
                return cantidadFilas;
            }
            return -2;
        }
        catch (SqlException ex)
        {
            MessageBox.Show(ex.Message);
            return -3;
        }
    }

    internal int EjecutarNonQuery_pos_ayu(string sql, DTOPostulacionAyudante nuevo, string tipo)
    {
        int cantidadFilas;
        try
        {
            if (tipo.Equals("insert"))
            {
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@rut_postulacion", nuevo.Rut_ayudante);
                cmd.Parameters.AddWithValue("@codigo_asig", nuevo.Codigo_asig);
                cmd.Parameters.AddWithValue("@fecha_postulacion", nuevo.Fecha_postulacion);
                cmd.Parameters.AddWithValue("@comentarios_postulacion", nuevo.Comentarios_postulacion);
                cmd.Parameters.AddWithValue("@horas_postulacion", nuevo.Horas_postulacion);
                cmd.Parameters.AddWithValue("@estado_postulacion", nuevo.Estado_postulacion);
                cantidadFilas = cmd.ExecuteNonQuery();
                cmd.Dispose();
                CerrarConexion();
                return cantidadFilas;
            }
            if (tipo.Equals("update"))
            {
                
                string sql2 = "Select id_oferta FROM LISTADO_POSTULACIONES WHERE rut_postulacion=@rut_postulacion";
                SqlCommand cmd2 = new SqlCommand(sql2, conexion);
                cmd2.Parameters.AddWithValue("@rut_postulacion", nuevo.Rut_ayudante);
                int id_oferta = (Int32)cmd2.ExecuteScalar();

                String sql3 = "UPDATE POSTULACION_AYUDANTE  SET estado_postulacion = 'Rechazado' WHERE rut_postulacion IN (SELECT rut_postulacion FROM LISTADO_POSTULACIONES WHERE id_oferta=@id_oferta )";
                SqlCommand cmd3 = new SqlCommand(sql3, conexion);
                cmd3.Parameters.AddWithValue("@id_oferta", id_oferta);
                int delta = cmd3.ExecuteNonQuery();

                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@rut_ayudante", nuevo.Rut_ayudante);
                cantidadFilas = cmd.ExecuteNonQuery();

                cmd.Dispose();
                cmd2.Dispose();
                cmd3.Dispose();
                CerrarConexion();
                return cantidadFilas;
            }
            return -2;
        }
        catch (SqlException ex)
        {
            MessageBox.Show(ex.Message);
            return -3;
        }
    }

    internal int EjecutarNonQuery_Joins(string sql, int busqueda, string tipo) {
        int Codigo;
        try  {
            if (tipo.Equals("select_asig")) {
                conexion.Open();
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@codigo_car_asig", busqueda);
                Codigo = (Int32)cmd.ExecuteScalar();

                CerrarConexion();
                return Codigo;
            }
            if (tipo.Equals("select_sec")) {
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@cod_sec", busqueda);
                Codigo = (Int32)cmd.ExecuteScalar();
                CerrarConexion();
                return Codigo;
            }
            return -2;
        }
        catch {
            return -3;
        }
    }

    public int EjecutarNonQuery(String sql, DTOUsuarios user, string tipo)
    {
        int cantidadFilas;
        try
        {
            if (tipo.Equals("insert"))
            {
                return 1;
            }
            if (tipo.Equals("select"))
            {
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.Parameters.AddWithValue("@rut", user.Rut_user);
                cmd.Parameters.AddWithValue("@clave", user.Clave_user);
                cantidadFilas = Convert.ToInt32(cmd.ExecuteScalar());
                CerrarConexion();
                return cantidadFilas;
            }

            if (tipo.Equals("update"))
            {

                return -1;
            }
            if (tipo.Equals("delete"))
            {
                return -1;
            }
            return -2;
        }
        catch
        {
            return -3;
        }
    }

    public int Contar3()
    {
        try
        {
            String sql = "SELECT id_oferta FROM OFERTA_AYUDANTIA_ASIGNATURA";
            DataTable dt = new DataTable();
            SqlCommand cmd3 = new SqlCommand(sql, conexion);
            SqlDataReader dr = cmd3.ExecuteReader();
            cmd3.Dispose();

            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (i == (int)row["id_oferta"])
                {
                    i = i + 1;
                }
                else
                {
                    break;
                }
            }
            dr.Close();
            return i;
        }
        catch
        {

            return -2;
        }
    }

    public int Contar2()
    {
        try
        {
            String sql = "SELECT id_ayudantia FROM AYUDANTIAS";
            DataTable dt = new DataTable();
            SqlCommand cmd3 = new SqlCommand(sql, conexion);
            SqlDataReader dr = cmd3.ExecuteReader();
            cmd3.Dispose();
            
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (i == (int)row["id_ayudantia"])
                {
                    i = i + 1;
                }
                else
                {
                    break;
                }
            }
            dr.Close();
            return i;
        }
        catch
        {
            
            return -2;
        }
    }

    public int Contar()
    {
        try
        {
            String sql = "SELECT id_listado FROM LISTADO_POSTULACIONES";
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(sql, conexion);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (i == (int)row["id_listado"])
                {
                    i = i + 1;
                }
                else
                {
                    break;
                }
            }
            return i;
        }
        catch
        {
            return -2;
        }
    }


    public void CerrarConexion()
    {
        conexion.Close();
    }

    public String ConnectionString { get => connectionString; set => connectionString = value; }
    public SqlConnection Conexion { get => conexion; set => conexion = value; }
}
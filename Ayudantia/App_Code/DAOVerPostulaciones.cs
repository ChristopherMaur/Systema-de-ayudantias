using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Dao_Usuarios
/// </summary>
public class DAOVerPostulaciones
{

    private Conectar conexion;

    public DAOVerPostulaciones()
    {
        conexion = new Conectar();

    }


    public int  IngresarListadoPostulacion(DTOVerPostulaciones postulante) {

        String sql = "Insert into LISTADO_POSTULACIONES (id_listado,id_oferta,rut_postulacion) values(@id_listado, @id_oferta, @rut_postulacion)";

        return conexion.EjecutarNonQuery_Lis_Post(sql,postulante,"insert");
    }
   
}
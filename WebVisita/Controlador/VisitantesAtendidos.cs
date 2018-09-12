using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebVisita.Classes;

namespace WebVisita
{
    public partial  class VisitantesAtendidos
    {
        public static DataSet ObtenerVisitas(string fechaDesdeRegistroVisita, string fechaHastaRegistroVisita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@FechaDesdeRegistroVisita", SqlDbType.VarChar, 0, fechaDesdeRegistroVisita),
                    DBHelper.MakeParam("@FechaHastaRegistroVisita", SqlDbType.VarChar, 0, fechaHastaRegistroVisita)
                };

            return DBHelper.ExecuteDataSet("usp_VisitantesAtendidos_ObtenerVisitas", dbParams);
        }
        public static DataSet ObtenerVisitasGerencia(string fechaDesdeRegistroVisita, string fechaHastaRegistroVisita, int codigoGerencia)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@FechaDesdeRegistroVisita", SqlDbType.VarChar, 0, fechaDesdeRegistroVisita),
                    DBHelper.MakeParam("@FechaHastaRegistroVisita", SqlDbType.VarChar, 0, fechaHastaRegistroVisita),
                    DBHelper.MakeParam("@GerenciaID", SqlDbType.Int, 0, codigoGerencia)
                };

            return DBHelper.ExecuteDataSet("usp_ActualizarEstatusVisitante_ObtenerVisitas", dbParams);
        }
    }
}
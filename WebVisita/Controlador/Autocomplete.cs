using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebVisita.Classes;

namespace Admin
{
    public partial class Autocomplete
    {
        public static DataSet ObtenerOrganismos(string sQuery)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@Query", SqlDbType.VarChar, 0, sQuery),
                };
            return DBHelper.ExecuteDataSet("usp_Autocomplete_ObtenerOrganismos", dbParams);
        }
        public static DataSet ObtenerVisitantes(string sQuery)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@Query", SqlDbType.VarChar, 0, sQuery),
                };
            return DBHelper.ExecuteDataSet("usp_Autocomplete_ObtenerVisitantes", dbParams);
        }
        public static DataSet ObtenerPersonal(string sQuery)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@Query", SqlDbType.VarChar, 0, sQuery),
                };
            return DBHelper.ExecuteDataSet("usp_Autocomplete_ObtenerPersonal", dbParams);
        }
        public static DataSet ObtenerUsuarios(string sQuery)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@Query", SqlDbType.VarChar, 0, sQuery),
                };
                return DBHelper.ExecuteDataSet("usp_Autocomplete_ObtenerUsuarios", dbParams);
        }
        public static DataSet ObtenerGrupos(string sQuery)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@Query", SqlDbType.VarChar, 0, sQuery),
                };
            return DBHelper.ExecuteDataSet("usp_Autocomplete_ObtenerGrupos", dbParams);
        }
        public static DataSet ObtenerObjetos(string sQuery)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@Query", SqlDbType.VarChar, 0, sQuery),
                };
            return DBHelper.ExecuteDataSet("usp_Autocomplete_ObtenerObjetos", dbParams);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebVisita.Classes;

namespace WebVisita
{
    public partial class AtencionVisita
    {
        public static int InsertarVisita(CAtencionVisita objetoVisita)
        {
            SqlDbType tipoDato;
            if (objetoVisita.FechaSalidaVisita == "")
            {
                tipoDato = SqlDbType.VarChar;
            }
            else
            {
                tipoDato = SqlDbType.SmallDateTime;
            }
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@NombreOrganismo", SqlDbType.VarChar, 0, objetoVisita.NombreOrganismo),
                    DBHelper.MakeParam("@OrganismoID", SqlDbType.Int, 0, objetoVisita.OrganismoID),
                    DBHelper.MakeParam("@CedulaVisitante", SqlDbType.Int, 0, objetoVisita.CedulaVisitante),
                    DBHelper.MakeParam("@NombreVisitante", SqlDbType.VarChar, 0, objetoVisita.NombreVisitante),
                    DBHelper.MakeParam("@TelefonoVisitante", SqlDbType.VarChar, 0, objetoVisita.TelefonoVisitante),
                    DBHelper.MakeParam("@PersonalID", SqlDbType.Int, 0, objetoVisita.PersonalID),
                    DBHelper.MakeParam("@AsuntoID", SqlDbType.Int, 0, objetoVisita.AsuntoID),
                    DBHelper.MakeParam("@ObservacionVisita", SqlDbType.VarChar, 0, objetoVisita.ObservacionVisita),
                    DBHelper.MakeParam("@EstatusVisitanteID", SqlDbType.Int, 0, objetoVisita.EstatusVisitanteID),
                    DBHelper.MakeParam("@SeguridadUsuarioDatosID", SqlDbType.Int, 0, objetoVisita.SeguridadUsuarioDatosID),
                    DBHelper.MakeParam("@FechaSalidaVisita", tipoDato, 0, objetoVisita.FechaSalidaVisita)
            };

            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_AtencionVisita_Insertar", dbParams));
        }
        public static int  EliminarVisita(int visitaID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@VisitaID", SqlDbType.Int, 0, visitaID),
                };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_AtencionVisita_EliminarVisita", dbParams));
        }
        public static int ActualizarLista(CAtencionVisita objetoVisita)
        {
            SqlDbType tipoDato;
            if (objetoVisita.FechaSalidaVisita == "")
            {
                tipoDato = SqlDbType.VarChar;
            }
            else
            {
                tipoDato = SqlDbType.SmallDateTime;
            }

            SqlParameter[] dbParams = new SqlParameter[]
                {
                DBHelper.MakeParam("@VisitaID", SqlDbType.Int, 0, objetoVisita.VisitaID),
                DBHelper.MakeParam("@EstatusVisitanteID", SqlDbType.Int, 0, objetoVisita.EstatusVisitanteID),
                DBHelper.MakeParam("@FechaSalidaVisita", tipoDato, 0, objetoVisita.FechaSalidaVisita)
                };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_AtencionVisita_ActualizarLista", dbParams));

        }
        public static DataSet ObtenerVisitas()
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                   
                };

            return DBHelper.ExecuteDataSet("usp_AtencionVisita_ObtenerVisitas",  dbParams);
        }

    }
}
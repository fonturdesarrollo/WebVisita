using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebVisita
{
    public partial class ActualizarEstatusVisitante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string fechaDia = DateTime.Now.ToString("dd/MM/yyyy");
                CargarDetalleVisitas(fechaDia, fechaDia);
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            ActualizarLista();
        }
        private void CargarDetalleVisitas(string fechaDesdeConsulta, string fechaHastaConsulta)
        {
            try
            {
                int codigoDeTecnico = Convert.ToInt32(this.Session["UserId"].ToString());
                WebVisita.Clases.CSeguridad objetoSeguridad = new WebVisita.Clases.CSeguridad();
                objetoSeguridad.SeguridadUsuarioDatosID = codigoDeTecnico;
                int gerenciaID = 0;
                if (objetoSeguridad.EsUsuarioAdministrador() == false) 
                {
                    gerenciaID = Convert.ToInt32(Session["GerenciaIDUsuario"]);
                }

                DateTime fecha1 = Convert.ToDateTime(fechaDesdeConsulta);
                DateTime fecha2 = Convert.ToDateTime(fechaHastaConsulta);
                string f1 = string.Format("{0:yyyy-MM-dd}", fecha1);
                string f2 = string.Format("{0:yyyy-MM-dd}", fecha2);

                DataSet ds = VisitantesAtendidos.ObtenerVisitasGerencia(f1, f2, gerenciaID);
                DataTable dt = ds.Tables[0];
                gridDetalle.DataSource = dt;
                gridDetalle.DataBind();
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private void ActualizarLista()
        {
            try
            {
                string fechaDia = DateTime.Now.ToString("dd/MM/yyyy");
                int contadorRegistros = 0;
                List<CAtencionVisita> objetoLista = new List<CAtencionVisita>();
                string sResultado = ValidarDatos(ref objetoLista);
                foreach (CAtencionVisita prod in objetoLista)
                {
                    contadorRegistros = contadorRegistros + 1;
                    AtencionVisita.ActualizarLista(prod);
                    CargarDetalleVisitas(fechaDia, fechaDia);

                }
                if (contadorRegistros > 0)
                {
                    messageBox.ShowMessage("Lista actualizada.");
                }
                else
                {
                    messageBox.ShowMessage("No existen registros por actualizar");
                }

            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private string ValidarDatos(ref List<CAtencionVisita> objetoAsignarEstatus)
        {
            try
            {
                string sResultado = "";
                CAtencionVisita objetoAsignaEstatus = null;
                int j = 1;
                foreach (GridViewRow dr in this.gridDetalle.Rows)
                {
                    objetoAsignaEstatus = new CAtencionVisita();
                    objetoAsignaEstatus.EstatusVisitanteID = Utils.utils.ToInt(((DropDownList)dr.FindControl("ddlEstatus")).SelectedValue);
                    objetoAsignaEstatus.VisitaID = Utils.utils.ToInt(((TextBox)dr.FindControl("txtCodVisita")).Text);
                    if (Utils.utils.ToInt(((DropDownList)dr.FindControl("ddlEstatus")).SelectedValue) == 2)
                    {
                        objetoAsignaEstatus.FechaSalidaVisita = Convert.ToString(System.DateTime.Now);
                    }
                    else
                    {
                        objetoAsignaEstatus.FechaSalidaVisita = "";
                    }

                    if (objetoAsignaEstatus.EstatusVisitanteID == 0)
                        sResultado = "Estatus <br>";
                    objetoAsignarEstatus.Add(objetoAsignaEstatus);

                    if (sResultado != "")
                    {
                        sResultado = "En la Fila " + j.ToString() + " faltan ingresar los siguientes datos:<br><br>" + sResultado;
                        break;
                    }
                    j++;
                }

                return sResultado;
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
                return "";
            }
        }
    }
}
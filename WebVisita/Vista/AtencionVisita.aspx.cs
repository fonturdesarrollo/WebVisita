using Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

using System.IO;


namespace WebVisita
{
    public partial class AtencionVisita : Admin.paginaBase
    {
        protected new void Page_Load(object sender, EventArgs e)
        {
            this.txtCedula.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event); ");
            this.txtTelefono.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event); ");
            if (!IsPostBack)
            {
                txtOrganismo.Focus();
                CargarDetalleVisitasDia();
                CargarAsuntos();
            }
        }

        private void CargarAsuntos()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "select * from Asunto ORDER BY AsuntoID";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;

            try
            {
                con.Open();
                ddlAsunto.DataSource = cmd.ExecuteReader();
                ddlAsunto.DataTextField = "NombreAsunto";
                ddlAsunto.DataValueField = "AsuntoID";
                ddlAsunto.DataBind();
                ddlAsunto.Items.Insert(0, new ListItem("--Seleccione el motivo de la visita--", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ActualizarVisita(false);
        }
        private void ActualizarVisita(bool esAtendido)
        {
            if (EsTodoCorrecto() == true)
            {
                try
                {
                    CAtencionVisita objetoVisita = new CAtencionVisita();
                    txtNombre.Enabled = true;
                    txtCedula.Enabled = true;
                    objetoVisita.NombreOrganismo = this.txtOrganismo.Text.ToUpper();
                    objetoVisita.OrganismoID = Convert.ToInt32(hdnOrganismoID.Value);
                    objetoVisita.CedulaVisitante = Convert.ToInt32(this.txtCedula.Text);
                    objetoVisita.NombreVisitante = this.txtNombre.Text.ToUpper();
                    objetoVisita.TelefonoVisitante = this.txtTelefono.Text.ToUpper();
                    objetoVisita.PersonalID = Convert.ToInt32(this.hdnPersonalID.Value);
                    objetoVisita.AsuntoID = Convert.ToInt32(this.ddlAsunto.SelectedValue);
                    objetoVisita.ObservacionVisita = this.txtObservaciones.Text.ToUpper();
                    objetoVisita.SeguridadUsuarioDatosID = Convert.ToInt32(Session["UserId"].ToString());
                    if (esAtendido == true)
                    {
                        objetoVisita.EstatusVisitanteID = 2;
                        objetoVisita.FechaSalidaVisita = Convert.ToString(System.DateTime.Now);
                    }
                    else
                    {
                        objetoVisita.EstatusVisitanteID = 1;
                        objetoVisita.FechaSalidaVisita = "";
                    }

                    if (AtencionVisita.InsertarVisita(objetoVisita) > 0)
                    {
                        CargarDetalleVisitasDia();
                        LimpiarControles();
                        messageBox.ShowMessage("La visita se ingresó correctamente");

                    }
                }
                catch (Exception ex)
                {
                    messageBox.ShowMessage(ex.Message + ex.StackTrace);
                }
            }
        }

        private bool EsTodoCorrecto()
        {
            bool resultado = true;
            DataSet ds = Autocomplete.ObtenerVisitantes(txtCedula.Text);
            if (ds.Tables[0].Rows.Count > 0 && hdnCedula.Value =="0")
            {
                resultado = false;
                messageBox.ShowMessage("La cédula ya esta registrada, debe seleccionar de la lista en el recuadro (CEDULA) el nombre de la persona.");
            }

            if (hdnPersonalID.Value == "0")
            {
                resultado = false;
                resultado = false;
                messageBox.ShowMessage("Debe buscar y seleccionar al personal a visitar, si no existe por favor consulte al area de recursos humanos.");
            }
            if(Convert.ToInt32(ddlAsunto.SelectedValue) ==0)
            {
                resultado = false;
                messageBox.ShowMessage("Debe seleccionar el motivo de la visita");
            }

            return resultado;
        }
        private void ActualizarLista()
        {
            try
            {
                int contadorRegistros = 0;
                List<CAtencionVisita> objetoLista = new List<CAtencionVisita>();
                string sResultado = ValidarDatos(ref objetoLista);
                foreach (CAtencionVisita prod in objetoLista)
                {
                    contadorRegistros = contadorRegistros + 1;
                    AtencionVisita.ActualizarLista(prod);
                    CargarDetalleVisitasDia();

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
                    if(Utils.utils.ToInt(((DropDownList)dr.FindControl("ddlEstatus")).SelectedValue) == 2)
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
        public void CargarDetalleVisitasDia()
        {
            try
            {
                DataSet ds = AtencionVisita.ObtenerVisitas();
                DataTable dt = ds.Tables[0];
                gridDetalle.DataSource = dt;
                gridDetalle.DataBind();
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }

        }
        private void LimpiarControles()
        {
            txtOrganismo.Text = "";
            txtNombre.Text = "";
            txtCedula.Text = "";
            txtTelefono.Text = "";
            txtObservaciones.Text = "";
            txtPersonal.Text = "";
            hdnCedula.Value = "0";
            hdnPersonalID.Value = "0";
            hdnOrganismoID.Value = "0";
            txtOrganismo.ReadOnly = false;
            txtPersonal.ReadOnly = false;
            txtCedula.ReadOnly = false;
            txtNombre.ReadOnly = false;
            imgPersonal.ImageUrl = "http://172.16.7.240:8087/FotosVisitas/crm.gif";
            imgVisitado.ImageUrl = "http://172.16.7.240:8087/FotosVisitas/crm.gif";
            CargarAsuntos();
            txtOrganismo.Focus();


        }
        protected void gridDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EliminarDetalle")
                {
                    CAtencionVisita objetoVisita = new CAtencionVisita();
                    objetoVisita.VisitaID = Convert.ToInt32(e.CommandArgument.ToString());

                    if (AtencionVisita.EliminarVisita(Convert.ToInt32(e.CommandArgument.ToString())) > 0)
                    {
                        messageBox.ShowMessage("Visita eliminada.");
                        CargarDetalleVisitasDia();
                    }
                    else
                    {
                        messageBox.ShowMessage("No se pudo eliminar el detalle. Intente nuevamente.");
                    }
                }
                else if(e.CommandName == "AsignarFoto")
                {
                    string nombreArchivoFoto = e.CommandArgument.ToString() +".jpg";
                    File.Copy("\\\\172.16.7.240\\BasesDatos\\CallCenter\\silueta.png", "\\\\172.16.7.240\\BasesDatos\\FotosVisitantes\\" + nombreArchivoFoto, true);
                    messageBox.ShowMessage("Foto asignada");
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }

        }

        protected void btnResuelto_Click(object sender, EventArgs e)
        {
            ActualizarVisita(true);
        }


        protected void btnGuardaLista_Click(object sender, EventArgs e)
        {
            ActualizarLista();
        }

        protected void ddlAsunto_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtOrganismo.ReadOnly = true;
            txtPersonal.ReadOnly = true;
            txtCedula.ReadOnly = true;
            txtNombre.ReadOnly = true;
        }

        protected void ButtonTest_Click(object sender, EventArgs e)
        {
            imgPersonal.ImageUrl = "http://172.16.7.240:8087/FotosVisitas/" + hdnCedula.Value + ".jpg";
        }

        protected void ButtonTest2_Click(object sender, EventArgs e)
        {
            imgVisitado.ImageUrl = "http://172.16.7.240:8087/Fotos/" + hdnCedulaPersonal.Value + ".jpg";
        }
    }
}

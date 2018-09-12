using Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Teach
{
    public partial class UCNavigation : System.Web.UI.UserControl
    {
        private void Page_Load(object sender, EventArgs e)
        {

            bool Logged = paginaBase.LoggedIn(Session);

            if (this.lnkChangePassword.Enabled)
            {
                this.lnkChangePassword.CssClass = "izq";
            }
            else
            {
                this.lnkChangePassword.CssClass = "izqDesactivado";
            }


            Page.ClientScript.RegisterStartupScript(Page.GetType(), "tttt", "ocultarEnlaces(" + Logged.ToString().ToLower() + ");", true);
            this.divLogin.Visible = !Logged;
            if (Logged)
            {
                int codigoDeTecnico = Convert.ToInt32(this.Session["UserId"].ToString());
                WebVisita.Clases.CSeguridad objetoSeguridad = new WebVisita.Clases.CSeguridad();
                objetoSeguridad.SeguridadUsuarioDatosID = codigoDeTecnico;
                this.lnkHome.CssClass = "izq";

                if (objetoSeguridad.EsUsuarioAdministrador() == true)
                {
                    this.lblVentas.CssClass = "izq";
                    this.lnkAtencionCallCenter.CssClass = "izq";
                    this.lblConsultas.CssClass = "izq";
                    this.lnkAddProducto.CssClass = "izq";
                    this.lnkSeguridad.CssClass = "izq";
                    this.lnkEstatusVisitantes.CssClass = "izq";
                }
                else
                {
                     this.lnkSeguridad.Visible = false;
                    //MENU ATENCION VISITAS
                    if (objetoSeguridad.EsAccesoPermitido(1) == true)
                    {
                        this.lblVentas.CssClass = "izq";
                        this.lnkAtencionCallCenter.CssClass = "izq";
                    }
                    else
                    {
                        this.lblVentas.Visible = false;
                        this.lnkAtencionCallCenter.Visible = false;
                    }



                    //MENU CONSULTAS
                    if (objetoSeguridad.EsAccesoPermitido(2) == true)
                    {
                        this.lblConsultas.CssClass = "izq";
                        this.lnkAddProducto.CssClass = "izq";
                    }
                    else
                    {
                        this.lblConsultas.Visible = false;
                        this.lnkAddProducto.Visible = false;
                    }
                    if (objetoSeguridad.EsAccesoPermitido(3) == true)
                    {
                        this.lblConsultas.CssClass = "izq";
                        this.lnkEstatusVisitantes.CssClass = "izq";
                    }
                    else
                    {
                        this.lblConsultas.Visible = false;
                        this.lnkEstatusVisitantes.Visible = false;
                    }

                }

            }
        }



        protected override void OnInit(EventArgs e)
        {
            this.InitializeComponent();
            base.OnInit(e);
        }
        private void InitializeComponent()
        {
            base.Load += new EventHandler(this.Page_Load);
        }
    }
}
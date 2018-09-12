
using System.IO;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebVisita
{
    public partial class VisitantesAtendidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string fechaDia = DateTime.Now.ToString("dd/MM/yyyy");
                this.txtFechaDesde.Text = fechaDia;
                this.txtFechaHasta.Text = fechaDia;



                CargarDetalleVisitas(fechaDia, fechaDia);
            }
        }
        private void CargarDetalleVisitas(string fechaDesdeConsulta, string fechaHastaConsulta)
        {
            try
            {
                DateTime fecha1 = Convert.ToDateTime(fechaDesdeConsulta);
                DateTime fecha2 = Convert.ToDateTime(fechaHastaConsulta);
                string f1 = string.Format("{0:yyyy-MM-dd}", fecha1);
                string f2 = string.Format("{0:yyyy-MM-dd}", fecha2);

                DataSet ds = VisitantesAtendidos.ObtenerVisitas(f1, f2);
                DataTable dt = ds.Tables[0];
                gridDetalle.DataSource = dt;
                gridDetalle.DataBind();
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        protected void ExportToExcel(object sender, EventArgs e)
        {
            string nombreArchivo;
            nombreArchivo = "VisitantesAtendidosentre" + this.txtFechaDesde.Text.Replace("/","-") + "hasta" + this.txtFechaHasta.Text.Replace("/", "-") + ".xls";
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename="+ nombreArchivo);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                this.gridDetalle.AllowPaging = false;
                this.CargarDetalleVisitas(this.txtFechaDesde.Text, this.txtFechaHasta.Text);

                gridDetalle.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in gridDetalle.HeaderRow.Cells)
                {
                    cell.BackColor = gridDetalle.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in gridDetalle.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gridDetalle.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gridDetalle.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                gridDetalle.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarDetalleVisitas(this.txtFechaDesde.Text, this.txtFechaHasta.Text);
        }
    }
}
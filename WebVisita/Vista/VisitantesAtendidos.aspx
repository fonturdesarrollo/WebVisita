<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitantesAtendidos.aspx.cs" Inherits="WebVisita.VisitantesAtendidos" %>


<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc1" TagName="UCNavigation" Src="~/Vista/UCNavigation.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>| Sistema Atención al Visitante | Consulta de Visitantes Registrados|</title>
	
	<link rel="stylesheet" href="../Styles/estilo.css" type="text/css"/>
    <link rel="stylesheet" href="../Styles/estilos.css" type="text/css"/>
    <script src="../js/jquery-ui-1.8rc3.custom.min.js"></script>
    <script src="../js/jquery.js"></script>
    <link href="../Styles/simpleAutoComplete.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui-1.8rc3.custom.css" rel="stylesheet" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">BODY {
	FONT-SIZE: 8.5pt
}
TD {
	FONT-SIZE: 8.5pt
}
TH {
	FONT-SIZE: 8.5pt
}
BODY {
	BACKGROUND-IMAGE: url(../Images/fondo_3.png); BACKGROUND-COLOR: #ffffff
}
        .auto-style2 {
            height: 21px;
        }
        .auto-style3 {
            height: 43px;
        }
    </style>
    <script>

        $(function () {

            //Array para dar formato en español
            $.datepicker.regional['es'] =
            {
                closeText: 'Cerrar',
                prevText: 'Previo',
                nextText: 'Próximo',

                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
                'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                dateFormat: 'dd/mm/yy', firstDay: 0,
                initStatus: 'Selecciona la fecha', isRTL: false
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

            $("#txtFechaDesde").datepicker({
                dateFormat: 'dd/mm/yy', showOn: 'button', buttonImage: '../images/Calendar_scheduleHS.png', buttonImageOnly: true, changeMonth: true,
                changeYear: true, gotoCurrent: true
            });
            $("#txtFechaHasta").datepicker({
                dateFormat: 'dd/mm/yy', showOn: 'button', buttonImage: '../images/Calendar_scheduleHS.png', buttonImageOnly: true, changeMonth: true,
                changeYear: true, gotoCurrent: true
            });
        });
    </script>

</head>
  
  <body>
 <MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>
  <form id="form1" runat="server">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr>
      <td colspan="4"><img src="../Images/top_atencion_visita_1.png" width="1000" height="160"></td>
    </tr>
    <tr>
      <td width="200" rowspan="2" align="left" valign="top" bgcolor="#24496f"><uc1:UCNavigation id="UserControl2" runat="server"></uc1:UCNavigation></td>
	  <td height="20" colspan="2" valign="top"  >&nbsp; <h2>Visitantes Registrados</h2></td>


    </tr>
    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
      <!-- Contenido Aqui -->
          <table>
              <tr class="auto-style2" >
                    <td class="auto-style2">
                        <asp:Label Text="Fecha Desde" ID="Label5" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtFechaDesde"  MaxLength="200" Width="100"/>
                    </td>
                    <td class="auto-style2">
                        <asp:Label Text="Fecha Hasta" ID="Label1" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtFechaHasta"  MaxLength="200" Width="100"/>
                     </td>
                  <td  width="150"  >
                      <asp:Button Text="Buscar Visitas" runat="server" ID ="btnBuscar"  CssClass ="boton_formulario" OnClick="btnBuscar_Click" />
                    </td>
                  <td>
                         <asp:Button ID="btnExport" runat="server" CssClass ="boton_formulario" Text="Exportar a Excel" OnClick = "ExportToExcel" />
                  </td>
               </tr>
          </table>
          <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
              GridLines="Horizontal" AutoGenerateColumns="False"  >
                <HeaderStyle CssClass ="registroTitulo" Font-Size="10px" />
                <AlternatingRowStyle CssClass ="registroNormal" Font-Size="10px" />
                  <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
              <Columns>
                  <asp:TemplateField HeaderText="CodV" HeaderStyle-Width="0" Visible="false">
                      <ItemTemplate>
                          <asp:TextBox runat="server" ID="txtCodVisita" Visible ="false"   Width="0" ForeColor ="Red" Text='<%# Eval("VisitaID") %>' ></asp:TextBox>
                      </ItemTemplate>
				<HeaderStyle Width="0px"></HeaderStyle>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Fecha Atencion" HeaderStyle-Width="100    ">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblFechaAtencion" Text='<%# Eval("FechaRegistroVisita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Cédula Visitante" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblCedulaVisitante" Text='<%# Eval("CedulaVisitante") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Nombre Visitante" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblNombreVisitante" Text='<%# Eval("NombreVisitante") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Remitente" HeaderStyle-Width="200">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblNombreRemitente" Text='<%# Eval("NombreOrganismo") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Asunto" HeaderStyle-Width="100">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblAsunto" Text='<%# Eval("NombreAsunto") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Observacion" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblObservacion" Text='<%# Eval("ObservacionVisita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Estatus" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblEstatus" Text='<%# Eval("NombreEstatusVisitante") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Personal Visitado" HeaderStyle-Width="200">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblVisitado" Text='<%# Eval("NombrePersonal") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Gerencia" HeaderStyle-Width="200">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblGerencia" Text='<%# Eval("NombreGerencia") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Atención" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblAtencion" Text='<%# Eval("NombreCompleto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Foto" HeaderStyle-Width="100" HeaderStyle-Height ="20">
                      <ItemTemplate>
                          <asp:Image runat="server" ID="imgFoto" ImageUrl= '<%# "http://172.16.7.240:8087/FotosVisitas/" +  Eval("CedulaVisitante") + ".jpg"%>' Width="50" Height="50"></asp:Image>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>

      </td>

    </tr>
    <tr>
      <td width="200" height="30" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="10" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="770" bgcolor="#d2d2c6" align="center" style="font-size: medium" >Sistema Atención al Visitante Usuario: <%:Session["NombreCompletoUsuario"]%>
      <td width="20" bgcolor="#d2d2c6">&nbsp;</td>
    </tr>
  </table>
   
  
    </form>
</body>
</html>


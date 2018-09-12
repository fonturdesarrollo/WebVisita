<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtencionVisita.aspx.cs" Inherits="WebVisita.AtencionVisita" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc1" TagName="UCNavigation" Src="~/Vista/UCNavigation.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>| Sistema Atención al Visitante | Registro de Visitantes|</title>
	
	<link rel="stylesheet" href="../Styles/estilo.css" type="text/css"/>
    <link rel="stylesheet" href="../Styles/estilos.css" type="text/css"/>
	<script src="../js/Util.js" type="text/javascript"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery-ui-1.8rc3.custom.min.js"></script>
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
                                                                              .auto-style5 {
                                                                                  width: 770px;
                                                                              }
                                                                              .auto-style6 {
                                                                                  height: 160px;
                                                                              }
                                                                              </style>
    <script>

        $(function () {
            $('#txtOrganismo').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Organismos'
            }, fnPersonalCallBack);

        });

        function fnPersonalCallBack(par) {
            document.getElementById("hdnOrganismoID").value = par[0]; //par[0] id
            var campo = document.getElementById('<%=txtOrganismo.ClientID%>');
            campo.readOnly = true; 
        }

        $(function () {
            $('#txtCedula').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Visitantes'
            }, fnPersonalCallBack2);

        });

        function fnPersonalCallBack2(par) {
            document.getElementById("hdnCedula").value = par[0]; 
            document.getElementById("txtCedula").value = par[0]; 
            document.getElementById("txtNombre").value = par[1];
            document.getElementById("txtTelefono").value = par[3];

            var bt = document.getElementById("ButtonTest");
            bt.click();

            var campo1 = document.getElementById('<%=txtCedula.ClientID%>');
            campo1.readOnly = true;
            var campo2 = document.getElementById('<%=txtNombre.ClientID%>');
            campo.readOnly = true;

        }

        $(function () {
            $('#txtPersonal').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Personal'
            }, fnPersonalCallBack3);

        });

        function fnPersonalCallBack3(par) {
            document.getElementById("hdnPersonalID").value = par[0];
            document.getElementById("hdnCedulaPersonal").value = par[3];

            var bt = document.getElementById("ButtonTest2");
            bt.click();

            var campo = document.getElementById('<%=txtPersonal.ClientID%>');
            campo.readOnly = true;

        }

        function Confirmacion() {

            return confirm("¿Realmente desea eliminar esta visita?, no podrá deshacer");
        }
        function LimpiarTextos() {
            document.getElementById("hdnOrganismoID").value = "0";
            var campo = document.getElementById('<%=txtOrganismo.ClientID%>');
            campo.readOnly = false; 

            document.getElementById("hdnCedula").value = "0";
            document.getElementById("txtCedula").value = "";
            document.getElementById("txtNombre").value = "";
            document.getElementById("txtTelefono").value = "";
            document.getElementById("txtOrganismo").value = "";
            document.getElementById("imgPersonal").setAttribute('src', "../Images/crm.gif");
            document.getElementById("imgVisitado").setAttribute('src', "../Images/crm.gif");

            var campo1 = document.getElementById('<%=txtCedula.ClientID%>');
            campo.readOnly = false;
            var campo2 = document.getElementById('<%=txtNombre.ClientID%>');
            campo.readOnly = false; 

            document.getElementById("hdnPersonalID").value = "0";
            document.getElementById("txtPersonal").value = "";
            var campo = document.getElementById('<%=txtPersonal.ClientID%>');
            campo.readOnly = false;
        }

    </script>

</head>
  
  <body>
 <MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>
  <form id="form1" runat="server">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr>
      <td colspan="4" class="auto-style6"><img src="../Images/top_atencion_visita_1.png" width="1000" height="160"></td>
    </tr>
    <tr>
      <td width="200" rowspan="2" align="left" valign="top" bgcolor="#24496f">
        <uc1:UCNavigation id="UserControl2" runat="server"></uc1:UCNavigation>
      </td>
	  <td colspan="2" valign="top" class="auto-style2"  >&nbsp; <h2> Registro de Visitas</h2></td>
        
    </tr>

    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
      <!-- Contenido Aqui -->
          <table>
                <tr>
                    <td class="auto-style2" align ="center">
                        Visitante&nbsp;&nbsp;&nbsp;<asp:Image  runat="server" ID="imgPersonal" width="80" height="80" ImageUrl="../Images/crm.gif" onerror="this.onload = null; this.src='../Images/crm.gif';" />
                    </td>
                    <td class="auto-style2">
                        Visitado&nbsp;&nbsp;&nbsp;<asp:Image  runat="server" ID="imgVisitado" width="80" height="80" ImageUrl="../Images/crm.gif" onerror="this.onload = null; this.src='../Images/crm.gif';" />            
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Organismo Remitente" ID="Label5" runat="server" AssociatedControlID="txtOrganismo" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtOrganismo" onkeypress="return event.keyCode!=13;" MaxLength="200" Width="520px"></asp:TextBox>
                        <asp:HiddenField runat ="server" ID ="hdnOrganismoID"  Value="0"/> 
                        <ASP:RequiredFieldValidator id="rqrValidaOrganismo" runat="server" errormessage="Debe colocar el nombre del organismo" width="132px" controltovalidate="txtOrganismo" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Cedula" ID="Label1" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtCedula"    MaxLength="12" Width="200"/>
                        <asp:HiddenField runat ="server" ID ="hdnCedula"  Value="0"/> 
                        <ASP:RequiredFieldValidator id="rqrvalidaCedula" runat="server" errormessage="Debe colocar la cedula del visitante" width="132px" controltovalidate="txtCedula" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Nombre" ID="Nombre" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtNombre"  MaxLength="50" Width="520"/>
                        <ASP:RequiredFieldValidator id="rqrvalidaNombreVisitante" runat="server" errormessage="Debe colocar el nombre del visitante" width="132px" controltovalidate="txtNombre" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Teléfono" ID="Label2" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtTelefono"  MaxLength="100" Width="520"  />
                        <ASP:RequiredFieldValidator id="rqrvalidaTelefono" runat="server" errormessage="Debe colocar el telefono del visitante" width="132px" controltovalidate="txtTelefono" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Visitado" ID="Label3" runat="server" />
                    </td>
                    <td class="auto-style2">
                            <asp:TextBox runat="server" ID="txtPersonal" onkeypress="return event.keyCode!=13;" MaxLength="200" Width="520px"/>
                            <asp:HiddenField runat ="server" ID ="hdnPersonalID"  Value="0"/>
                            <asp:HiddenField runat ="server" ID ="hdnCedulaPersonal"  Value="0"/>
                            <ASP:RequiredFieldValidator id="rqrvalidaVisitado" runat="server" errormessage="Debe seleccionar al personal visitado" width="132px" controltovalidate="txtPersonal" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>                         
                    </td>
                </tr>
                <tr>
                    <td>
                        Motivo de la Visita</td>
                    <td>
                          <asp:DropDownList ID="ddlAsunto" runat="server"  Width="520px" OnSelectedIndexChanged="ddlAsunto_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Observaciones" ID="Label4" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtObservaciones" TextMode="MultiLine" Rows="1" MaxLength="200" Width="520px"/> 
                    </td>
                </tr>
                  <tr>
                      <td></td>
                      <td class="auto-style3" align ="center" >
                          <asp:Button Text="Lista de Espera" runat="server" ID ="btnGuardar"  CssClass ="boton_formulario" OnClick="btnGuardar_Click"/>
                          <asp:Button Text="Atendido" runat="server" ID ="btnResuelto"  CssClass ="boton_formulario" OnClick="btnResuelto_Click" />
                          <input id="htmlButtonLimpiar" type="button" value="Limpiar"  class="boton_formulario" onclick ="LimpiarTextos() "/>
                          <asp:Button Text="TEST" runat="server" ID ="ButtonTest"  style="display:none" CssClass ="boton_formulario" OnClick="ButtonTest_Click" CausesValidation="False" />
                          <asp:Button Text="TEST2" runat="server" ID ="ButtonTest2"   style="display:none" CssClass ="boton_formulario" CausesValidation="False" OnClick="ButtonTest2_Click" />
                      </td>
                  </tr>
                    
          </table>

          <h2>Lista de Espera </h2>
          <table>
              <tr class="auto-style2" >
                  <td  width="1000" >
                      <asp:Button Text="Actualizar lista" runat="server" ID ="btnGuardaLista"  CssClass ="boton_formulario" OnClick="btnGuardaLista_Click" CausesValidation="False"/>
                  </td>
              </tr>
          </table>
          <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
              GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
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
                  <asp:TemplateField HeaderText="Fecha Atención" HeaderStyle-Width="100    ">
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
                  <asp:TemplateField HeaderText="Asunto" HeaderStyle-Width="100">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblAsunto" Text='<%# Eval("NombreAsunto") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Observación" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblObservacion" Text='<%# Eval("ObservacionVisita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusVisitanteID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
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
                   <asp:TemplateField HeaderText="Foto" HeaderStyle-Width="100" HeaderStyle-Height ="20">
                      <ItemTemplate>
                          <asp:Image runat="server" ID="imgFoto" ImageUrl= '<%# "http://172.16.7.240/FotosVisitas/" +  Eval("CedulaVisitante") + ".jpg"%>' Width="50" Height="50"></asp:Image>
                      </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Asignar Estatus" HeaderStyle-Width="100">
                      <ItemTemplate>
                          <asp:DropDownList runat="server" ID="ddlEstatus"
                                DataSourceID="SqlDataSource4" 
                                DataTextField ="NombreEstatusVisitante"
                                DataValueField ="EstatusVisitanteID"
                                SelectedValue ='<%# Bind("EstatusVisitanteID") %>'
                                Width="100px">
                          </asp:DropDownList>
                        <asp:SqlDataSource 
                            ID="SqlDataSource4" 
                            runat="server" ConnectionString="<%$ ConnectionStrings:CallCenterConnectionString %>" 
                            SelectCommand="SELECT *  FROM [EstatusVisitante] WHERE EstatusVisitanteID <> 3 ORDER BY EstatusVisitanteID ">
                        </asp:SqlDataSource>
                      </ItemTemplate>
                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Acciones" HeaderStyle-Width="100px">
                      <ItemTemplate>
                          <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("VisitaID") %>'/>
                          <asp:ImageButton runat="server" ID="btnFoto" AlternateText="Asignar Foto" CausesValidation="false" ToolTip="Asignar Foto" CssClass="cBotones" ImageUrl="~/Images/camara.png"  CommandName="AsignarFoto" CommandArgument='<%# Eval("CedulaVisitante") %>'/>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
      </td>

    </tr>
    <tr>
      <td width="200" height="30" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="10" bgcolor="#d2d2c6">&nbsp;</td>
      <td bgcolor="#d2d2c6" align="center" style="font-size: medium" class="auto-style5" >Sistema Atención al Visitante Usuario: <%:Session["NombreCompletoUsuario"]%>
      <td width="20" bgcolor="#d2d2c6">&nbsp;</td>
    </tr>
  </table>
   
  
    </form>
</body>
</html>

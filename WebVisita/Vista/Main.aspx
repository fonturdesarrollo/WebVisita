<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Seguridad.Main" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc1" TagName="UCNavigation" Src="~/Vista/UCNavigation.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>| Sistema Call Center | Principal|</title>
	
	<link rel="stylesheet" href="../Styles/estilo.css" type="text/css"/>
	<script src="../js/Util.js" type="text/javascript"></script>

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
                                                                              
</style></head>
  
  <body>
 <MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>
  <form id="form1" runat="server">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr>
      <td colspan="4"><img src="../Images/top_atencion_visita_1.png" width="1000" height="160"></td>
    </tr>
    <tr>
      <td width="200" rowspan="2" align="left" valign="top" bgcolor="#24496f"><uc1:UCNavigation id="UserControl2" runat="server"></uc1:UCNavigation></td>
        <td colspan="3" valign="top">&nbsp;</td>

    </tr>
    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
          <br />
        <h4 align="center" style="font-family: Arial; font-size: x-large">
            FONTUR</h4>
          <h4 align="center" style="font-family: Arial; font-size: x-large">
              Sistema Atenci�n al Visitante</h4>
        </td>
    </tr>
    <tr>
      <td width="200" height="30" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="10" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="770" bgcolor="#d2d2c6" align="center" style="font-size: medium" >Sistema Atenci&oacute;n al Visitante Usuario: <%:Session["NombreCompletoUsuario"]%>
      <td width="20" bgcolor="#d2d2c6">&nbsp;</td>
    </tr>
  </table>
    </form>
</body>
</html>

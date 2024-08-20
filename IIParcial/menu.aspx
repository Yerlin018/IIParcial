<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="IIParcial.menu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--<link href="css/menu.css" rel="stylesheet" />--%>
    <link href="css/menu.css?v=1.0" rel="stylesheet" />
    <title>Votaciones 2024</title>

   <script type="text/javascript">
    function closeWindow() {
    window.close();
    }

    </script>
    <style type="text/css">
        .auto-style1 {
            color: #66CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="vertical-menu">
            <a href="menu.aspx" class="active">Inicio</a>
            <a href="inscripcion.aspx">Inscripciones</a>
            <a href="votacion.aspx">Votar</a>
            <a href="resultados.aspx">Resultados</a>
            <a href="javascript:void(0);" onclick="closeWindow()">Salir</a>
        </div>

        <div style="text-align:center; margin-top:20px;">
            <h1 class="auto-style1">Página oficial de las votaciones 2024</h1>
            <img src="CARPETA/Votar.jpg" alt="Imagen de Votaciones 2024" width="400" style="margin-top:20px;" />
            <h3 style="font-weight: normal;"><em>"Tu voto es tu voz. Hazla contar y construye el futuro que deseas. ¡Participa en las votaciones 2024!"</em></h3>
        </div>

    </form>
</body>
</html>

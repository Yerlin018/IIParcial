<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resultados.aspx.cs" Inherits="IIParcial.resultados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--<link href="css/menu.css" rel="stylesheet" />--%>
    <link href="css/menu.css?v=1.0" rel="stylesheet" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <title>Resultados</title>
  
    <script type="text/javascript">
         function closeWindow() {
             window.close();
         }
    </script>
    <style type="text/css">
        .auto-style1 {
            color: #3399FF;
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

        <div>      
              <h1 class="auto-style1">Resultado de votaciones</h1>
            <h3>En este aparto puede observar los resultados preliminares de la votación.</h3>
            <h3>Resultado de votaciones</h3>
        </div>

        <div>   
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="votacion.aspx.cs" Inherits="IIParcial.votacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--<link href="css/menu.css" rel="stylesheet" />--%>
     <link href="css/menu.css?v=1.0" rel="stylesheet" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <title>Votacion</title>

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
              <h1 class="auto-style1">Sistema de votación</h1>
              <h1 class="auto-style1">  Ingrese su voto</h1>
              <h3 class="text-start">En este apartado puede realizar su votación, se le solicitan sus datos personales, debe digitar su cédula con precuación, ya que solo se adimite un voto por cada cédula. Para seleccionar por quien debe votar puede ir al apartado de inscripciones donde puede observar los postulantes.</h3>
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

                <div>
            <div class="mb-3">
                <label class="form-label">Cedula  </label>
                <asp:TextBox class="form-control" ID="tcedula_Vot" type="int" runat="server"></asp:TextBox>
            </div>

            <br />
            <div class="mb-3">
                <label class="form-label">Nombre  </label>
                <asp:TextBox class="form-control" ID="tnombre_Vot" runat="server"></asp:TextBox>
            </div>
            <br />
            <div class="mb-3">
                <label class="form-label">Apellido  </label>
                <asp:TextBox class="form-control" ID="tapellido_Vot" runat="server"></asp:TextBox>
            </div>
            <br />

    
           <div class="mb-3">
               <label class="form-label">Edad  </label>
               <br />
               <asp:TextBox class="form-control" ID="tedad_Vot" type="int" runat="server"></asp:TextBox>
           </div>
            <br />

           
            <div class="mb-3">
                <label class="form-label">Nombre del candidato </label>
                <asp:TextBox class="form-control" ID="tnombre_elegido" runat="server"></asp:TextBox>
            </div>
            <br />
             <div>
               <br />
                    
            </div>
                 <asp:Button ID="Bvotar" class="btn btn-outline-primary" runat="server" Text="Votar" OnClick="Bvotar_Click" />
                  <asp:Button ID="Beliminar" class="btn btn-outline-danger" runat="server" Text="Eliminar" OnClick="Beliminar_Click"/>
             </div>
    </form>
    </form>
</body>
</html>

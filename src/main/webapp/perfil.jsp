<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Reservas" %>
<%@ page import="edu.fpdual.proyectovn.controller.ReservaController" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.ReservasManagerImpl" %>
<%-- 
    Author     : Natalia Castillo
--%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Perfil</title>
  <link rel="shortcut icon" href="images/icons/favicon2.ico" type="image/x-icon">
  <!-- CSS bootstrap -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
  <!-- ICONOS bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  <!-- CSS mio -->
  <link rel="stylesheet" href="style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body class="bg-success">
<div id="wrapper" class="container-fluid">
  <!--Barra navegación-->
  <div id="nav-placeholder"></div>
  <%
    // TODO: 05/06/2022 arreglar 
    Connection con;
    Statement s;
    String nombre = (String) session.getAttribute("usuario");
    String user = nombre.toUpperCase().charAt(0) + nombre.substring(1).toLowerCase();
    Integer id = (Integer) session.getAttribute("idusu");
    ReservaController reservaController = new ReservaController(new ReservasManagerImpl());
    try {
      con = new Connector().getConnection();
      s = con.createStatement();
      ResultSet info;
      info = s.executeQuery("SELECT * FROM usuario WHERE NomUsu LIKE ('" + nombre + "')");
      info.next();
        if (session.getAttribute("usuario") == null) {
          session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil.");
          response.sendRedirect("formularioLogin.jsp");
        }
  %>
  <div class="container border-danger">
    <div class=" panel mt-5">
      <h1 class="panel-heading text-center bg-indigo text-white">Perfil de <%=user %>
      </h1>
    </div>
    <div class="container">
      <table>
        <tr>
          <td>
            <!-- ajuste de imagen -->
            <div class="container">
              <div class="row">
                <div class="col-lg-6 m-auto">
                  <img src="images/icons/avatar.png"
                       class="img-fluid  mt-5" alt="avatar persona">
                </div>
              </div>
            </div>
          </td>
          <td>
            <div class="container mt-5">
              <div class="row">
                <div class="col m-auto"></div>
                <div class="card m-5 bg-turquesa">
                  <h5 class="card-header text-center"><%=user %>
                  </h5>
                  <div class="card-body bg-tostado ">
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">Usuario: <%=info.getString("NomUsu") %>
                      </li>
                      <li class="list-group-item">Nombre
                        completo: <%=info.getString("NomUsu") %> <%=info.getString("ApeUsu") %>
                      </li>
                      <li class="list-group-item">Email: <%=info.getString("Email") %>
                      </li>
                      <li class="list-group-item">Móvil: <%=info.getString("Movil") %>
                      </li>
                      <li class="list-group-item">Ciudad favorita: <%%>(<%=info.getInt("IDciu") %>)
                      </li>
                    </ul>
                  </div>
                  <div class="card-footer text-center p-3 m-3">
                    <a href="ciudades.jsp" class="btn btn-primary m-2">Volver</a>
                    <button type="button" class="btn btn-primary m-3" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop">
                      Mis Reservas
                    </button>
                    <a href="logout.jsp" class="btn btn-primary m-2">Cerrar Sesión</a>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
       aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Mis Reservas</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <div class="modal-body">
          <div class="container-fluid">
            <div class="container mt-3 text-center">
              <div class=" panel panel-light">
                <h2 class="panel-heading text-center bg-verde">RESERVAS</h2>
                <table class="table table-striped table-verde ">
                  <tr class="table-dark">
                    <th>ID</th>
                    <th>Usuario</th>
                    <th>Actividad</th>
                    <th>Hora</th>
                    <th>Fecha</th>
                    <th>Valoración</th>
                  </tr>
                  <%
                        for (Reservas r : reservaController.todasReservas()) {
                          if (r.getIdUsu() == id) {
                    %>
                    <tr>
                      <td><%=r.getIdRes()%>
                      </td>
                      <td><%=r.getIdUsu()%>
                      </td>
                      <td><%=r.getIdAct()%>
                      </td>
                      <td><%=r.getFecha()%>
                      </td>
                      <td><%=r.getHora()%>
                      </td>
                    </tr>
                    <%
                          }
                        }
                      } catch (ClassNotFoundException | SQLException e) {
                      throw new RuntimeException(e);
                    }
                  %>
                </table>
              </div>
            </div> <!-- cierre container lista -->
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- cierre container lista -->
</div> <!-- fin wrapper -->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>

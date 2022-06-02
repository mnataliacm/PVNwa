<%--
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Confirmación</title>
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
  </head>
 <body>
  <%  
    
    String user = (String) session.getAttribute("usuario");
    String enlace = "index.jsp";
    String mensaje = "";    

     if (session.getAttribute("usuario") != null) {
      if ((user.equals("Admin"))) {
        enlace = "usuarios.jsp";
        mensaje = "Usuario editado/borrado";
      } else if (user.equals("Colaborador")) {
          enlace = "buscadorColab.jsp";
          mensaje = "Planta añadida/modificada/borrada";
      } else {
          enlace = "buscador.jsp";
      }    
    } else {
        session.setAttribute("error", "No tienes sesión iniciada");
        response.sendRedirect("formularioLogin.jsp");
    }      
  %>

  <div id="wraper" class="container-flex vh-100 pt-5">
    <div class="container w-25 text-center m-auto">
      <div class="row">        
        <div class="col">
          <div class="card bg-verde">
            <div class="card-header">Mensaje de Confirmación</div>
            <div class="card-body">          
              <i class="bi bi-check2-circle text-primary fs-1"></i>
              <p> Operación realizada con éxito.</p>
              <p><%=mensaje %> </p>
            </div>  
            <div class="card-footer">
              <a href="<%=enlace %>" class="btn-lg btn-primary" role="button">Aceptar</a>
            </div>
          </div>
        </div>
      </div>
    </div>            
    <!-- imagen -->
    <div class="container">
      <div class="container-flex">
        <div class="row">
          <div class="col-lg-6 m-auto">
            <img src="images/"
                 class="img-fluid  mt-5" alt="">
          </div>
        </div>
      </div>
    </div>        
  </div> <!-- fin del wrapper -->

  <!-- JS bootstrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>  
  <!-- JS mio -->
  <script src="javascript/javascript.js"></script>

</html>

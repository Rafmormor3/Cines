<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.jacaranda.model.Cine"%>
<%@page import="com.jacaranda.repository.CineRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//intento ver si me ha puesto los dtos para añadir un nuevo cine
	Cine c =null;
	String mensaje ="";
	try{
		try{
		c = CineRepository.find(Cine.class, (String) session.getAttribute("nameCine"));
		}catch(Exception e){
			e.getMessage();
		}
		
		
		if(request.getParameter("edit")!=null){
			
			c = new Cine(request.getParameter("cine"), request.getParameter("ciudad"), request.getParameter("direccion"));
			CineRepository.edit(c);
			mensaje="Editado correctamente";
			
			
		}
%>

<h2><%=mensaje %></h2>
<form action="">
  <div class="form-group row">
    <label for="cine" class="col-4 col-form-label">Cine</label> 
    <div class="col-8">
      <div class="input-group">
        <input id="cine" name="cine" type="text" class="form-control" value='<%=c.getCine() %>' readonly > 
        <div class="input-group-append">
          <div class="input-group-text">
            <i class="fa fa-camera-retro"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="cine" class="col-4 col-form-label">Ciudad</label> 
    <div class="col-8">
      <div class="input-group">
        <input id="ciudad" name="ciudad" type="text" class="form-control" value='<%=c.getCiudadCine()%>'> 
        <div class="input-group-append">
          <div class="input-group-text">
            <i class="fa fa-camera-retro"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="cine" class="col-4 col-form-label">Direccion</label> 
    <div class="col-8">
      <div class="input-group">
        <input id="direccion" name="direccion" type="text" required="required" class="form-control" value='<%=c.getDireccion() %>'> 
        <div class="input-group-append">
          <div class="input-group-text">
            <i class="fa fa-camera-retro"></i>
          </div>
        </div>
      </div>
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="edit" type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
 <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="edit" type="submit" class="btn btn"><a href="listarCine.jsp">Volver</a></button>
    </div>
  </div>

<% 
	}catch(Exception e){
		e.getMessage();
	}
%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</body>
</html>
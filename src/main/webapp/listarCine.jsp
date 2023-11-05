<%@page import="java.util.ArrayList"%>
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
	
	ArrayList<Cine> listCine=null;
	try{
		
		listCine = (ArrayList<Cine>) CineRepository.findAll(Cine.class);
%>


<table class="table">
	<thead>
		<th scope="col">Cine</th>
		<th scope="col">Direccion</th>
		<th scope="col">Ciudad</th>
	</thead>
	<tbody>
		<%
			for(Cine c : listCine){
		%>
		<tr>
			<td><%=c.getCine() %></td>
			<td><%=c.getDireccion() %></td>
			<td><%=c.getCiudadCine() %></td>
			<td>

			<form>
			<%
			if(request.getParameter("edit")!=null){
				session.setAttribute("nameCine",c.getCine());
				response.sendRedirect("editCine.jsp");
				return;
			}
			%>
				<div class="form-group row">
				    <div class="offset-4 col-8">
				    	<button name="edit" type="submit" class="btn btn-primary">Editar</button>
				    </div>
			  	</div>
			</form>
			</td>
			<td>
			<form action="delCine.jsp">
			<%
			if(request.getParameter("delete")!=null){
				session.setAttribute("nameCine",c.getCine());
				response.sendRedirect("delCine.jsp");
				return;
			}
			%>
				<input id="cine" name="cine" type="text" value='<%=c.getCine() %>' hidden> 
				<div class="form-group row">
				    <div class="offset-4 col-8">
				    	<button name="delete" type="submit" class="btn btn-primary">Borrar</button>
				    </div>
			  	</div>
			</form>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<form action="annadirCine.jsp">
	<div class="form-group row">
		<div class="offset-4 col-8">
			<button name="Add" type="submit" class="btn btn-primary">Add</button>
		</div>
	</div>
</form>	
<%
	}catch(Exception e){
		
	}
%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</body>
</html>
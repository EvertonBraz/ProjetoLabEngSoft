<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>
</head>
<body>
	<jsp:include page="/view/cabecalho.jsp" />
	<div class="navbar">
	  <div class="navbar-inner">
	    <a class="brand" href="#">Title</a>
	    <ul class="nav">
	      <li class="active"><a href="#">Home</a></li>
	      <li><a href="listaAlunos.jsp">Alunos</a></li>
	      <li><a href="listaProfessores.jsp">Professores</a></li>
	    </ul>
	  </div>
	</div>
	
	
	
	<jsp:include page="/view/rodape.jsp"/>
</body>
</html>
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
	<div id="principal">
		<h1>Menu</h1>
		<p>
			<a href="listaAlunos.jsp">Alunos</a>
		</p>
		<br>
		<p>
			<a href="listaProfessores.jsp">Professores</a>
		</p>
	</div>
	<jsp:include page="/view/rodape.jsp"/>
</body>
</html>
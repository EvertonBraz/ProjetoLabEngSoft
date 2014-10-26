<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="model.Aluno" 
    import="java.util.List"
    import="java.util.ArrayList" 
    import="persistence.AlunoDAO"
    import="persistence.AlunoDAOImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Alunos</title>
</head>
<body>
	<% List<Aluno> listaAluno = new ArrayList<Aluno>();
	   AlunoDAO dao = new AlunoDAOImpl();
	   listaAluno = dao.listar();
	%>
	
	<div align="center">
		<h1>Lista de Alunos</h1>
	</div>
	<div align="center">
		<table border="0">
			<% for(Aluno aluno : listaAluno){ %>
			<tr>
				<td style="width:200px;"><%= aluno.getNome() %></td>
				<td><a href="./../AlunoController?funcao=mostrar&alunoRa=<%= aluno.getRa() %>">Mostrar</a></td>
			</tr>
			<% } %>
		</table>
		<p><a href="formAlunoNovo.jsp">Novo aluno</a></p>
	</div>
</body>
</html>
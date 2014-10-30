<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="model.Professor" 
    import="java.util.List"
    import="java.util.ArrayList" 
    import="persistence.ProfessorDAO"
    import="persistence.ProfessorDAOImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Projeto_LabEngSoft/CSS/formato.css">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>Lista de Professores</title>
</head>
<body>
	<% 
	List<Professor> listaProfessor = (List<Professor>)request.getAttribute("PESQUISA");
	if(listaProfessor == null){
		listaProfessor = new ArrayList<Professor>();
		ProfessorDAO dao = new ProfessorDAOImpl();
		listaProfessor = dao.listar();
	}
	   
	%>
	
	<jsp:include page="/view/cabecalho.jsp" />
	<div id="principal">
		<h1>Lista de Professores</h1>
		
		<br>
		
		<div align="center">
		<form name="pesquisarProfessor" action="/Projeto_LabEngSoft/ProfessorController" method="POST">
			<table>
				<tr>
					<td><label>Pesquisar:</label></td>
					<td><input type="input" id="txtPesquisa" name="txtPesquisar" size="50" class="form-control"/></td>
					<td>&nbsp;<input type="submit" name="btnPesquisar" value="Pesquisar" class="btn btn-success"/></td>
				</tr>
			</table>
		</form>
		</div>
		
		<br>
		
		<div align="center">
			<table border="0" class="table">
				<%
				if(listaProfessor.size() > 0){
					for (Professor professor : listaProfessor) {
				%>
				<tr>
					<td style="width: 200px;"><%=professor.getNome()%></td>
					<td><a class="btn btn-info" href="/Projeto_LabEngSoft/ProfessorController?funcao=mostrar&professorMatricula=<%=professor.getMatricula()%>">Mostrar</a></td>
				</tr>
				<%
					}
				}
				%>
			</table>
			<p>
				<a class="btn btn-primary" href="/Projeto_LabEngSoft/view/formProfessorNovo.jsp">Novo professor</a> &nbsp; <a class="btn btn-default" href="/Projeto_LabEngSoft/view/menu.jsp">Menu</a>
			</p>
			<br>
		</div>
	</div>	
	</body>
	<jsp:include page="/view/rodape.jsp"/>
</html>
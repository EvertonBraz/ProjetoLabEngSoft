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
		<form name="pesquisarAluno" action="/Projeto_LabEngSoft/AlunoController" method="POST">
			<table>
				<tr>
					<td><label>Pesquisar:</label></td>
					<td><input type="input" id="txtPesquisa" name="txtPesquisar" size="50""/></td>
					<td><input type="submit" name="btnPesquisar" value="Pesquisar"/></td>
				</tr>
			</table>
		</form>
		</div>
		
		<br>
		
		<div align="center">
			<table border="0">
				<%
				if(listaProfessor.size() > 0){
					for (Professor professor : listaProfessor) {
				%>
				<tr>
					<td style="width: 200px;"><%=professor.getNome()%></td>
					<td><a
						href="/Projeto_LabEngSoft/AlunoController?funcao=mostrar&alunoRa=<%=professor.getMatricula()%>">Mostrar</a></td>
				</tr>
				<%
					}
				}
				%>
			</table>
			<p>
				<a href="/Projeto_LabEngSoft/view/formProfessorNovo.jsp">Novo professor</a> &nbsp; <a href="/Projeto_LabEngSoft/view/menu.jsp">Menu</a>
			</p>
			<br>
		</div>
	</div>	
	</body>
	<jsp:include page="/view/rodape.jsp"/>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="model.Aluno" 
    import="java.util.List"
    import="java.util.ArrayList" 
    import="persistence.AlunoDAO"
    import="persistence.AlunoDAOImpl;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Projeto_LabEngSoft/CSS/formato.css">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>Lista de Alunos</title>
</head>
<body>
	<jsp:include page="/view/cabecalho.jsp" />
	<% 
	List<Aluno> listaAluno = (List<Aluno>)request.getAttribute("PESQUISA");
	if(listaAluno == null){
		listaAluno = new ArrayList<Aluno>();
		AlunoDAO dao = new AlunoDAOImpl();
		listaAluno = dao.listar();
	}
	   
	%>
	
	
	<div id="principal">
		<h1>Lista de Alunos</h1>
		
		<br>
		
		<div align="center">
		<form name="pesquisarAluno" action="/Projeto_LabEngSoft/AlunoController" method="POST">
			<table>
				<tr>
					<td><label>Pesquisar:</label></td>
					<td><input type="input" id="txtPesquisa" name="txtPesquisar" size="50" /></td>
					<td>&nbsp;<input type="submit" name="btnPesquisar" value="Pesquisar" class="btn btn-success"/></td>
				</tr>
			</table>
		</form>
		</div>
		
		<br>
		
		<div align="center">
			<table class="table">
				<%
				if(listaAluno.size() > 0){
					for (Aluno aluno : listaAluno) {
				%>
				<tr>
					<td style="width: 200px;"><%=aluno.getNome()%></td>
					<td><a class="btn btn-info" href="/Projeto_LabEngSoft/AlunoController?funcao=mostrar&alunoRa=<%=aluno.getRa()%>">Mostrar</a></td>
				</tr>
				<%
					}
				}
				%>
			</table>
			<p>
				<a class="btn btn-primary" href="/Projeto_LabEngSoft/view/formAlunoNovo.jsp">Novo aluno</a> &nbsp; <a class="btn btn-default" href="/Projeto_LabEngSoft/view/menu.jsp">Menu</a>
			</p>
			<br>
		</div>
	</div>	
	</body>
	<jsp:include page="/view/rodape.jsp"/>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="validations.EstadosBrasileiros"
    import="validations.LerCampos" 
    import="model.Professor"
    import="java.text.SimpleDateFormat"
    import="java.util.Date"
    import="javax.swing.JOptionPane;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulário de Professor</title>
<mtw:inputMaskConfig />
</head>
<body>
	<% 
	//Aluno aluno = (Aluno)session.getAttribute("ALUNO");
	Professor professor = (Professor)request.getAttribute("PROFESSOR");
	if(professor == null){
		professor = new Professor();
		professor.setMatricula("");
		professor.setNome("");
		professor.setCpf("");
		professor.setLogradouro("");
		professor.setNumero("");
		professor.setCep("");
		professor.setBairro("");
		professor.setCidade("");

		professor.setTelefone("");
		professor.setCelular("");
		professor.setEmail("");
	}	
	%>

	<script>
		window.onload = function() {
			desabilitarCampos();
		}

		function desabilitarCampos() {
			document.getElementById("matricula").readOnly = true;
			document.getElementById("nome").readOnly = true;
			document.getElementById("dataNasc").readOnly = true;
			document.getElementById("sexo").disabled = true;
			document.getElementById("cpf").readOnly = true;
			document.getElementById("logradouro").readOnly = true;
			document.getElementById("numero").readOnly = true;
			document.getElementById("cep").readOnly = true;
			document.getElementById("bairro").readOnly = true;
			document.getElementById("cidade").readOnly = true;
			document.getElementById("estado").disabled = true;
			document.getElementById("telefone").readOnly = true;
			document.getElementById("celular").readOnly = true;
			document.getElementById("email").readOnly = true;
			document.getElementById("login").readOnly = true;
			document.getElementById("senha").readOnly = true;
			document.getElementById("btnSalvar").style.visibility="hidden";
		}
		
		function habilitarCampos() {
			document.getElementById("matricula").readOnly = false;
			document.getElementById("nome").readOnly = false;
			document.getElementById("dataNasc").readOnly = false;
			document.getElementById("sexo").disabled = false;
			document.getElementById("cpf").readOnly = false;
			document.getElementById("logradouro").readOnly = false;
			document.getElementById("numero").readOnly = false;
			document.getElementById("cep").readOnly = false;
			document.getElementById("bairro").readOnly = false;
			document.getElementById("cidade").readOnly = false;
			document.getElementById("estado").disabled = false;
			document.getElementById("telefone").readOnly = false;
			document.getElementById("celular").readOnly = false;
			document.getElementById("email").readOnly = false;
			document.getElementById("login").readOnly = false;
			document.getElementById("senha").readOnly = false;
			document.getElementById("btnSalvar").style.visibility="visible";
		}
	</script>

	<jsp:include page="/view/cabecalho.jsp" />
	<div id="principal">
		<h1>Formulário de Professor</h1>

	<div align="center">
		<form name="formProfessor" action="/Projeto_LabEngSoft/ProfessorController" method="POST">
			<table>
				<tr>
					<td>Matrícula:</td>
					<td><input id="matricula" type="text" name="txtMatricula"  value="<%= professor.getMatricula() %>"/></td>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input id="nome" type="text" name="txtNome" value="<%=(String)professor.getNome()%>" size="40"/></td>
				</tr>
				<tr>
					<td>Data de Nascimento:</td>
					<% 
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					String data = "";
					if (professor.getDataNascimento() != null)
						data = sdf.format(professor.getDataNascimento());
					%>
					<td><input id="dataNasc" type="text" name="txtDataNasc" value="<%= data %>"/>
				</tr>
				<tr>
					<td>Sexo:</td>
					<% String sexo = LerCampos.lerSexo(professor.getSexo()); %>
					<td>
						<select id="sexo" name="cbSexo">
							<option <%=LerCampos.sexoSelecionado("Masculino", sexo)%> value="Masculino">Masculino</option>
							<option <%=LerCampos.sexoSelecionado("Feminino", sexo)%> value="Feminino">Feminino</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>CPF:</td>
					<td><input id="cpf" type="text" name="txtCpf"  value="<%=(String)professor.getCpf()%>"/>
				</tr>
				<tr>
					<td>Logradouro:</td>
					<td><input id="logradouro" type="text" name="txtLogradouro" size="40"  value="<%=(String)professor.getLogradouro()%>"/>
				</tr>
				<tr>
					<td>Número:</td>
					<td><input id="numero" type="text" name="txtNumero" value="<%=(String)professor.getNumero()%>"/>
				</tr>
				<tr>
					<td>CEP:</td>
					<td><input id="cep" type="text" name="txtCep" size="20" value="<%=(String)professor.getCep()%>"/></td>
				</tr>
				<tr>
					<td>Bairro:</td>
					<td><input id="bairro" type="text" name="txtBairro" value="<%=(String)professor.getBairro()%>"/>
				</tr>
				<tr>
					<td>Cidade:</td>
					<td><input id="cidade" type="text" name="txtCidade" value="<%=(String)professor.getCidade()%>"/>
				</tr>
				<tr>
					<td>Estado:</td>
					<td>
						<select id="estado" name="cbEstado"/>
							<% String estadoConsultado = professor.getEstado(); %>
							<% String[] estados = EstadosBrasileiros.estados(); %>
							<% for (String estado : estados){ %>
								<option <%= LerCampos.estadoSelecionado(estado, estadoConsultado) %> value="<%= estado %>"><%= estado %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<td>Telefone:</td>
					<td><input id="telefone" type="text" name="txtTelefone"  value="<%=(String)professor.getTelefone()%>"/>
				</tr>
				<tr>
					<td>Celular:</td>
					<td><input id="celular" type="text" name="txtCelular"  value="<%=(String)professor.getCelular()%>"/>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input id="email" type="text" name="txtEmail" size="40"  value="<%=(String)professor.getEmail()%>"/>
				</tr>
				<tr>
					<td>Login</td>
					<td><input id="login" type="text" name="txtLogin"/>
				</tr>
				<tr>
					<td>Senha</td>
					<td><input id="senha" type="password" name="txtSenha"/>
				</tr>
				<tr>
					<td colspan="2" align="center"><a href="javascript:void(0)" onclick="habilitarCampos();">Editar</a>&nbsp;
					<a href="/Projeto_LabEngSoft/ProfessorController?funcao=excluir&alunoRa=<%=request.getParameter("professorMatricula")%>">Excluir</a>&nbsp;
					<a href="/Projeto_LabEngSoft/view/listaProfessores.jsp">Lista</a></td>
				</tr>
				<tr>
					<td></td>
				</tr>				
				<tr>
					<td colspan="2" align="center"><input type="submit" id="btnSalvar" name="btnSalvar" value="salvar"/>
				</tr>
			</table>
		</form>
	</div>
	</div>
	
	<jsp:include page="/view/rodape.jsp"/>
</body>
</html>
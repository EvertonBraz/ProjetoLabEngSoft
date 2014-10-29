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

	<jsp:include page="/view/cabecalho.jsp" />
	<div id="principal">
		<h1>Novo Professor</h1>

	<div align="center">
		<form name="formAluno" action="/Projeto_LabEngSoft/ProfessorController" method="POST">
			<table>
				<tr>
					<td>Matrícula:</td>
					<td><input class="form-control" id="matricula" type="text" name="txtMatricula"/></td>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input class="form-control" id="nome" type="text" name="txtNome" size="40"/></td>
				</tr>
				<tr>
					<td>Data de Nascimento:</td>
					<td><input class="form-control" id="dataNasc" type="text" name="txtDataNasc"/>
				</tr>
				<tr>
					<td>Sexo:</td>
					<td>
						<select id="sexo" name="cbSexo">
							<option value="Masculino">Masculino</option>
							<option value="Feminino">Feminino</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>CPF:</td>
					<td><input class="form-control" id="cpf" type="text" name="txtCpf"/>
				</tr>
				<tr>
					<td>Logradouro:</td>
					<td><input class="form-control" id="logradouro" type="text" name="txtLogradouro" size="40"/>
				</tr>
				<tr>
					<td>Número:</td>
					<td><input class="form-control" id="numero" type="text" name="txtNumero"/>
				</tr>
				<tr>
					<td>CEP:</td>
					<td><input class="form-control" id="cep" type="text" name="txtCep" size="20"/></td>
				</tr>
				<tr>
					<td>Bairro:</td>
					<td><input class="form-control" id="bairro" type="text" name="txtBairro"/>
				</tr>
				<tr>
					<td>Cidade:</td>
					<td><input class="form-control" id="cidade" type="text" name="txtCidade"/>
				</tr>
				<tr>
					<td>Estado:</td>
					<td>
						<select id="estado" name="cbEstado"/>
							<% String[] estados = EstadosBrasileiros.estados(); %>
							<% for (String estado : estados){ %>
								<option value="<%= estado %>"><%= estado %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<td>Telefone:</td>
					<td><input class="form-control" id="telefone" type="text" name="txtTelefone"/>
				</tr>
				<tr>
					<td>Celular:</td>
					<td><input class="form-control" id="celular" type="text" name="txtCelular"/>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input class="form-control" id="email" type="text" name="txtEmail" size="40"/>
				</tr>
				<tr>
					<td>Login</td>
					<td><input class="form-control" id="login" type="text" name="txtLogin"/>
				</tr>
				<tr>
					<td>Senha</td>
					<td><input class="form-control" id="senha" type="password" name="txtSenha"/>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a href="/Projeto_LabEngSoft/view/listaProfessores.jsp" class="btn btn-danger">Cancelar</td>
				</tr>	
				<tr>
					<td></td>
				</tr>			
				<tr>
					<td colspan="2" align="center"><input class="btn btn-primary" type="submit" name="btnSalvar" value="salvar"/>
				</tr>
			</table>
		</form>
	</div>
	</div>
	
	<jsp:include page="/view/rodape.jsp"/>
</body>
</html>
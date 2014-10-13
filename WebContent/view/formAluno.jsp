<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="validations.EstadosBrasileiros" 
    import="model.Aluno"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulário de Aluno</title>
<mtw:inputMaskConfig />
</head>
<body>
	<% 
	//Aluno aluno = (Aluno)session.getAttribute("ALUNO");
	Aluno aluno = (Aluno)request.getAttribute("ALUNO");
	if(aluno == null){
		aluno = new Aluno();
		aluno.setRa(0);
		aluno.setNome("");
		//aluno.setDataNascimento("");
		//aluno.setSexo("");
		aluno.setCpf("");
		aluno.setLogradouro("");
		aluno.setNumero("");
		aluno.setCep("");
		aluno.setBairro("");
		aluno.setCidade("");
		//aluno.setEstado("");
		aluno.setTelefone("");
		aluno.setCelular("");
		aluno.setEmail("");
	}	
	%>

	<div align="center">
		<h1>Formulário de Aluno</h1>
	</div>
	<div align="center">
		<form action="./../AlunoController" method="POST">
			<table>
				<tr>
					<td>RA:</td>
					<td><input type="text" name="txtRA"  value="<%=(int)aluno.getRa()%>"/>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input type="text" name="txtNome" value="<%=(String)aluno.getNome()%>" size="40"/>
				</tr>
				<tr>
					<td>Data de Nascimento:</td>
					<td><input type="text" name="txtDataNasc"/>
				</tr>
				<tr>
					<td>Sexo:</td>
					<td>
						<select name="cbSexo">
							<option value="Masculino" name="cbSexo">Masculino</option>
							<option value="Feminino"name="cbSexo">Feminino</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>CPF:</td>
					<td><input type="text" name="txtCpf"  value="<%=(String)aluno.getCpf()%>"/>
				</tr>
				<tr>
					<td>Logradouro:</td>
					<td><input type="text" name="txtLogradouro" size="40"  value="<%=(String)aluno.getLogradouro()%>"/>
				</tr>
				<tr>
					<td>Número:</td>
					<td><input type="text" name="txtNumero" value="<%=(String)aluno.getNumero()%>"/>
				</tr>
				<tr>
					<td>CEP:</td>
					<td><input type="text" name="txtCep" size="20" value="<%=(String)aluno.getCep()%>"/></td>
				</tr>
				<tr>
					<td>Bairro:</td>
					<td><input type="text" name="txtBairro" value="<%=(String)aluno.getBairro()%>"/>
				</tr>
				<tr>
					<td>Cidade:</td>
					<td><input type="text" name="txtCidade" value="<%=(String)aluno.getCidade()%>"/>
				</tr>
				<tr>
					<td>Estado:</td>
					<td>
						<select name="cbEstado"/>
							<% String[] estados = EstadosBrasileiros.estados(); %>
							<% for (String estado : estados){ %>
								<option value="<%= estado %>" name="cbEstado"><%= estado %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<td>Telefone:</td>
					<td><input type="text" name="txtTelefone"  value="<%=(String)aluno.getTelefone()%>"/>
				</tr>
				<tr>
					<td>Celular:</td>
					<td><input type="text" name="txtCelular"  value="<%=(String)aluno.getCelular()%>"/>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="txtEmail" size="40"  value="<%=(String)aluno.getEmail()%>"/>
				</tr>
				<tr>
					<td>Login</td>
					<td><input type="text" name="txtLogin"/>
				</tr>
				<tr>
					<td>Senha</td>
					<td><input type="password" name="txtSenha"/>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" name="btnSalvar" value="salvar"/>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
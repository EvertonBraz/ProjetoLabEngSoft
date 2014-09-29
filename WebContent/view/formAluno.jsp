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
	Aluno aluno = new Aluno();
	if(aluno != null)
		aluno = (Aluno)session.getAttribute("ALUNO"); 
	else
		aluno = null;
	%>

	<div align="center">
		<h1>Formulário de Aluno</h1>
	</div>
	<div align="center">
		<form>
			<table>
				<tr>
					<td>RA:</td>
					<td><input type="text" name="txtRA" value="<%=(String)aluno.getNome()%>"/>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input type="text" name="txtNome" size="40"/>
				</tr>
				<tr>
					<td>Data de Nascimento:</td>
					<td><input type="text" name="txtDataNasc"/>
				</tr>
				<tr>
					<td>Sexo:</td>
					<td>
						<select name="cbSexo">
							<option value="Masculino" name="cbMasculino">Masculino</option>
							<option value="Feminino"name="cbFeminino">Feminino</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>CPF:</td>
					<td><input type="text" name="txtCpf"/>
				</tr>
				<tr>
					<td>Logradouro:</td>
					<td><input type="text" name="txtLogradouro" size="40"/>
				</tr>
				<tr>
					<td>Número:</td>
					<td><input type="text" name="txtNumero"/>
				</tr>
				<tr>
					<td>CEP:</td>
					<td><mtw:inputMask name="cep" size="20" textAlign="right"
                     maskDefined="CEP" /></td>
				</tr>
				<tr>
					<td>Bairro:</td>
					<td><input type="text" name="txtBairro"/>
				</tr>
				<tr>
					<td>Cidade:</td>
					<td><input type="text" name="txtCidade"/>
				</tr>
				<tr>
					<td>Estado:</td>
					<td>
						<select name="cbEstado"/>
							<% String[] estados = EstadosBrasileiros.estados(); %>
							<% for (String estado : estados){ %>
								<option><%= estado %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<td>Telefone:</td>
					<td><input type="text" name="txtTelefone"/>
				</tr>
				<tr>
					<td>Celular:</td>
					<td><input type="text" name="txtCelular"/>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="txtEmail" size="40"/>
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
					<td colspan="2" align="center"><input type="submit" name="btnSalvar" value="Salvar"/>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="validations.EstadosBrasileiros"
    import="validations.LerCampos" 
    import="model.Aluno"
    import="java.text.SimpleDateFormat"
    import="java.util.Date"
    import="javax.swing.JOptionPane;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formul�rio de Aluno</title>
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
		aluno.setCpf("");
		aluno.setLogradouro("");
		aluno.setNumero("");
		aluno.setCep("");
		aluno.setBairro("");
		aluno.setCidade("");

		aluno.setTelefone("");
		aluno.setCelular("");
		aluno.setEmail("");
	}	
	%>

	<div align="center">
		<h1>Formul�rio de Aluno</h1>
	</div>

	<script>
		function myFunction() {
			document.getElementById("ra").readOnly = true;
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
	        
		}
	</script>
	
	<input type="submit" onclick="myFunction()" value="teste"/>

	<div align="center">
		<form name="formAluno" action="./../AlunoController" method="POST">
			<table>
				<tr>
					<td>RA:</td>
					<td><input id="ra" type="text" name="txtRA"  value="<%=(int)aluno.getRa()%>"/></td>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input id="nome" type="text" name="txtNome" value="<%=(String)aluno.getNome()%>" size="40"/></td>
				</tr>
				<tr>
					<td>Data de Nascimento:</td>
					<% 
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					String data = "";
					if (aluno.getDataNascimento() != null)
						data = sdf.format(aluno.getDataNascimento());
					%>
					<td><input id="dataNasc" type="text" name="txtDataNasc" value="<%= data %>"/>
				</tr>
				<tr>
					<td>Sexo:</td>
					<% String sexo = LerCampos.lerSexo(aluno.getSexo()); %>
					<td>
						<select id="sexo" name="cbSexo">
							<option <%=LerCampos.sexoSelecionado("Masculino", sexo)%> value="Masculino">Masculino</option>
							<option <%=LerCampos.sexoSelecionado("Feminino", sexo)%> value="Feminino">Feminino</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>CPF:</td>
					<td><input id="cpf" type="text" name="txtCpf"  value="<%=(String)aluno.getCpf()%>"/>
				</tr>
				<tr>
					<td>Logradouro:</td>
					<td><input id="logradouro" type="text" name="txtLogradouro" size="40"  value="<%=(String)aluno.getLogradouro()%>"/>
				</tr>
				<tr>
					<td>N�mero:</td>
					<td><input id="numero" type="text" name="txtNumero" value="<%=(String)aluno.getNumero()%>"/>
				</tr>
				<tr>
					<td>CEP:</td>
					<td><input id="cep" type="text" name="txtCep" size="20" value="<%=(String)aluno.getCep()%>"/></td>
				</tr>
				<tr>
					<td>Bairro:</td>
					<td><input id="bairro" type="text" name="txtBairro" value="<%=(String)aluno.getBairro()%>"/>
				</tr>
				<tr>
					<td>Cidade:</td>
					<td><input id="cidade" type="text" name="txtCidade" value="<%=(String)aluno.getCidade()%>"/>
				</tr>
				<tr>
					<td>Estado:</td>
					<td>
						<select id="estado" name="cbEstado"/>
							<% String estadoConsultado = aluno.getEstado(); %>
							<% String[] estados = EstadosBrasileiros.estados(); %>
							<% for (String estado : estados){ %>
								<option <%= LerCampos.estadoSelecionado(estado, estadoConsultado) %> value="<%= estado %>"><%= estado %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<td>Telefone:</td>
					<td><input id="telefone" type="text" name="txtTelefone"  value="<%=(String)aluno.getTelefone()%>"/>
				</tr>
				<tr>
					<td>Celular:</td>
					<td><input id="celular" type="text" name="txtCelular"  value="<%=(String)aluno.getCelular()%>"/>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input id="email" type="text" name="txtEmail" size="40"  value="<%=(String)aluno.getEmail()%>"/>
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
					<td colspan="2" align="center"><a href="javascript:void(0)" onclick="myFunction();">Editar</a>&nbsp;
					<a href>excluir</a></td>
				</tr>
				<tr>
					<td></td>
				</tr>				
				<tr>
					<td colspan="2" align="center"><input type="submit" name="btnSalvar" value="salvar"/>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
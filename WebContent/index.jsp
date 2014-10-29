<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Projeto_LabEngSoft/CSS/formato.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

<title>Login</title>
</head>
<body>
	<jsp:include page="/view/cabecalho.jsp" />
	<div id="principal">
		<div><h2><i>Login</i></h2></div>
		<div align="center">
		<form action="./login" method="POST">
			<table>
				<tr>
					<td>Login:</td>
					<td><input type="text" class="form-control" name="txtLogin"></td>
				</tr>
				<tr>
					<td>Senha:</td>
					<td><input type="password" class="form-control" name="txtSenha"></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" class="btn btn-primary" name="btnLogin" value="Entrar"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>
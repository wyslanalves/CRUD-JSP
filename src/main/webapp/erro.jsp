<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tela que mostra os erros</title>
</head>
<body>
<h1>Mensagem de Erro, Entre em contato com a equipe de Surporte do Sistema.</h1>
<%
out.print(request.getAttribute("msg"));
%>
</body>
</html>
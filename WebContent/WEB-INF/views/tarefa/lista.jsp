<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de tarefas</title>
<script type="text/javascript" src="resources/jquery.js"></script>
<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet"/>
</head>
<body>

	<script type="text/javascript">
				function finalizaAgora(id) {
					$.post("finalizaTarefa",	{'id'	:	id},	function() {
				    //	selecionando	o	elemento	html	atrav?s	da	
					//	ID	e	alterando	o	HTML	dele	
					$("#tarefa_"+id).html("Finalizado");
					});
						}
				function excluirAgora(id) {
					$.post("removeTarefa",	{'id'	:	id},	function() {
					$("#tarefa_"+id).closest("tr").hide();;
					});
						}
		</script>

	<a href="novaTarefa">Criar nova tarefa</a>
	<br />
	<br />
	<table>
		<tr>
			<th>Id</th>
			<th>Descri??o</th>
			<th>Finalizado?</th>
			<th>Data de finaliza??o</th>
			<th>Alterando</th>
			<th>Remover</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>

				<c:if test="${tarefa.finalizado	eq	false}">
					<td id="tarefa_${tarefa.id }"><a href="#"
						onClick="finalizaAgora(${tarefa.id})"> Finaliza agora! </a></td>
				</c:if>
				<c:if test="${tarefa.finalizado	eq	true}">
					<td>finalizado</td>
				</c:if>

				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
						pattern="dd/MM/yyyy" /></td>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
				<td id="tarefa_${tarefa.id}"><a href="#" onClick="excluirAgora(${tarefa.id})">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

</body>
</html>
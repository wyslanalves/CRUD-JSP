<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">


										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Cad. Usu�rio</h4>
														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="formUser" enctype="multipart/form-data">

															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default form-static-label ">

																<input type="text" name="id" id="id"
																	class="form-control" value="${modelLogin.id}">
																<span class="form-bar"></span> <label
																	class="float-label">Id:</label>
															</div>

															<div class="form-group form-default input-group mb-4 ">
																<div class="input-group-prepend">
																	<c:if
																		test="${modelLogin.fotouser != '' && modelLogin.fotouser != null}">
																		<a
																			href="<%= request.getContextPath()%>/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
																			<img id="fotoembase64" alt="imagem User"
																			src="${modelLogin.fotouser}" width="70px">
																		</a>
																	</c:if>

																	<c:if
																		test="${modelLogin.fotouser == '' || modelLogin.fotouser == null}">
																		<img alt="imagem User" id="fotoembase64"
																			src="assets/images/faq_man.png" width="70px">
																	</c:if>
																</div>
																<input id="filefoto" name="filefoto" type="file"
																	accept="image/*"
																	onchange="visualizarImg('fotoembase64','filefoto')"
																	class="form-control-file"
																	style="margin-top: 25px; margin-left: 10px">

															</div>

															<div class="form-group form-primary ">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modelLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="dataNascimento" id="dataNascimento" 
																	class="form-control"
																	value="${modelLogin.dataNascimento}"> <span
																	class="form-bar"></span> <label class="float-label">Dat. Nascimento:</label>
															
															
															
															</div>
															
															<div class="form-group form-primary ">
																<input type="text" name="rendamensal" id="rendamensal"
																	 class="form-control"
																 value="${modelLogin.rendamensal}">
																<span class="form-bar"></span> <label
																	class="float-label">Renda Mensal:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="email" name="email" id="email"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail:</label>
															</div>



															<div class="form-group form-default form-static-label">
																<select class="form-control" name="perfil">
																	<option disabled="disabled">[Selecione o
																		Perfil]</option>

																	<option value="ADMIN"
																		<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Admin
																	</option>
																	<option value="SECRETARIA"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");
if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Secret�ria
																	</option>
																	<option value="AUXILIAR"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");
if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Auxiliar</option>
																	<option value="PRODUCAO"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");
if (modelLogin != null && modelLogin.getPerfil().equals("PRODUCAO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Produ��o
																	</option>

																</select> <span class="form-bar"></span> <label
																	class="float-label">Perfil:</label>
															</div>

															<div class="form-group form-primary ">
																<input type="text" name="cep" id="cep"
																	onblur="pesquisaCep()" autocomplete="off"
																	class="form-control" required="required"
																	value="${modelLogin.cep}"> <span
																	class="form-bar"></span> <label class="float-label">CEP:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="logradouro" id="logradouro"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.logradouro}">
																<span class="form-bar"></span> <label
																	class="float-label">Logradouro:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="bairro" id="bairro"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.bairro}">
																<span class="form-bar"></span> <label
																	class="float-label">Bairro:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="localidade" id="localidade"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.localidade}">
																<span class="form-bar"></span> <label
																	class="float-label">Localidade:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="uf" id="uf" autocomplete="off"
																	class="form-control" required="required"
																	value="${modelLogin.uf}"> <span
																	class="form-bar"></span> <label class="float-label">UF:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="numero" id="numero"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.numero}">
																<span class="form-bar"></span> <label
																	class="float-label">Numero:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="text" name="login" id="login"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="password" name="senha" id="senha"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Senha:</label>
															</div>
															<div class="form-group form-primary">
																<input type="radio" name="sexo" checked="checked"
																	value="MASCULINO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																		if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
																		out.print(" ");
																		out.print("checked=\"checked\"");
																		out.print(" ");
																		}%>/>
																Masculino
																
																<input type="radio" name="sexo" value="FEMININO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
																		out.print(" ");
																		out.print("checked=\"checked\"");
																		out.print(" ");
																		}%>/>Feminino
																
															</div>
															<button type="button"
																class="btn btn-primary waves-effect waves-light"
																onclick="limparForm()">Novo</button>
															<button type="submit"
																class="btn btn-success waves-effect waves-light">Salvar</button>
															<button type="button"
																class="btn btn-danger waves-effect waves-light"
																onclick="criarDeleteComAjax()">Excluir</button>
															<c:if test="${modelLogin.id > 0}">
															<a href="<%=request.getContextPath()%>/ServletTelefone?iduser=${modelLogin.id}"
																class="btn btn-primary waves-effect waves-light">Telefone</a>
															</c:if>
															
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-secondary"
																data-toggle="modal" data-target="#exampleModalUsuario">
																Pesquisar</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										<span>${msg}</span>


										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaResultadosview">

												<thead>
													<tr>
														<th scope="col">Id</th>
														<th scope="col">Nome</th>
														<th scope="col">Sexo</th>
														<th scope="col">Editar</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${modelLogins}" var="ml">
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.nome}"></c:out></td>
															<td><c:out value="${ml.sexo}"></c:out></td>

															<td><a
																href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}"
																class="btn  btn-success" type="button">Editar </a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example">
											<ul class="pagination">

												<%
												int totalPgina = (int) request.getAttribute("totalPagina");

												for (int p = 0; p < totalPgina; p++) {
													String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);
													out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + "</a></li>");
												}
												%>
												
											</ul>
										</nav>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usu�rio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Digite o Nome" aria-label="name"
							aria-describedby="basic-addon2" id="nomeBuscar">
						<div class="input-group-append">
							<button class="btn  btn-success" type="button"
								onclick="buscarUsuario()">Buscar</button>
						</div>
					</div>
					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaResultados">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Nome</th>
									<th scope="col">Editar</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="ulPaginacaoUserAjax">
						</ul>

					</nav>
					<span id="totalResultado"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	$("#rendamensal").maskMoney({showSymbol:true, symbol:"R$ ", decimal:",", thousands:"."});
	
	
	const formatter = new Intl.NumberFormat('pt-BR', {
		currency : 'BRL',
		mininumFractionDigits : 2
	});
	
	$("#rendamensal").val(formatter.format($("#rendamensal").val()));
	$("#rendamensal").focus();
	
	
	var dataNascimento = $("#dataNascimento").val();
	
	if(dataNascimento != null && dataNascimento != ''){
	
		var dateFormat = new Date(dataNascimento);
	
		$("#dataNascimento").val(dateFormat.toLocaleDateString('pt-BR',{timeZone: 'UTC'}));
	}
	
	$("#nome").focus();
	
	$( function() {
		  
		  $("#dataNascimento").datepicker({
			    dateFormat: 'dd/mm/yy',
			    dayNames: ['Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta','S�bado'],
			    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
			    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b','Dom'],
			    monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
			    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
			    nextText: 'Pr�ximo',
			    prevText: 'Anterior'
			});
	} );
	
	
	
	$("#numero").keypress(function (event) {
		return /\d/.test(String.fromCharCode(event.keyCode));
	});
	$("#cep").keypress(function (event) {
		return /\d/.test(String.fromCharCode(event.keyCode));
	});

	
		function pesquisaCep() {
			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#cep").val(dados.cep);
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);

						}
					});

		}

		function verEditar(id) {
			var urlAction = document.getElementById("formUser").action;//http://localhost:8080/curso-jsp/ServletUsuarioController

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
		}

		function buscaUserPagAjax(url) {
			var urlAction = document.getElementById("formUser").action;
			var nomeBuscar = document.getElementById("nomeBuscar").value;

			$
					.ajax(
							{
								method : "get",
								url : urlAction,
								data : url,
								success : function(response, textStatus, xhr) {
									var json = JSON.parse(response);

									$('#tabelaResultados > tbody > tr')
											.remove();
									$('#ulPaginacaoUserAjax > li').remove();

									for (var p = 0; p < json.length; p++) {
										$('#tabelaResultados > tbody')
												.append(
														'<tr> <td>'
																+ json[p].id
																+ '</td> <td>'
																+ json[p].nome
																+ '</td> <td><button type="button" class="btn btn-info" onclick="verEditar('
																+ json[p].id
																+ ')">Editar</button></td></tr>')
									}
									document.getElementById("totalResultado").textContent = 'Resultados'
											+ json.length;

									var totalPagina = xhr
											.getResponseHeader("totalPagina");
									for (var p = 0; p < totalPagina; p++) {

										var url = 'nomeBusca='
												+ nomeBusca
												+ '&acao=buscarUserAjaxPage&pagina='
												+ (p * 5);

										$("#ulPaginacaoUserAjax")
												.append(
														'<li class="page-item"><a class="page-link" onclick="buscaUserPagAjax(\''
																+ url + '\')">'
																+ (p + 1)
																+ '</a></li>')

									}

								}
							}).fail(
							function(xhr, status, errorThrown) {
								alert("Erro ao Buscar usu�rio por Nome: "
										+ xhr.responseText)
							});

		}

		function buscarUsuario() {
			var nomeBuscar = document.getElementById("nomeBuscar").value;

			if (nomeBuscar != null && nomeBuscar != ""
					&& nomeBuscar.trim() != '') {/*validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById("formUser").action;

				$
						.ajax(
								{
									method : "get",
									url : urlAction,
									data : "nomeBuscar=" + nomeBuscar
											+ '&acao=buscarUserAjax',
									success : function(response, textStatus,
											xhr) {

										var json = JSON.parse(response);

										$('#tabelaResultados > tbody > tr')
												.remove();
										$('#ulPaginacaoUserAjax > li').remove();

										for (var p = 0; p < json.length; p++) {
											$('#tabelaResultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td>'
																	+ json[p].nome
																	+ '</td> <td><button type="button" class="btn btn-info" onclick="verEditar('
																	+ json[p].id
																	+ ')">Editar</button></td></tr>')
										}
										document
												.getElementById("totalResultado").textContent = 'Resultados'
												+ json.length;

										var totalPagina = xhr
												.getResponseHeader("totalPagina");

										for (var p = 0; p < totalPagina; p++) {
											var url = 'nomeBusca='
													+ nomeBusca
													+ '&acao=buscarUserAjaxPage&pagina='
													+ (p * 5);
											$("#ulPaginacaoUserAjax").append(
													'<li class="page-item"><a class="page-link" onclick="buscaUserPagAjax(\''
															+ url + '\')">'
															+ (p + 1)
															+ '</a></li>')

										}

									}
								}).fail(
								function(xhr, status, errorThrown) {
									alert("Erro ao Buscar usu�rio por Nome: "
											+ xhr.responseText)
								});
			} else {

			}
		}
		function criarDeleteComAjax() {

			if (confirm("Deseja realmente excluir os dados ? ")) {
				var urlAction = document.getElementById("formUser").action;
				var idUser = document.getElementById("id").value;

				$.ajax({
					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletajax',
					success : function(response) {

					}
				}).fail(
						function(xhr, status, errorThrown) {
							alert("Erro ao Deletar usu�rio por id: "
									+ xhr.responseText)
						});
			}
			limparForm();
		}
		function criarDelete() {
			var nome = document.getElementById("nome").value
			if (confirm("Deseja realmente excluir os dados ? " + nome)) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deleta';
				document.getElementById("formUser").submit();
			}
		}

		function limparForm() {
			let elementos = document.getElementById("formUser").elements;

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = "";
			}
		}

		function visualizarImg(fotoembase64, filefoto) {
			var preview = document.getElementById(fotoembase64);// campo IMG html
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();
			reader.onloadend = function() {
				preview.src = reader.result; // Carrega a foto na tela
			};

			if (fileUser) {
				reader.readAsDataURL(fileUser); //preview da imagem
			} else {
				preview.src = '';
			}

		}
	</script>
</body>
</html>

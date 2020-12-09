<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Et�teht�v�-Main</title>
</head>
<body>
<form action="haeasiakkaat" method="get">
	<table id="listaus" border="1" cellpadding="5" style="background-color: #ffffff">
		<thead style="background-color: #cccccc">
			<tr>
				<th colspan="6" style="background-color: #ffd300"><a href="lisaaasiakasJavascript.jsp">Lis�� uusi asiakas</a></th>
			</tr>
			<tr>
				<th colspan="2"> Haku: </th>
				<th colspan="3"><input type="text" name="hakusana" id="hakusana" value=${param['hakusana']}></th>
				<th><input type="submit" value="hae" id="hakunappi"></th>
			</tr>
			<tr>
				<th>ID</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>S�hk�posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${asiakkaat}" var="listItem">
				<tr>
					<td>${listItem.asiakas_id}</td>
					<td>${listItem.etunimi}</td>
					<td>${listItem.sukunimi}</td>
					<td>${listItem.puhelin}</td>
					<td>${listItem.sposti}</td>
					<td>
						<a href="muutaasiakasJavascript?asiakas_id=${listItem.asiakas_id}" >Muuta</a>
						<a onclick="varmista('${listItem.asiakas_id}')" >Poista</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<script>
function varmista(asiakas_id) {
	if(confirm("Haluatko varmasti poistaa asiakkaan "+ asiakas_id + "?")) { //tyylit pois ylh��lt� jos kusee voi olla my�s RED  style="color: #ff3399"
		document.location="poistaasiakas?asiakas_id="+asiakas_id;
	}
}
</script>
</body>
</html>
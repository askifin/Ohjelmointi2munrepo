<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>													<!--�L� UNOHDA TAI HAJOO P��-->
<title>Et�teht�v�-Lis��</title>
</head>
<body>
<form id="tiedot" action="lisaaasiakas" method="post">
	<table border="1" cellpadding="5">
		<thead>
			<tr>
				<th colspan="5"><a href="listaasiakkaat.jsp">Takaisin listaukseen</a></th>
			</tr>
			<tr style="background-color: #ffd300">
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>S�hk�posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody style="background-color: #cccccc">
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="button" id="tallenna" value="Lis��" onclick="tarkista()"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
<script>
function tarkasta(){
	if(document.getElementById("etunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Etunimi ei kelpaa";
		return;
	}else if(document.getElementById("sukunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Sukunimi ei kelpaa!";
		return;
	}else if(document.getElementById("puhelin").value.length<3){
		document.getElementById("ilmo").innerHTML="Puhelin ei kelpaa!";
		return;
	}else if(document.getElementById("sposti").value.length<3){
		document.getElementById("ilmo").innerHTML="S�hk�posti ei kelpaa!";
		return;
	}
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	document.forms["tiedot"].submit();
}

function siivoa(teksti){
	teksti=teksti.replace("<","");
	teksti=teksti.replace(";","");
	teksti=teksti.replace("'","''");
	return teksti;
}
</script>
</body>
</html>
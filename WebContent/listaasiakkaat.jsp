<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Main-Etätehtävä 4</title>
</head>
<style>
	.pointer {
		cursor: pointer;
	}
</style>
<body>
<table id="listaus" border="1" cellpadding="5" style="background-color: #ffffff">
	<thead style="background-color: #cccccc">
		<tr>
			<th colspan="6" style="background-color: #ffd300"><span id="uusiAsiakas"><a class="pointer">Lisää asiakas</a></span> </th>
		</tr>
		<tr>
			<th colspan="2"> Haku: </th>
			<th colspan="3"><input type="text" id="hakusana"></th>
			<th><input type="button" value="hae" id="nappi"></th>
		</tr>
		<tr>
			<th>ID</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>
			<th></th>
		</tr>

	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){
	
	$("#uusiAsiakas").click(function() {
		document.location="lisaaasiakas.jsp";
	})
	
	haeAsiakkaat();
	$("#nappi").click(function() {
		console.log($("#hakusana").val());
		haeAsiakkaat();
	});	
	$(document.body).on("keydown", function(event) {
		if(event.which==13) {
			haeAsiakkaat();
		}
	})
	$("#hakusana").focus();
});

function haeAsiakkaat() {
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){
		$.each(result.asiakkaat, function(i, field) {
			var htmlStr;
			htmlStr+="<tr>";
			htmlStr+="<td>"+field.asiakas_id+"</td>";
			htmlStr+="<td>"+field.etunimi+"</td>";
			htmlStr+="<td>"+field.sukunimi+"</td>";
			htmlStr+="<td>"+field.puhelin+"</td>";
			htmlStr+="<td>"+field.sposti+"</td>";
			htmlStr+="<td><span class='poista' onclick=poista('"+field.asiakas_id+"')>Poista</span></td>";
			htmlStr+="</tr>";
			$("#listaus tbody").append(htmlStr);
		});
	}});
}
function poista(asiakas_id) {
	console.log(asiakas_id);
	if(confirm("Poista asiakasnro " + asiakas_id + "?")) {
		$.ajax({url:"asiakkaat/"+asiakas_id, type:"DELETE", dataType:"json", success:function(result) {
			if(result.response==0) {
				$("#ilmo").html("Poisto epäonnistui");
			} else if(result.response==1) {
				$("#rivi_"+asiakas_id).css("background-color", "red"); //tarpeellinen??
				alert("Asiakkaan " + asiakas_id + " " + etunimi +" "+ sukunimi +" poisto onnistui.");
				haeAsiakkaat();
			}
		}});
	}
}
</script>
</body>
</html>
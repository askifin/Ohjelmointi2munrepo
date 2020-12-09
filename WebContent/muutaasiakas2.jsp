<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>													<!--ÄLÄ UNOHDA TAI HAJOO PÄÄ-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<title>Etätehtävä-Muuta</title>
</head>
<body>
<form id="tiedot">
	<table border="1" cellpadding="5">
		<thead>
			<tr>
				<th colspan="5"><span id="takaisin"><a class="pointer">Takaisin listaukseen</a></span></th>
			</tr>
			<tr style="background-color: #ffd300">
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sähköposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody style="background-color: #cccccc">
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="submit" id="tallenna" value="Päivitä"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="asiakas_id" id="asiakas_id">
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function() {
	$("#takaisin").click(function() {
		document.location="listaasiakkaat.jsp";
	});
	
	var asiakas_id = requestURLParam("asiakas_id");
	$.ajax({url:"asiakkaat/haeyksi/"+asiakas_id, type:"GET", dataType:"json", success:function(result){
		$("#etunimi").val(result.etunimi);	
		$("#sukunimi").val(result.sukunimi);
		$("#puhelin").val(result.puhelin);
		$("#sposti").val(result.sposti);		
		$("#asiakas_id").val(result.asiakas_id);
		//$("#asiakas_id").val(result.asiakas_id);
	}});
	
	$("#tiedot").validate({
		rules: {
			etunimi: {
				required: true,
				minlength: 2,
				maxlength: 99
			},
			sukunimi: {
				required: true,
				minlength: 2,
				maxlength: 99
			},
			puhelin: {
				required: true,
				minlength: 3,
				maxlength: 99
			},
			sposti: {
				required: true,
				email: true
			},
		},
		messages: {
			asiakas_id: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			etunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			puhelin: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			sposti: {
				required: "Puuttuu",
				email: "Virheellinen"
			}
		},
		submitHandler: function(form) {
			paivitaTiedot();
		}
	})
});
function paivitaTiedot() {
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); 
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"PUT", dataType:"json", success:function(result) {
		if(result.response==0){
        	$("#ilmo").html("Asiakkaan päivitys epäonnistui.");
        }else if(result.response==1){			
        	$("#ilmo").html("Asiakkaan päivitys onnistui.");
        	$("#etunimi, #sukunimi, #puhelin, #sposti").val("");
		}
	}});
}
</script>
</html>
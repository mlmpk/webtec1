function getRandomIntegers() {
	
	var xmlhttp;

	var url = "RandomIntsController.jsp";
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("randomIntegers").innerHTML = xmlhttp.responseText;
		}
	}

	xmlhttp.open("GET", url, true);
	xmlhttp.send();

}


function getRandomIntegersWithJQuery(){		
	$.ajax({
		  type: "POST",
		  url: "RandomIntsController.jsp",
		})
		  .done(function( response ) {
			$("#randomIntegers").html(response);
		});		
}
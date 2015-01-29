var ws = new WebSocket("ws://localhost:8080/Aufgabenblatt_11/zeitgeber");

ws.onopen = function() {
	document.getElementById("status").className = "circle green";
};

ws.onmessage = function(message) {
	document.getElementById("serverresponse").textContent += message.data
			+ "\n";
};


function sendMessage() {
	name = document.getElementById("nutzernamen").value;
	if(name != ""){
		ws.send(name);
		document.getElementById("nutzernamen").value = "";
	}else{
		alert("Bitet Namen eingeben");
	}
}

function closeConnection() {
	document.getElementById("status").className = "circle red";
	ws.close();
}
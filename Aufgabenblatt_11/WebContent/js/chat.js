


function init(){
 console = document.getElementById("console");
 }

function login(){
	
	var username = document.getElementById("name").value;
	
	if(username != ""){
		
		ws = new WebSocket("ws://localhost:8080/Aufgabenblatt_11/chat/" + username);
		
		ws.onopen = function(message) {
			document.getElementById("login").style.display = "none";
			document.getElementById("logout").style.display = "block";
		};
		
		ws.onmessage = function(message) {
			console.value += message.data + "\n";
		};
		
	}else{
		alert("Kein Namen angegeben!");
	}
	
}

function logout(){
	
	document.getElementById("login").style.display = "block";
	document.getElementById("logout").style.display = "none";
	ws.close();

	console.value += "Sie haben sich ausgeloggt.\n";
	
}



function sendMessage() {
	message = document.getElementById("message").value;
	if(message != ""){
		ws.send(message);
		document.getElementById("message").value = "";
	}else{
		alert("Bitte Nachricht eingeben");
	}
}

window.onbeforeunload=function(){ws.close();};

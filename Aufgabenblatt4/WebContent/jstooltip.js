var delay;
var timeoutID;

function init(newDelay){
	if(!isNaN(newDelay)){
		delay = newDelay;
	}
	
	var tooltipdiv = document.getElementById("tooltip");
	var tags = ["input","select","textarea"];
	var elems;
	
	for (var i = 1; i < tags.length; i++){
		elems = document.getElementsByTagName(tags[i]);
		for(var j = 0; j< elems.length; j++){
			elem = 	elems[j];
			elem.onmouseout = function(){
				clearTimeout(timeoutID);
				tooltipdiv.style.visibility = "hidden";
			};
		}
	}
	
	document.body.onmouseover = function(){
		tooltipdiv.style.visibility = "hidden";		
	};
}

function tooltip(e, text){
	var tooltipdiv = document.getElementById("tooltip");
	tooltipdiv.innerHTML = text;
	x = e.clientX;
	y = e.clientY + 15;
	tooltipdiv.style.left = x + "px";
	tooltipdiv.style.top = y + "px";
	timeoutID = window.setTimeout("setVisible()", delay);
}

function setVisible(){
	document.getElementById("tooltip").style.visibility = "visible";
}

function updateToolTipPos(e){
	var tooltipdiv = document.getElementById("tooltip");
	x = e.clientX;
	y = e.clientY + 15;
	tooltipdiv.style.left = x + "px";
	tooltipdiv.style.top = y + "px";
}
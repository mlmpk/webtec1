
var felder = 2;
var zahlenLayer=document.getElementById("zahlenLayer");

function replaceComma(obj){
	
	var value = obj.value;
	obj.value =	value.replace(/,/g,'.'); 

	if(obj.value==""){
		deleteLastDiv();
	}else{
		addDivElement(obj);
	}
}

function addDivElement(obj){
	
	var nr = parseInt((obj.id).slice(4));
	if(nr == felder){
		nr++;
		felder++;
		var neueZahl = document.createElement("div");
		
		neueZahl.innerHTML = "<label for=\"zahl" + felder +"\">Zahl "+ felder +"</label><input type=\"text\" id=\"zahl"+ felder + "\" name=\"zahl\" onkeyup=\"replaceComma(this);\"/><br/>";
		zahlenLayer.appendChild(neueZahl);
		
	}
}

function deleteLastDiv(){
	zahlenLayer.removeChild(zahlenLayer.lastChild);
	
}

function check(){
	
}
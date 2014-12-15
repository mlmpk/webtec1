// Global variables.
var ballX = 50;		// Ball x position.
var ballY = 50;		// Ball y position.
var xPos = 300;			// x position of Weby (head midpoint)
var yPos = 300;			// y position of Weby (head midpoint)
var armPos = 40;		// Only necessary if you want to move his arm per keypress
var kopfPosX = 0;		// Only necessary if you want to move his head per keypress
var boardX = 500;		// Board width
var boardY = 400;		// Board height
var canvas;				// Canvas element
var context;			// Canvas context

var tasten = new Array(false, false, false, false);
var counter = 0;
var speed = 1;
var xBallSpeed= 1;
var yBallSpeed= 1;

function keypress(evt) {	
	switch (evt.keyCode) {

	// Left arrow.
	case 37:
		tasten[0] = true;
	
		break;
		
	// Right arrow.
	case 39:
		tasten[1] = true;
	
		break;
		
	// Up arrow.
	case 38:
		tasten[2] = true;
	
		break;
		
	// Down arrow.
	case 40:
		tasten[3] = true;
		
		break;
	}
}

function keyup(evt) {
	switch (evt.keyCode) {

	// Left arrow.
	case 37:
		tasten[0] = false;
		
		break;
		
	// Right arrow.
	case 39:
		tasten[1] = false;
		break;
		
	// Up arrow.
	case 38:
		tasten[2] = false;
		break;
		
	// Down arrow.
	case 40:
		tasten[3] = false;
		break;
	}	
}

function drawCanvasCity() {
	canvas = document.getElementById("canvasCity");
  	context = canvas.getContext("2d");
  	init();
}

function init() {
//	while(true){
		//drawWeby();
		repaint();
//	}
}

function drawWeby() {
	// Head
	context.beginPath();
	context.arc(xPos + kopfPosX, yPos, 28, 0, Math.PI * 2, true);
	context.lineWidth = 5;
	context.stroke();
	context.beginPath();
	context.arc(xPos + kopfPosX, yPos, 28, 0, Math.PI * 2, true);
	context.fillStyle = "#dedede";
	context.fill();

	// Left eye
	context.beginPath();
	context.arc(xPos - 10 + kopfPosX, yPos - 5, 4, 0, Math.PI * 2);
	context.lineWidth = 2;
	context.stroke();

	// Right eye
	context.beginPath();
	context.arc(xPos + 9 + kopfPosX, yPos - 5, 4, 0, Math.PI * 2);
	context.lineWidth = 2;
	context.stroke();

	// Left arm
	context.beginPath();
	context.moveTo(xPos - 20, yPos + 35);
	context.lineTo(xPos - 34, yPos + armPos);
	context.lineWidth = 10;
	context.lineCap = "round";
	context.strokeStyle = "black";
	context.stroke();

	// Right arm
	context.beginPath();
	context.moveTo(xPos + 20, yPos + 35);
	context.lineTo(xPos + 34, yPos + 40);
	context.lineWidth = 10;
	context.lineCap = "round";
	context.strokeStyle = "black";
	context.stroke();

	// Body
	context.fillStyle = "#6a6a6a";
	context.fillRect(xPos - 20, yPos + 20, 40, 30);
	context.strokeStyle = "black";
	context.lineWidth = "2";
	context.strokeRect(xPos - 19, yPos + 20, 38, 30);

	// Left leg
	context.fillStyle = "#a8a8a8";
	context.fillRect(xPos - 14, yPos + 50, 15, 20);
	context.strokeStyle = "black";
	context.lineWidth = "2";
	context.strokeRect(xPos - 14, yPos + 51, 14, 19);

	// Right leg
	context.fillStyle = "#a8a8a8";
	context.fillRect(xPos + 1, yPos + 50, 15, 20);
	context.strokeStyle = "black";
	context.lineWidth = "2";
	context.strokeRect(xPos + 1, yPos + 51, 14, 19);

	// Left foot
	context.fillStyle = "red";
	context.fillRect(xPos - 21, yPos + 70, 20, 7);
	context.strokeStyle = "black";
	context.lineWidth = "2";
	context.strokeRect(xPos - 21, yPos + 70, 20, 7);

	// Right foot
	context.fillStyle = "red";
	context.fillRect(xPos + 1, yPos + 70, 20, 7);
	context.strokeStyle = "black";
	context.lineWidth = "2";
	context.strokeRect(xPos + 1, yPos + 70, 20, 7);
}


	
function repaint(){
	do{
	var ret = true;
	context.clearRect(0,0,boardX,boardY);
	
	if(tasten[1] && xPos + 45 < boardX){
		xPos += speed;
	}
	if(tasten[0] && xPos - 45 > 0){
		xPos -= speed;
	}
	if(tasten[2] && yPos -30 > 0){
		yPos -= speed;
	}
	if(tasten[3] && xPos + 80 < boardY){
		yPos += speed;
	}
	
	counter++;
	if(counter==500){
		xBallSpeed *= 1.3;
		yBallSpeed *= 1.3;
		counter = 0;
	}
	
	ballX += xBallSpeed;
	ballY += yBallSpeed;
	drawWeby();
//	drawBall();
//	hitWall();
//	ret = hitWeby();
	
	}while(!ret);
	
}	

function drawBall(){
	context.beginPath();
	context.arc(ballX,ballY, 14, 0, Math.PI*2,true);
	context.lineWidth = "5";
	context.stroke();
	context.fillStyle = "red";
	context.fill();
}

function hitWall(){
	if( ballX + 28 > boardX || ballX - 28  < 0){
		xBallSpeed = -xBallSpeed;
	}
	if( ballX + 28 > boardY || ballY - 28  < 0){
		yBallSpeed = -yBallSpeed;
	}
}

function hitWeby(){
	var abstand_1 = Math.sqrt(Math.pow(xPos - ballX, 2) + Math.pow(yPos-ballY, 2));
	var abstand_2 = Math.sqrt(Math.pow(xPos - ballX, 2) + Math.pow(yPos+50-ballY, 2));
	if( abstand_1 < 60 || abstand_2 < 60){
		alert("GAME OVER!");
		clearInterval();
		return false;
	}
}


var serverName = 'http://localhost/Bluff2/lib/bluff.php/';
var functionFlag=null;
var functionFlag2=null;
var functionFlag3=null;
var functionFlag4=null;
var canPlay=false;
window.OpenedCards = [];
window.CardOfPlayer = [];
window.CardOfPlayerPlay = [];
window.CardTypes = [
	{ name: "ace_of_spades", image: "https://legendmod.ml/adise/ace_of_spades.png" },
	{ name: "2_of_spades", image: "https://legendmod.ml/adise/2_of_spades.png" },
	{ name: "3_of_spades", image: "https://legendmod.ml/adise/3_of_spades.png" },
	{ name: "4_of_spades", image: "https://legendmod.ml/adise/4_of_spades.png" },
	{ name: "5_of_spades", image: "https://legendmod.ml/adise/5_of_spades.png" },	
	{ name: "6_of_spades", image: "https://legendmod.ml/adise/6_of_spades.png" },	
	{ name: "7_of_spades", image: "https://legendmod.ml/adise/7_of_spades.png" },	
	{ name: "8_of_spades", image: "https://legendmod.ml/adise/8_of_spades.png" },	
	{ name: "9_of_spades", image: "https://legendmod.ml/adise/9_of_spades.png" },	
	{ name: "10_of_spades", image: "https://legendmod.ml/adise/10_of_spades.png" },	
	{ name: "jack_of_spades2", image: "https://legendmod.ml/adise/jack_of_spades2.png" },
	{ name: "queen_of_spades2", image: "https://legendmod.ml/adise/queen_of_spades2.png" },
	{ name: "king_of_spades2", image: "https://legendmod.ml/adise/king_of_spades2.png" },
	
	{ name: "ace_of_clubs", image: "https://legendmod.ml/adise/ace_of_clubs.png" },
	{ name: "2_of_clubs", image: "https://legendmod.ml/adise/2_of_clubs.png" },
	{ name: "3_of_clubs", image: "https://legendmod.ml/adise/3_of_clubs.png" },
	{ name: "4_of_clubs", image: "https://legendmod.ml/adise/4_of_clubs.png" },
	{ name: "5_of_clubs", image: "https://legendmod.ml/adise/5_of_clubs.png" },	
	{ name: "6_of_clubs", image: "https://legendmod.ml/adise/6_of_clubs.png" },	
	{ name: "7_of_clubs", image: "https://legendmod.ml/adise/7_of_clubs.png" },	
	{ name: "8_of_clubs", image: "https://legendmod.ml/adise/8_of_clubs.png" },	
	{ name: "9_of_clubs", image: "https://legendmod.ml/adise/9_of_clubs.png" },	
	{ name: "10_of_clubs", image: "https://legendmod.ml/adise/10_of_clubs.png" },	
	{ name: "jack_of_clubs2", image: "https://legendmod.ml/adise/jack_of_clubs2.png" },
	{ name: "queen_of_clubs2", image: "https://legendmod.ml/adise/queen_of_clubs2.png" },
	{ name: "king_of_clubs2", image: "https://legendmod.ml/adise/king_of_clubs2.png" },
	
	{ name: "ace_of_hearts", image: "https://legendmod.ml/adise/ace_of_hearts.png" },
	{ name: "2_of_hearts", image: "https://legendmod.ml/adise/2_of_hearts.png" },
	{ name: "3_of_hearts", image: "https://legendmod.ml/adise/3_of_hearts.png" },
	{ name: "4_of_hearts", image: "https://legendmod.ml/adise/4_of_hearts.png" },
	{ name: "5_of_hearts", image: "https://legendmod.ml/adise/5_of_hearts.png" },	
	{ name: "6_of_hearts", image: "https://legendmod.ml/adise/6_of_hearts.png" },	
	{ name: "7_of_hearts", image: "https://legendmod.ml/adise/7_of_hearts.png" },	
	{ name: "8_of_hearts", image: "https://legendmod.ml/adise/8_of_hearts.png" },	
	{ name: "9_of_hearts", image: "https://legendmod.ml/adise/9_of_hearts.png" },	
	{ name: "10_of_hearts", image: "https://legendmod.ml/adise/10_of_hearts.png" },	
	{ name: "jack_of_hearts2", image: "https://legendmod.ml/adise/jack_of_hearts2.png" },
	{ name: "queen_of_hearts2", image: "https://legendmod.ml/adise/queen_of_hearts2.png" },
	{ name: "king_of_hearts2", image: "https://legendmod.ml/adise/king_of_hearts2.png" },

	{ name: "ace_of_diamonds", image: "https://legendmod.ml/adise/ace_of_diamonds.png" },
	{ name: "2_of_diamonds", image: "https://legendmod.ml/adise/2_of_diamonds.png" },
	{ name: "3_of_diamonds", image: "https://legendmod.ml/adise/3_of_diamonds.png" },
	{ name: "4_of_diamonds", image: "https://legendmod.ml/adise/4_of_diamonds.png" },
	{ name: "5_of_diamonds", image: "https://legendmod.ml/adise/5_of_diamonds.png" },	
	{ name: "6_of_diamonds", image: "https://legendmod.ml/adise/6_of_diamonds.png" },	
	{ name: "7_of_diamonds", image: "https://legendmod.ml/adise/7_of_diamonds.png" },	
	{ name: "8_of_diamonds", image: "https://legendmod.ml/adise/8_of_diamonds.png" },	
	{ name: "9_of_diamonds", image: "https://legendmod.ml/adise/9_of_diamonds.png" },	
	{ name: "10_of_diamonds", image: "https://legendmod.ml/adise/10_of_diamonds.png" },	
	{ name: "jack_of_diamonds2", image: "https://legendmod.ml/adise/jack_of_diamonds2.png" },
	{ name: "queen_of_diamonds2", image: "https://legendmod.ml/adise/queen_of_diamonds2.png" },
	{ name: "king_of_diamonds2", image: "https://legendmod.ml/adise/king_of_diamonds2.png" }
	];
	

function userCards(){	
	functionFlag2='userCards';
	getCards(1);
	//window.CardOfPlayerPlay = JSON.parse(JSON.stringify(window.CardTypes)); //to window.CardTypes to 8elw sta8ero
	//window.CardOfPlayer = JSON.parse(JSON.stringify(window.CardOfPlayerPlay)); //den einai ayta, alla auta pou dinei o server	
}	
function userCards2(){	
	DOMContentLoaded2();
	functionFlag2=null;
	console.log('step userCards');	
	window.CardOfPlayer = JSON.parse(JSON.stringify(window.CardOfPlayerPlay)); //den einai ayta, alla auta pou dinei o server	
}	
function userCardsTheRest(){
	functionFlag3='userCardsTheRest';
	getCards(1);
	//window.CardOfPlayer = JSON.parse(JSON.stringify(window.CardOfPlayerPlay)); //den einai ayta, alla auta pou dinei o server	
	
}	
function userCardsTheRest2(){
	startBluff2();
	functionFlag3=null;
	console.log('step userCardsTheRest');
	window.CardOfPlayer = JSON.parse(JSON.stringify(window.CardOfPlayerPlay)); //den einai ayta, alla auta pou dinei o server
}	
function DOMContentLoaded2(){
		$("#announce").remove();
		$("#bluff").show();
		$("#pass").show();
		$("#cardsss").show();
		$("#throwCards").show();
		$("#quitGame").show();
		$("#newGame").hide();
		$("#time").show();			
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'New game' + ': </span><span class=\"message-text\">' + '...wating for opponent' + '</span></span>' );	
		startBluff(); 
		toastr.info('New game hosted by client'); 
		canPlay=false;	
}
document.addEventListener('DOMContentLoaded', function() {
   //addBluffArea();
   toastr.options.positionClass = 'toast-bottom-left';
   toastr.info('Welcome to bluff card game'); 
   $("#quitGame").hide();
   $("#pass").hide();
   $("#bluff").hide();
   $("#cardsss").hide();
   $("#throwCards").hide();   
	$("#newGame").click(function() {
		refreshInit();	
		userCards();

	}); 
	$("#quitGame").click(function() {
		window.OpenedCards = [];
		addBluffArea();	

		$("#announce").remove();
		$("#app").remove();
			
		$("#newGame").show();
		$("#quitGame").hide();
		$("#bluff").hide();
		$("#pass").hide();
		$("#throwCards").hide();	
		$("#cardsss").hide();
		$("#time").hide();	
		toastr.info('Game ended by client'); 
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Result' + ': </span><span class=\"message-text\">' + 'defeated' + '</span></span>' );
		canPlay=false;
	}); 
   //auto 8a kanri refresh ka8e fora pou exoume nea fylla
   /* $("#app").remove();
   addBluffArea();
   startBluff(); */
});

function refreshInit(){
	$("#app").remove();
	addBluffArea();		
	startBluff();	
}
function becomeBluffedSucceeded(cards){
	window.TakenCardsAsArray = Object.assign([], cards);
	for (var i=0;i<CardTypes.length;i++){
		for (var x=0;x<window.TakenCardsAsArray.length;x++){
			if (CardTypes[i].name==window.TakenCardsAsArray[x]){
				//console.log(window.TakenCardsAsArray[x]);
				var temp = { name:  window.TakenCardsAsArray[x], image: "https://legendmod.ml/adise/" + window.TakenCardsAsArray[x] + ".png" }
				window.CardOfPlayerPlay.push(temp);
			}
		}		
	}
	
	var newCards = "";
	for (var i=0;i<window.TakenCardsAsArray.length;i++){
		if (window.TakenCardsAsArray[i]){
			newCards += window.TakenCardsAsArray[i] + ", ";
		}
	}
	newCards.replace("_"," ");
	toastr.info('You got bluffed. Cards added: ' + newCards); 
	
	window.OpenedCards = [];
	//refreshInit();
	canPlay=false;	
}
function yourTurn(cardsDown, lastCardsOfEnemey){
	if (cardsDown && lastCardsOfEnemey){
		$("#announce").remove();	
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Your turn' + ': </span><span class=\"message-text\">' + cardsDown + ' 🃛 cards down. Opponent thrown ' + lastCardsOfEnemey + ' cards!</span>'+
		'<br>');
		for (var i=0;i<cardsDown-lastCardsOfEnemey;i++) {$("#announce").append('<img src="https://legendmod.ml/adise/card_backside.jpg" alt="" style="margin-left:1px;width:40px;height:50px;">');}
		for (var i=0;i<lastCardsOfEnemey;i++) {$("#announce").append('<img src="https://legendmod.ml/adise/card_backside.jpg" alt="" style="margin-left:-10px;width:40px;height:50px;transform:rotate(10deg);">');}
		
		$("#announceArea").append('</span>');
	}
	else if(cardsDown){
		$("#announce").remove();
		
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Your turn' + ': </span><span class=\"message-text\">' + cardsDown + ' 🃛 cards down. Opponent passed!</span><br>' );
		for (var i=0;i<cardsDown;i++) {$("#announce").append('<img src="https://legendmod.ml/adise/card_backside.jpg" alt="" style="margin-left:1px;width:40px;height:50px;">');}
		$("#announceArea").append('</span>');
	}
	else{
		$("#announce").remove();	
		
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Your turn' + ': </span><span class=\"message-text\">0 cards down. Opponent passed!</span><br>' );
		for (var i=0;i<lastCardsOfEnemey;i++) {$("#announce").append('<img src="https://legendmod.ml/adise/card_backside.jpg" alt="" style="margin-left:-10px;width:40px;height:50px;transform:rotate(10deg);">');}
		$("#announceArea").append('</span>');
	}	
	canPlay = true;	
}
function initButtons(){
		$("#bluff").click(function() {
		//if (canPlay){
		$("#announce").remove();	
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Result' + ': </span><span class=\"message-text\">' + 'call bluff!' + '</span></span>' );
		//energeies
		window.OpenedCards = [];
		canPlay=false;
		//}
		}); 	
		$("#pass").click(function() {
			//if (canPlay){
			//energeies	
			
			$("#announce").remove();	
			$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Result' + ': </span><span class=\"message-text\">' + 'passed!' + '</span></span>' );
			window.OpenedCards = [];
			canPlay=false;			
		//}
		}); 
		$("#throwCards").click(function() {
			//if (canPlay){	
			if(window.OpenedCards && window.OpenedCards.length>0 && window.OpenedCards.length<5){
				var callTheNumber = $("#cardsss").val();
				$("#announce").remove();
				$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Result' + ': </span><span class=\"message-text\">' + window.OpenedCards.length + ' card thrown down!' + '</span><br>' );
				//for (var i=0;i<window.OpenedCards.length;i++) {$("#announce").append('<img src="https://legendmod.ml/adise/card_backside.jpg" alt="" style="margin:1px;width:70px;height:80px;transform:rotate(10deg);">');}
				
					for (var i=0;i<window.OpenedCards.length;i++) {
						if ((callTheNumber=='A' && window.OpenedCards[i].includes("ace_of"))
						|| 	(callTheNumber=='2' && window.OpenedCards[i].includes("2_of"))
						|| 	(callTheNumber=='3' && window.OpenedCards[i].includes("3_of"))
						|| 	(callTheNumber=='4' && window.OpenedCards[i].includes("4_of"))
						|| 	(callTheNumber=='5' && window.OpenedCards[i].includes("5_of"))
						|| 	(callTheNumber=='6' && window.OpenedCards[i].includes("6_of"))
						|| 	(callTheNumber=='7' && window.OpenedCards[i].includes("7_of"))
						|| 	(callTheNumber=='8' && window.OpenedCards[i].includes("8_of"))
						|| 	(callTheNumber=='9' && window.OpenedCards[i].includes("9_of"))
						|| 	(callTheNumber=='10' && window.OpenedCards[i].includes("10_of"))
						|| 	(callTheNumber=='J' && window.OpenedCards[i].includes("jack_of"))
						|| 	(callTheNumber=='Q' && window.OpenedCards[i].includes("queen_of"))
						|| 	(callTheNumber=='K' && window.OpenedCards[i].includes("king_of"))
						){
							$("#announce").append('<img src="https://legendmod.ml/adise/' + window.OpenedCards[i] + '.png" alt="" style="margin-top:10px;margin-left:-15px;width:70px;height:80px;transform:rotate(10deg);">');
							}					
						else{
							$("#announce").append('<img src="https://legendmod.ml/adise/' + window.OpenedCards[i] + '.png" alt="" style="margin-top:10px;margin-left:-15px;width:70px;height:80px;transform:rotate(10deg);filter: blur(5px);">');
							
						}
					}
				$("#announceArea").append('</span>' );

				for (var i=0;i<window.OpenedCards.length;i++){
					for (var x=0;x<window.CardOfPlayerPlay.length;x++){
						if (window.CardOfPlayerPlay[x] && window.CardOfPlayerPlay[x].name==window.OpenedCards[i]){	
							//console.log(window.OpenedCards[i]);
							window.CardOfPlayerPlay = window.CardOfPlayerPlay.filter(function(item) { //afairei tis kartes pou pesan
							return item.name !== window.OpenedCards[i];
							});		
						}	
					}						
				}
				//energeies
				refreshInit();				
			}
			else if(window.OpenedCards.length>=5){
				toastr.info('Too many cards chosen'); 
			}
			else{
				toastr.info('You must chose some cards first'); 
			}
			window.OpenedCards = [];
			canPlay=false;
			
			//}
		}); 
		
}

function MakeOpenCardsObject(){
	window.OpenedCardsAsObject = Object.assign({}, window.OpenedCards); //metatrepei ton pinaka se Object gia apostolh me JSON
	//Object.assign([], DedomenaApoJSON); //metatrepei to JSON Object se pinaka gia na ginei epeksergasia
	//JSON.parse(window.OpenedCards);
	//JSON.stringify(window.OpenedCards)
	//Object.assign({}, ['a','b','c']);
}	

function addBluffArea(){
	$("#bluff_hand").append('<div id="app">'+	
	'<button class="button" id="bluff">Call Bluff</button>'+
	'<button class="button" id="pass">Pass</button>'+
	'<select class="button" name="cardsss" id="cardsss">'+
    '<option value="A">A</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option>'+
    '<option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="J">J</option><option value="5">5</option><option value="Q">Q</option><option value="K">K</option>'+
    '</select>'+
	'<button class="button" id="throwCards">Throw Cards</button>'+
	//'<button class="button" id="quitGame" @click="resetGame()">Quit Game</button>'+
	'<div class="info"><div id="time"><span class="label">Time:</span><span class="value">{{ time }}</span></div></div>'+
	'<div class="cards">'+
    '<div class="card" v-for="card in cards" :class="{ flipped: card.flipped, found: card.found }" @click="flipCard(card)">'+
    '<div class="back"></div>'+
    `<div class="front" :style="{ backgroundImage: 'url(' + card.image + ')' }"></div>`+
    '</div></div>'+
    '<div class="splash" v-if="showSplash"> </div>'+
	'</div>');	
	$("#time").hide();	

	initButtons();
}
function startBluff(){
	userCardsTheRest();
}
function startBluff2(){

   $("#time").show();
   window.BluffGAME = new Vue({
      el: "#app",

  data: {
    showSplash: false,
    cards: [],
    started: false,
    startTime: 0,
    flipBackTimer: null,
    timer: null,
    time: "--:--"},
  methods: {
    resetGame() {
      this.showSplash = false;
      window.cards = window.CardOfPlayer; //edw 8a antisoixh8ei o pinakas me ta stoixeia apo ton server (allos pinakas 8a mpei)
	  
      this.started = false;
	  clearInterval(this.timer);
      this.startTime = 0;

      _.each(cards, card => {
        card.flipped = false;
      });

      this.cards = cards;
    },
	flipTheAlreadyFlippedCards() { //prepei na trexei gia na epanafortwnoun oi anoigmenes kartes, trexei otan kaloune mplofa kai pernw thn mpaza
      _.each(cards, card => {
		  for( var i=0; i<window.OpenedCards.length; i++ ){
			if (card.name = window.OpenedCards[i]){
				card.flipped = true;
		  }
		}     
      });	  
	},
    flippedCards() {
      return _.filter(this.cards, card => card.flipped);
    },
    startGame() {
      this.started = true;
      this.startTime = moment();

      this.timer = setInterval(() => {
        this.time = moment(moment().diff(this.startTime)).format("mm:ss");
      }, 1000);
    },

    finishGame() {
      this.started = false;
      clearInterval(this.timer);
      this.showSplash = true;
    },

    flipCard(card) {
      if (!this.started) {
        this.startGame();
      }
      let flipCount = this.flippedCards().length;	  
      card.flipped = !card.flipped;
	  //console.log(this.flippedCards());
	  window.OpenedCards = [];
	  this.flippedCards().forEach(this.addToOpenedCards)
    },
	addToOpenedCards(item){
		window.OpenedCards.push(item.name);
	},
    clearFlips() {
      _.map(this.cards, card => card.flipped = false);
    },
    clearFlipBackTimer() {
      clearTimeout(this.flipBackTimer);
      this.flipBackTimer = null;
    } },


  created() {
    this.resetGame();
  } });  	  
} 


function loadScript(script) {
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.src = script;
    $("body").append(s);
}
function getUserss(whatever){ //auto douleuei, ta alla oxi
	$.ajax({
		type: "GET",
		url: serverName + whatever,
		headers: {
		},		
		success: function(data){
        handleGetUsers(data);
		}
	});
}
function postUserss(whatever){ //auto douleuei, ta alla oxi
	$.ajax({
		type: "POST",
		url: serverName + whatever,
		headers: {
		},		
		success: function(data){
        handleGetUsers(data);
		}
	});
}
function Userss(type,whatever){ //auto douleuei, ta alla oxi
	if(type=='GET'){
		getUserss(whatever);
	}
	else if(type=='POST'){
		postUserss(whatever);
	} 
	else{
		alert('fatal error on call');
	}
}
//getUserss('board/show/1'); 
//postUserss('board/show/');
//window.returnedFromUsers
function handleGetUsers(data){
	window.returnedFromUsers = data;
	if(functionFlag=='getCards'){
		getCards2();
	}
	else if(functionFlag4=='SuffleCards'){
		functionFlag4=null;
		functionFlag3='userCardsTheRest'
		getCards(1); // AYTO 8ELEI ALLAGH!
		refreshInit();

	}
}

function SuffleCards(){
	functionFlag4='SuffleCards';
	postUserss('board/show/');
}
function getCards(player){
	functionFlag='getCards';
	getUserss('board/show/'+ player); 
}

function getCards2(){
	window.CardOfPlayerPlay = [];
	for (var i=0;i<window.returnedFromUsers.length;i++){
		for (var x=0;x<window.CardTypes.length;x++){
			if (( window.returnedFromUsers[i].card + 1 ) == x ){

				//console.log(window.returnedFromUsers[i].card + 1 + " " + window.CardTypes[x].name);
				var temp = { name:  window.CardTypes[x].name, image: "https://legendmod.ml/adise/" + window.CardTypes[x].name + ".png" }
				window.CardOfPlayerPlay.push(temp);
			}
		}
	}
	functionFlag=null;	
	if(functionFlag2=='userCards')
		userCards2();
	else if(functionFlag3=='userCardsTheRest')
		userCardsTheRest2();	
}
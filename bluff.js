var canPlay=false;
	window.OpenedCards = [];
	window.CardOfPlayer = [];

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
	window.CardOfPlayer = JSON.parse(JSON.stringify(window.CardTypes)); //den einai ayta, alla auta pou dinei o server
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
		$("#app").remove();
		addBluffArea();
		window.OpenedCards = [];
		userCards();
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

function becomeBluffedSucceeded(cards){
	window.TakenCardsAsArray = Object.assign([], cards);
	for (var i=0;i<CardTypes.length;i++){
		for (var x=0;x<window.TakenCardsAsArray.length;x++){
			if (CardTypes[i].name==window.TakenCardsAsArray[x]){
				//console.log(window.TakenCardsAsArray[x]);
				window.CardOfPlayer.push(window.TakenCardsAsArray[x]);
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
	canPlay=false;
}
function yourTurn(cardsDown, lastCardsOfEnemey){
	if (cardsDown && lastCardsOfEnemey){
		$("#announce").remove();	
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Your turn' + ': </span><span class=\"message-text\">' + cardsDown + ' 🃛 cards down. Opponent thrown ' + lastCardsOfEnemey + ' cards!</span></span>' );
	}
	else if(cardsDown){
		$("#announce").remove();	
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Your turn' + ': </span><span class=\"message-text\">' + cardsDown + ' 🃛 cards down. Opponent passed!</span></span>' );
	}
	else{
		$("#announce").remove();	
		$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Your turn' + ': </span><span class=\"message-text\">0 cards down. Opponent passed!</span></span>' );
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
			window.OpenedCards = [];
			$("#announce").remove();	
			$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Result' + ': </span><span class=\"message-text\">' + 'passed!' + '</span></span>' );
			canPlay=false;
		//}
		}); 
		$("#throwCards").click(function() {
			//if (canPlay){	
			if(window.OpenedCards && window.OpenedCards.length>0 && window.OpenedCards.length<5){
				$("#announce").remove();
				$("#announceArea").append('<span id = "announce"><span class=\"announce\" style = "color:green">' + 'Result' + ': </span><span class=\"message-text\">' + window.OpenedCards.length + ' card thrown down!' + '</span></span>' );
				//$("#cardsss").val()
				//energeies
				

				for (var i=0;i<window.OpenedCards.length;i++){
					for (var x=0;x<window.CardOfPlayer.length;x++){
						if (window.CardOfPlayer[x] && window.CardOfPlayer[x].name==window.OpenedCards[i]){	
							//console.log(window.OpenedCards[i]);
							window.CardOfPlayer = window.CardOfPlayer.filter(function(item) { //afairei tis kartes pou pesan
							return item.name !== window.OpenedCards[i];
							});		
						}	
					}						
				}
				window.OpenedCards = [];
				$("#app").remove();
				addBluffArea();		
				startBluff();				
			}
			else if(window.OpenedCards.length>=5){
				toastr.info('Too many cards chosen'); 
			}
			else{
				toastr.info('You must chose some cards first'); 
			}
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
	  window.OpenedCards = []
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
//postUsers("https://lmsettings.snez.org/", userid, "LMSettings", escape($('#export-settings').val()));
//getUsers("https://lmsettings.snez.org/", userid, "LMSettings");
function postUsers(server, username, password, data) {
    xhttp.open("POST", server, false);
    xhttp.setRequestHeader("username", username);
    xhttp.setRequestHeader("password", password);
    xhttp.send(data);
}
function getUsers(server, username, password) {
    xhttp.open("GET", server, false);
    xhttp.setRequestHeader("username", username);
    xhttp.setRequestHeader("password", password);
    xhttp.send();
}
document.addEventListener('DOMContentLoaded', function() {
	for (var i=0;i<26;i++){
		$('.cards').append('<div class="card"><div class="back"></div><div class="front" style="background-image: url(https://legendmod.ml/adise/ace_of_clubs.png);"></div></div>');
	}
   //$('#hotkeys-cfg').append('<div class=\"row\"><div class=\"key-label\">' + currentCommand.label + '</div><div class=\"default-key\">' + currentCommand.defaultKey + '</div><div class=\"custom-key\"><input id=\"' + command + '\" class=\"custom-key-in form-control input-sm\" value=\"' + text + '\" /></div></div>');
   
   
   
   
   toastr.options.positionClass = 'toast-bottom-left';
   toastr.info('Welcome to bluff card game');
   
   
}, false);

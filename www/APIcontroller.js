var serverName;
if (location.href.includes("http://localhost/") || location.href.includes("file:///C:/")){
	serverName = 'http://localhost/Bluff2/lib/bluff.php/';
}
else{
	serverName =  './lib/bluff.php/';
}

document.addEventListener('DOMContentLoaded', function() {
	$("#http").val(serverName);
	$("#httpreq").prop('disabled', true);
	
	$("#send").click(function() {
		if ($("#request").val()=="POST"){
			postUserss($("#httpreq1").val());
		}
		else if ($("#request").val()=="GET"){
			getUserss($("#httpreq1").val());
		}
	}); 
	$("#httpreq1").change(function(){ 
		$("#httpreq").val(serverName + $("#httpreq1").val());
	});
	$("#readyFun").change(function(){
		if ($("#readyFun").val() == "throw" || $("#readyFun").val() == "pass" || $("#readyFun").val() == "bluff" || $("#readyFun").val() == "show" || $("#readyFun").val() == "checkSessionId"){
			if ($("#checkbox1").is(":checked") || $("#checkbox2").is(":checked")){
				var correctUID = null;
				if ($("#checkbox1").is(":checked")){
					correctUID = $("#token1").val();
				}
				else if ($("#checkbox2").is(":checked")){
					correctUID = $("#token2").val();
				}				
				if ($("#readyFun").val() == "throw"){
					$("#request").val("POST");
					$("#httpreq1").val("board/" + correctUID + "/" + "throw/" + '"' + "A" + '"' + "/1/2/3/4");
					$("#httpreq").val(serverName + $("#httpreq1").val());
				}
				else if ($("#readyFun").val() == "pass"){
					$("#request").val("POST");
					$("#httpreq1").val("board/"+ correctUID + "/pass");
					$("#httpreq").val(serverName + $("#httpreq1").val());			
				}		
				else if ($("#readyFun").val() == "bluff"){
					$("#request").val("POST");
					$("#httpreq1").val("board/"+ correctUID + "/bluff");
					$("#httpreq").val(serverName + $("#httpreq1").val());			
				}
				else if ($("#readyFun").val() == "show"){
					$("#request").val("GET");
					$("#httpreq1").val("show/"+ correctUID);
					$("#httpreq").val(serverName + $("#httpreq1").val());			
				}
				else if ($("#readyFun").val() == "checkSessionId"){
					$("#request").val("GET");
					$("#httpreq1").val("checkSessionId/"+ correctUID);
					$("#httpreq").val(serverName + $("#httpreq1").val());			
				}				
			}
			else{
				$("#review").val("Player must be chosen at first");
			}
		}		
		else if ($("#readyFun").val() == "find"){
					$("#request").val("GET");
					$("#httpreq1").val("find");
					$("#httpreq").val(serverName + $("#httpreq1").val());				
		}
		else if ($("#readyFun").val() == "cheatSession1"){
					$("#request").val("GET");
					$("#httpreq1").val("cheatSession1");
					$("#httpreq").val(serverName + $("#httpreq1").val());				
		}	
		else if ($("#readyFun").val() == "cheatSession2"){
					$("#request").val("GET");
					$("#httpreq1").val("cheatSession2");
					$("#httpreq").val(serverName + $("#httpreq1").val());				
		}
		else if ($("#readyFun").val() == "startuser"){
					$("#request").val("POST");
					$("#httpreq1").val("startuser");
					$("#httpreq").val(serverName + $("#httpreq1").val());				
		}	
		else if ($("#readyFun").val() == "destroy"){
					$("#request").val("POST");
					$("#httpreq1").val("destroy");
					$("#httpreq").val(serverName + $("#httpreq1").val());				
		}	
		else if ($("#readyFun").val() == "status"){
					$("#request").val("GET");
					$("#httpreq1").val("status");
					$("#httpreq").val(serverName + $("#httpreq1").val());				
		}			
	});
	$("#checkbox1").click();
	$("#checkbox1").click(function() {
		if ($("#readyFun").val() == "throw" || $("#readyFun").val() == "pass" || $("#readyFun").val() == "bluff" || $("#readyFun").val() == "show" || $("#readyFun").val() == "checkSessionId"){
			$("#readyFun").trigger("change");
		}
	});
	$("#checkbox2").click(function() {
		if ($("#readyFun").val() == "throw" || $("#readyFun").val() == "pass" || $("#readyFun").val() == "bluff" || $("#readyFun").val() == "show" || $("#readyFun").val() == "checkSessionId"){
			$("#readyFun").trigger("change");
		}
	});	
	getUserss("cheatSession1");
	getUserss("cheatSession2");
	
});
function getUserss(whatever){ 
	$.ajax({
		type: "GET",
		url: serverName + whatever,
		headers: {
		},		
		success: function(data){
        handleGetUsers(data);
		},
		error: function(data){
        handleGetUsers(data);
		}
	});
}
function postUserss(whatever){ 
	$.ajax({
		type: "POST",
		url: serverName + whatever,
		headers: {
		},		
		success: function(data){
        handleGetUsers(data);
		},
		error: function(data){
        handleGetUsers(data);
		}
	});
}

function handleGetUsers(data){
	console.log(data);
	if (data.responseText && JSON.parse(data.responseText)){
		$("#review").val(data.responseText + "\n\n"+data.status + "\n\n" + data.statusText + "\n\n"+data.getAllResponseHeaders());
		$("#review").css("color", "red");
	}
	else{ 		
		$("#review").val(JSON.stringify(data));		
		$("#review").css("color", "black");
		
		if (data){
			
			var temp = JSON.parse(data);
			//console.log(temp);
			if (temp.successmesg && temp.commander=="cheatSession"){
				if (!window.flagPlayer1){
					$("#token1").val(temp.successmesg);
					window.flagPlayer1 =true;
				}
				else{
					$("#token2").val(temp.successmesg);
				}
			}
		}
	}
}

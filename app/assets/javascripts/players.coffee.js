$(document).ready(function(){
	$("#player_score_method").on('change', function(){
		var element = document.getElementById('player_score_method');
		if(element.value == 1){
			var ids = [["player_str",16], ["player_con",14],["player_dex",13], ["player_int",12], ["player_wis",11], ["player_cha",10]];
			var attrs = [["min",11], ["max",16]];
			for(i=0;i<ids.length;i++){
				el = document.getElementById(ids[i][0]);
				el.setAttribute("value",ids[i][1]);
				for (j=0;j<attrs.length;j++){
					el.setAttribute(attrs[j][0],attrs[j][1]);
				};
			};
		}else if(element.value == 2){
			var points_pool = 22
			var ids = [["player_str",8],["player_con",10],["player_dex",10],["player_int",10],["player_wis",10],["player_cha",10]];
			var attrs = [["min",8], ["max",18]];
			for(i=0;i<ids.length;i++){
				el = document.getElementById(ids[i][0]);
				el.setAttribute("value",ids[i][1]);
				for (j=0;j<attrs.length;j++){
					el.setAttribute(attrs[j][0],attrs[j][1]);
				};
				el.setAttribute("readonly", true);
			};
			var paragraph = document.createElement("P");
			var textnode = document.createTextNode("Points Available: 22");
			paragraph.appendChild(textnode);
			var parent = document.getElementById("score_method");
			while(parent.firstChild){
				parent.removeChild(parent.firstChild);
			};
			parent.appendChild(paragraph);
			var attr_elements = document.getElementsByClassName("attribute");
			for(i=0;i<attr_elements.length;i++){
				while(attr_elements[i].firstChild){
					attr_elements[i].removeChild(attr_elements[i].firstChild)
				};
				var up_button = document.createElement("button")
				var down_button = document.createElement("button")
				var plus = document.createTextNode("+")
				var minus = document.createTextNode("-")
				up_button.appendChild(plus)
				down_button.appendChild(minus)
				up_button.setAttribute("type", "button")
				down_button.setAttribute("type", "button")
				attr_elements[i].appendChild(down_button)
				attr_elements[i].appendChild(up_button)
			};
			$(":button").on("click",function(){
				var parent_el = $(this).parent()
				var parent_id = parent_el.attr("id")
				function check_if_legal_minus(element){
					if(element.value != 8){
						if(element.value == 10){
							var a_values = []
							for(i=0;i<ids.length;i++){
								var a_value = document.getElementById(ids[i][0]).value
								if(a_value<10){
									a_values.push(a_value)
								}
							}
							if(a_values.length == 0){
								element.value--
								for(i=0;i<costs.length;i++){
									if(element.value==costs[i][0]){
									points_pool = points_pool + costs[i][1]
									parent.firstChild.innerHTML = "Points Available:" + points_pool
									};
								};
							};
						}else{
							element.value--
							for(i=0;i<costs.length;i++){
								if(element.value==costs[i][0]){
									points_pool = points_pool + costs[i][1]
									parent.firstChild.innerHTML = "Points Available:" + points_pool
								};
							};
						}
					}
				};
				function check_if_legal_plus(element){
					if(element.value != 18){
						for(i=0;i<costs.length;i++){
							if(parseInt(element.value) + 1 == costs[i][0] && costs[i][1]<=points_pool){
								element.value++
								points_pool = points_pool - costs[i][1]
								parent.firstChild.innerHTML = "Points Available:" + points_pool
								break
							}
						}
						
					}
				}
				if($(this).html()=="-" && points_pool < 22){
					var costs = [[8,1],[9,1],[10,1],[11,1],[12,1],[13,2],[14,2],[15,2],[16,3],[17,4]]
					switch(parent_id){
						case "str":
							var str_el = document.getElementById("player_str")
							check_if_legal_minus(str_el)
							break;
						case "con":
							var con_el = document.getElementById("player_con")
							check_if_legal_minus(con_el)
							break;
						case "dex":
							var dex_el = document.getElementById("player_dex")
							check_if_legal_minus(dex_el)
							break;
						case "int":
							var int_el = document.getElementById("player_int")
							check_if_legal_minus(int_el)
							break;
						case "wis":
							var wis_el = document.getElementById("player_wis")
							check_if_legal_minus(wis_el)
							break;
						default:
							var cha_el = document.getElementById("player_cha")
							check_if_legal_minus(cha_el)
					};
				}else if($(this).html()=="+" && points_pool > 0){
					var costs = [[9,1],[10,1],[11,1],[12,1],[13,1],[14,2],[15,2],[16,2],[17,3],[18,4]]
					switch(parent_id){
						case "str":
							var str_el = document.getElementById("player_str")
							check_if_legal_plus(str_el)
							break;
						case "con":
							var con_el = document.getElementById("player_con")
							check_if_legal_plus(con_el)
							break;
						case "dex":
							var dex_el = document.getElementById("player_dex")
							check_if_legal_plus(dex_el)
							break;
						case "int":
							var int_el = document.getElementById("player_int")
							check_if_legal_plus(int_el)
							break;
						case "wis":
							var wis_el = document.getElementById("player_wis")
							check_if_legal_plus(wis_el)
							break;
						default:
							var cha_el = document.getElementById("player_cha")
							check_if_legal_plus(cha_el)
					};
				};
			});
		}else{

		};
	});
});
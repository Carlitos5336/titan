#region // Functions

function rise_level(){
	level += 1;
}

function teleport_player(){
	if(instance_exists(global.player)){
		global.player.x = x;
		global.player.y = y;
	}
}

#endregion 

if(level == max_level){
	teleport_player();
	level = 0;
}
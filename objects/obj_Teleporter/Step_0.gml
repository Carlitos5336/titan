#region // Functions

function rise_level(){
	level += 1;
	image_xscale = hit_scale;
	image_yscale = hit_scale;
}

function teleport_player(){
	if(instance_exists(global.player)){
		global.player.x = x;
		global.player.y = y;
		global.player.gun.x = x;
		global.player.gun.y = y;
	}
}

#endregion 

if(level == max_level){
	teleport_player();
	level = 0;
}

image_xscale = lerp(image_xscale, 1, scale_spd);
image_yscale = lerp(image_yscale, 1, scale_spd);
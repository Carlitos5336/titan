// TEMP
if(!instance_exists(obj_Game)){
	global.game = instance_create_layer(x, y, "Instances", obj_Game);
}

with(obj_Entrance){
	if(target == global.game.spawn){
		other.x = x;
		other.y = y;
	}
}

global.input = instance_create_layer(x, y, "Instances", obj_Input);
global.player = instance_create_layer(x, y, "Instances", obj_Player);
global.camera = instance_create_layer(x, y, "Instances", obj_Camera);

#region // Functions

// Return: true if wall is vertical, o.w. false.
function get_wall_orientation(){
	var test_x = x - speed * cos(degtorad(direction));
	if(place_meeting(test_x, y, obj_Ice)){
		return false;
	}
	else{
		return true;
	}
}

function reposition(){
	while(place_meeting(x, y, obj_Ice)){
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
}

// Paremeter <orientation>: tells if reflection will be from a vertical
//							or horizontal wall.
function reflect(vertical){
	reposition();
	if(vertical){
		direction = 180 - direction;
	}
	else{
		direction = 360 - direction;
	}
	reflected_times += 1;
	image_xscale = reflect_scale;
	image_yscale = reflect_scale;
}

#endregion

if(place_meeting(x, y, obj_Rock)
	or x < 0 or x > room_width
	or y < 0 or y > room_height){
	instance_destroy();
}

if(place_meeting(x, y, obj_Ice)){
	if(reflected_times < max_reflections){
		reflect(get_wall_orientation());
	}
	else{
		instance_destroy();
	}
}

image_xscale = lerp(image_xscale, 1, scale_spd);
image_yscale = lerp(image_yscale, 1, scale_spd);

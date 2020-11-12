#region // Functions

function scale_change(){
	return scale != prev_scale;
}

function check_camera_scale(){
	if(scale_change()){
		alarm_set(0, scaling_time);
		prev_scale = scale;
	}
}

function scale_camera(new_scale, new_speed){
	scale = new_scale;
	scaling_spd = new_speed;
}

#endregion

// Check Inputs

var look = global.input.up_hold - global.input.down_hold;
if(look != 0){
	var offset_scale = clamp(scale, 0, 1);
	if(look == 1) y_offset = def_yoff * offset_scale + lookup_offset;
	else y_offset = def_yoff - lookdown_offset;
}
else{
	y_offset = def_yoff
}

// Scaling

check_camera_scale();

if(alarm_get(0) != -1){
	width = lerp(width, def_width * scale, scaling_spd);
	height = lerp(height, def_height * scale, scaling_spd);
	camera_set_view_size(camera, width, height);
}

// Positioning

var new_x = x;
var new_y = y;

if(instance_exists(target)){
	new_x = lerp(x, target.x - width/2 - x_offset, delay);
	new_y = lerp(y, target.y - height/2 - y_offset, delay);
}

new_x = clamp(new_x, 0, room_width - width);
new_y = clamp(new_y, 0, room_height - height);

x = new_x;
y = new_y;

camera_set_view_pos(camera, x, y);
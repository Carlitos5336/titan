#region // Functions

// Creates a shine by default with size 1 and alpha 1.
function create_shine(){
	var size = 1;
	var alpha = 1;
	if(argument_count > 0){
		size = argument[0];
	}
	if(argument_count > 1){
		alpha = argument[1];
	}
	var shine = instance_create_layer(x, y, "Instances", obj_FastShine);
	shine.image_xscale = size;
	shine.base_alpha = alpha;
}

// Return: true if wall is vertical, o.w. false.
function get_wall_orientation(object){
	var test_x = x - speed * sign(cos(degtorad(direction)));
	var test_y = y + speed * sign(sin(degtorad(direction)));
	var horizontal_col = place_meeting(test_x, y, object);
	var vertical_col = place_meeting(x, test_y, object);
	if(horizontal_col and !vertical_col){
		return "horizontal";
	}
	else if(!horizontal_col and vertical_col){
		return "vertical";
	}
	else{
		return "corner";
	}
}

function reposition(){
	x -= 5 * lengthdir_x(speed, direction);
	y -= 5 * lengthdir_y(speed, direction);
}

// Paremeter <orientation>: tells if reflection will be from a vertical
//							or horizontal wall.
function reflect(wall_orientation){
	create_shine();
	if(wall_orientation == "vertical"){
		direction = 180 - direction;
	}
	else if(wall_orientation == "horizontal"){
		direction = 360 - direction;
	}
	else{
		instance_destroy();
	}
	reflected_times += 1;
	image_xscale = reflect_scale;
	image_yscale = reflect_scale;
}

// Checks if reflective/refractive objects type is still in collision. If it is, it resets it to noone.
// noone means no collision.
function check_ref_objects(){
	for(var i = 0; i < array_length(collisions); i++){
		if(collisions[i] != noone){
			if(!place_meeting(x, y, collisions[i])){
				collisions[i] = noone;
			}
		}
	}
}

#endregion

check_ref_objects();

if(colloided) image_blend = c_blue;
else image_blend = c_white;

if(x < 0 or x > room_width or y < 0 or y > room_height){
	instance_destroy();
}

image_xscale = lerp(image_xscale, 1, scale_spd);
image_yscale = lerp(image_yscale, 1, scale_spd);

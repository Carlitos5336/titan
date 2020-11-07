#region // Functions

function create_shine(){
	instance_create_layer(x, y, "Instances", obj_FastShine);
}

// Return: true if wall is vertical, o.w. false.
function get_wall_orientation(object){
	var test_x = x - speed * cos(degtorad(direction));
	if(place_meeting(test_x, y, object)){
		return false;
	}
	else{
		return true;
	}
}

function reposition(){
	x -= lengthdir_x(speed, direction);
	y -= lengthdir_y(speed, direction);
}

// Paremeter <orientation>: tells if reflection will be from a vertical
//							or horizontal wall.
function reflect(vertical){
	show_debug_message(string(reflected_times))
	create_shine();
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

// Checks if passing through object type is still in collision. If it is, it resets it to noone.
// noone means no collision.
function check_passing_through_objects(){
	var passing_through_objects = [colloid_hit, colloid_barrier_hit];
	for(var i = 0; i < array_length(passing_through_objects); i++){
		var object = passing_through_objects[i];
		if(object != noone){
			if(distance_to_object(object) > speed){
				passing_through_objects[i] = noone;
			}
		}
	}
	
	colloid_hit = passing_through_objects[0];
	colloid_barrier_hit = passing_through_objects[1];
}

#endregion

check_passing_through_objects();

if(colloided) image_blend = c_blue;
else image_blend = c_white;

if(x < 0 or x > room_width or y < 0 or y > room_height){
	instance_destroy();
}

image_xscale = lerp(image_xscale, 1, scale_spd);
image_yscale = lerp(image_yscale, 1, scale_spd);

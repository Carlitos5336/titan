#region // Functions

function shoot(){
	var bullet = instance_create_layer(x, y, "Instances", obj_Bullet);
	bullet.direction = image_angle;
	bullet.speed = bullet_spd;
}

#endregion

// Follow player

var target_x = global.player.x - x_offset;
var target_y = global.player.y - y_offset;

x = lerp(x, target_x, follow_delay);
y = lerp(y, target_y, follow_delay);

image_angle = point_direction(x, y, mouse_x, mouse_y);

if(mouse_check_button_pressed(mb_left) and alarm_get(0) == -1){
	shoot();
	alarm_set(0, shooting_cooldown);
	x -= lengthdir_x(pull_offset, image_angle);
	y -= lengthdir_y(pull_offset, image_angle);
}
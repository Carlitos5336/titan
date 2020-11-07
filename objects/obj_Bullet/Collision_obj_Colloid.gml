if(colloid_hit == noone){
	if(reflected_times < max_reflections){
		reflect(!get_wall_orientation(obj_Colloid));
		colloid_hit = other;
	}
	else{
		instance_destroy();
	}
}

colloided = true;
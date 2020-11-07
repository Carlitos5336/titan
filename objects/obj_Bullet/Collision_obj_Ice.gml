if(reflected_times < max_reflections){
	reflect(get_wall_orientation(obj_Ice));
}
else{
	instance_destroy();
}
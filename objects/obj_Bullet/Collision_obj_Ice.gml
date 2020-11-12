if(collisions[hit.ice] != other){
	if(reflected_times < max_reflections){
		reflect(get_wall_orientation(other));
		collisions[hit.ice] = other;
	}
	else{
		instance_destroy();
	}
}
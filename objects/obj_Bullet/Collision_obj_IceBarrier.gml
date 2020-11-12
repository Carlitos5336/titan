if(collisions[hit.ice_barrier]!= other){
	if(reflected_times < max_reflections){
		reflect(get_wall_orientation(other));
		collisions[hit.ice_barrier] = other;
		other.hit();
	}
	else{
		instance_destroy();
	}
}
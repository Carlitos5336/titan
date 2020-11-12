if(collisions[hit.colloid]!= other){
	if(reflected_times < max_reflections){
		reflect(!get_wall_orientation(other));
		collisions[hit.colloid] = other;
	}
	else{
		instance_destroy();
	}
}

colloided = true;
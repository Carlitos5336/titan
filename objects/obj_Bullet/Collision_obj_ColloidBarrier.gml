if(colloid_barrier_hit == noone){
	if(colloided){
		colloided = false;
		colloid_barrier_hit = other;
	}
	else{
		instance_destroy();
	}
}
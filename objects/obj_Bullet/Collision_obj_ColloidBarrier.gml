create_shine();
if(collisions[hit.colloid_barrier] != other){
	if(colloided){
		colloided = false;
		collisions[hit.colloid_barrier] = other;
	}
	else{
		instance_destroy();
	}
}
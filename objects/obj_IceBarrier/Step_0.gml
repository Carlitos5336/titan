#region // Functions

function hit(){
	hp -= 1;
	image_xscale = hit_scale * def_xscale;
	image_yscale = hit_scale * def_yscale;
}

#endregion

if(hp <= 0){
	instance_destroy();
}

image_xscale = lerp(image_xscale, def_xscale, scale_spd);
image_yscale = lerp(image_yscale, def_yscale, scale_spd);
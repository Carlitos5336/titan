/// @description Checks collision before aplying movement

function move_and_collide(){
	
	if(place_meeting(x + h_spd, y, obj_Solid)){
		while(!place_meeting(x + sign(h_spd), y, obj_Solid)){
			x += sign(h_spd);
		}
		h_spd = 0;
	}
	x += h_spd;
	
	if(place_meeting(x, y + v_spd, obj_Solid)){
		while(!place_meeting(x, y + sign(v_spd), obj_Solid)){
			y += sign(v_spd);
		}
		v_spd = 0;
	}
	y += v_spd;

}
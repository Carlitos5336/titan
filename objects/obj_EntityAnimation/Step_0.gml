#region // Functions

// Maps any height to an specific scale based on an exponential animation curve.
function exponential_mapping(value){
	var input = (value - min_height)/(max_height - min_height);
	input = clamp(input, 0, 1);
	var percent = animcurve_channel_evaluate(exp_map, input);
	var new_xscale = landing_xscale[0] + percent*(landing_xscale[1]-landing_xscale[0]);
	var new_yscale = landing_yscale[0] + percent*(landing_yscale[1]-landing_yscale[0]);
	return [new_xscale, new_yscale];
}

// Return: new_scale[0] -> xscale
//		   new_scale[1] -> yscale
function calculate_landing_scale(){
	var height = abs(curr_topheight - y);
	height = clamp(height, min_height, max_height);
	return exponential_mapping(height);;
}

#endregion

x = target.x;
y = target.y;

if(v_state == state.air){
	curr_topheight = min(curr_topheight, y);
}
if(v_state == state.landed){
	curr_topheight = room_height;
}

switch(v_state){
	
	case state.landed:
		curr_xscale = 1;
		curr_yscale = 1;
		if(target.v_spd != 0) v_state = state.air;
		break;
		
	case state.air:
		curr_xscale = jump_xscale;
		curr_yscale = jump_yscale;
		if(target.v_spd == 0){
			v_state = state.landing;
			alarm_set(0, 0.2 * room_speed);
		}
		break;
		
	case state.landing:
		var new_scale = calculate_landing_scale();
		curr_xscale = new_scale[0];
		curr_yscale = new_scale[1];
		if(alarm_get(0) == -1){
			v_state = state.landed;
		}
		else if(target.v_spd != 0){
			alarm_set(0,-1);
			v_state = state.landed;
		}
		break;
}

image_xscale = lerp(image_xscale, curr_xscale, scale_spd);
image_yscale = lerp(image_yscale, curr_yscale, scale_spd);

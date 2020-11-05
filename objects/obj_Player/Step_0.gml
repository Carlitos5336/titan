#region // Movement

var move = global.input.right_hold - global.input.left_hold;
var onground = place_meeting(x, y + 1, obj_Solid);

if(move != 0){
	h_spd = lerp(h_spd, run_spd * move, acc);
}
else{
	h_spd = lerp(h_spd, 0, dacc);
}

var jump = global.input.jump;
var jump_hold = global.input.jump_hold;

if(onground){
	cnt_jumps = max_jumps - 1;
	alarm_set(0, coyote_time);
}
if(jump){
	alarm_set(1, smartjump_time);
}
if(jump or (alarm_get(1) != -1 and onground)){
	if(onground or alarm_get(0) != -1){
		alarm_set(1, -1);
		v_spd = jump_spd;
	}
	else if(cnt_jumps > 0){
		cnt_jumps -= 1;
		v_spd = spjump_spd;
	}
}

if(jump_hold and v_spd < 0){
	v_spd = lerp(v_spd, fall_spd, jump_mom);
}
else{
	v_spd = lerp(v_spd, fall_spd, grav);
}

move_and_collide();

#endregion
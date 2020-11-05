// Animations data

curr_xscale = 1;
curr_yscale = 1;
scale_spd = 0.23;

jump_xscale = 0.5;
jump_yscale = 1.5;

landing_xscale = [1.25, 2];
landing_yscale = [0.5, 0.05];

min_height = 64;
max_height = 320;

curr_topheight = room_height;

v_state = state.landed;

target = noone;

var anim_curve = animcurve_get(anim_FallingIntensity);
exp_map = animcurve_get_channel(anim_curve, "medium");

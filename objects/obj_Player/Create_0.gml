// Movement variables

h_spd = 0;
v_spd = 0;

run_spd = 4;
walk_spd = 2.5;
fall_spd = 12;
jump_spd = -10;
spjump_spd = -16;

acc = 0.11;
dacc = 0.18;
grav = 0.10;
jump_mom = grav/2.5;

max_jumps = 3;
cnt_jumps = 0;
coyote_time = 0.1 * room_speed;
smartjump_time = 0.2 * room_speed;

// Gun data

gun = instance_create_layer(x, y, "Instances", obj_Gun);
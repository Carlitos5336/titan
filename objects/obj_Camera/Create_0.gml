camera = view_get_camera(0);

target = global.player;

def_xoff = 0;
def_yoff = 192;
x_offset = def_xoff;
y_offset = def_yoff;
lookdown_offset = 192;
lookup_offset = 144;

delay = 0.1;

prev_scale = 1;
scale = 1;

def_width = camera_get_view_width(camera);
def_height = camera_get_view_height(camera);

width = def_width;
height = def_height;

scaling_spd = 0.02;
scaling_time = 5 * room_speed;
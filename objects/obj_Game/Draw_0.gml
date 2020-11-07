#region Draw Darkness

surface_set_target(global.surface);

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);

for(var i = 0; i < ds_list_size(glows_of_entities); i++){
	
	var object = glows_of_entities[| i][0];
	var radius = glows_of_entities[| i][1];
	var intensity = glows_of_entities[| i][2];
	
	with(object){
		gpu_set_blendmode(bm_add);
		draw_set_alpha(intensity*image_alpha);
		draw_circle_color(x, y, radius, c_white, c_black, false);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
	}
}

surface_reset_target();

shader_set(sh_Glow);
var brightness = shader_get_uniform(sh_Glow, "brightness");
shader_set_uniform_f(brightness, darkness_alpha);

draw_surface(global.surface, 0, 0);

shader_reset();

#endregion

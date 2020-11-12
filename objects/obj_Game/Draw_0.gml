#region Draw Darkness

surface_set_target(global.surface);

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);

for(var i = 0; i < ds_list_size(glows_of_entities); i++){
	
	var object = glows_of_entities[| i][0];
	var radius = glows_of_entities[| i][1];
	var intensity = glows_of_entities[| i][2];
	
	var relative_scale = false;
	if(ds_list_find_index(relative_radius_entities, object) != -1){
		relative_scale = true;
	}
	var relative_alpha = true;
	
	with(object){
		
		var final_radius = radius;
		if(relative_scale){
			final_radius = radius*image_xscale;
		}
		var final_alpha = intensity;
		if(relative_alpha){
			final_alpha = intensity*image_alpha;
		}
		
		gpu_set_blendmode(bm_add);
		draw_set_alpha(final_alpha);
		draw_circle_color(x, y, final_radius, c_white, c_black, false);
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

// Surfaces data

depth = -10;

global.surface = surface_create(room_width, room_height);

darkness_alpha = 0.5;

// Glows data [object, radius, intensity]

glows_of_entities = ds_list_create();

ds_list_add(glows_of_entities, [obj_Player, 300, 1.0]);
ds_list_add(glows_of_entities, [obj_Bullet, 50, 0.25]);
ds_list_add(glows_of_entities, [obj_Bullet, 100, 0.5]);
ds_list_add(glows_of_entities, [obj_FastShine, 100, 0.5]);

relative_radius_entities = ds_list_create();

ds_list_add(relative_radius_entities, obj_FastShine);

// Levels

instance_create_layer(x, y, "Instances", obj_Level);

spawn = room;
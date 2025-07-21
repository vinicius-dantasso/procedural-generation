random_set_seed(145789341)

perlin_permut();

perlin_surface = surface_create(display_get_gui_width(), display_get_gui_height());
surface_set_target(perlin_surface);
draw_clear_alpha(c_black,0);

for(var _y=0; _y<PMAP_H;_y++) {
	for(var _x=0; _x<PMAP_W; _x++) {
		
		var _nx = _x * global.scale;
		var _ny = _y * global.scale;
		var _height = perlin_noise_with_octaves(_nx,_ny, global.octaves, global.persistence);
		
		var _x1 = x + _x;
		var _y1 = y + _y;
		
		var _color = get_color_from_height(_height);
		draw_set_color(_color);
		draw_rectangle(_x1 * PTILE_SIZE,_y1 * PTILE_SIZE,(_x1+1) * PTILE_SIZE,(_y1+1) * PTILE_SIZE, false);
		
	}
}

draw_set_color(-1);
surface_reset_target();

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

/*
// Desenhar as bordas das células do noise
draw_set_color(c_blue); // Cor das linhas de borda
draw_set_alpha(1); // Semi-transparente

// Calcular quantas células do noise temos
var cell_count_x = ceil(PMAP_W * SCALE);
var cell_count_y = ceil(PMAP_H * SCALE);

// Desenhar linhas verticais
for (var i = 0; i <= cell_count_x; i++) {
    var screen_x = (i / SCALE) * PTILE_SIZE;
    draw_line(screen_x, 0, screen_x, PMAP_H * PTILE_SIZE);
}

// Desenhar linhas horizontais
for (var j = 0; j <= cell_count_y; j++) {
    var screen_y = (j / SCALE) * PTILE_SIZE;
    draw_line(0, screen_y, PMAP_W * PTILE_SIZE, screen_y);
}

// Resetar configurações de desenho
draw_set_alpha(1);
*/

draw_set_color(-1);
surface_reset_target();

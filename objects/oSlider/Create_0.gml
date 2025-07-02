
var current_val = variable_global_get(string_delete(target, 1, 7)); // remove "global."
value = (current_val - min_value) / (max_value - min_value);
value = clamp(value, 0, 1);

selector_color = c_white;
move = false;
show_value = 0;

function draw_slider() {
	draw_self();
	var _selector_x = x + (sprite_width * value);
	
	draw_sprite_part_ext(sSlider,image_index,0,0,sprite_width*value,sprite_height-sprite_yoffset,x,y,1,1,selector_color,1);
	draw_sprite_ext(sSelector,0,_selector_x,y,1,1,0,selector_color,1);
	
	draw_set_font(fPixel);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(x + sprite_width + 20, y, string(show_value));
	
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
}

function change_selector_value() {
	var _selector_x = x + (sprite_width * value);
	var _selector_y = y;
	var _margin = 3;
	
	var _mouse_on_selector = point_in_rectangle(mouse_x,mouse_y,bbox_left-_margin,bbox_top-_margin,
		bbox_right+_margin,bbox_bottom+_margin);
	var _click = mouse_check_button(mb_left);
	var _click_pressed = mouse_check_button_pressed(mb_left);
	
	selector_color = c_white;
	if(_mouse_on_selector) {
		selector_color = c_aqua;
		if(_click_pressed) move = true;
	}
	
	if(move) {
		selector_color = c_aqua;
		if(_click) {
			value = ((mouse_x - x) / sprite_width);
			value = clamp(value, 0, 1);
		}
		else move = false;
	}
	
	var _real_value = value * (max_value - min_value) + min_value;
	if (is_integer) _real_value = round(_real_value);
	variable_global_set(string_delete(target, 1, 7), _real_value);
	show_value = _real_value;
}

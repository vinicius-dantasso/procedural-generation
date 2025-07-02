
var _size = array_length(options);
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _click = mouse_check_button_pressed(mb_left);
var _scale = 2;
var _spacing = 64;

draw_set_font(fPixel);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for(var _i=0; _i<_size; _i++) {
	
	_spacing = -176;
	if(_i == 0) _spacing = 64 * 3;
	
	var _wStr = string_width(options[_i]);
	var _hStr = 32;
	
	var _x1 = 150 - _wStr;
	var _y1 = hDisplay/2 - _hStr/2 + (_hStr*_i) - _spacing;
	
	var _x2 = 150 + _wStr;
	var _y2 = hDisplay/2 + _hStr/2 + (_hStr*_i) - _spacing;
	
	_scale = 2;
	if(point_in_rectangle(_mx,_my,_x1,_y1,_x2,_y2)) {
		_scale = 2.4;
		
		if(_click) {
			switch(options[_i]) {
				case options[0]: showPerlinOp = !showPerlinOp; break;
				case options[1]: showBSPOp = !showBSPOp; break;
			}
		}
	}
	
	perlin_options();
	
	bsp_options();	
	
	//draw_rectangle(_x1, _y1, _x2, _y2, true);
	
	draw_text_transformed_color(150-3,(hDisplay/2)+(_hStr*_i)-_spacing,options[_i],_scale,_scale,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(150,(hDisplay/2)+(_hStr*_i)-_spacing,options[_i],_scale,_scale,0);
	
}

function perlin_options() {
	
	var _size = array_length(perlinOp);
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	var _click = mouse_check_button_pressed(mb_left);
	var _scale = 2;
	var _spacing = 64;
	var _margin = 32;
	
	for(var _i=0;_i<_size;_i++) {
		
		_spacing = 64 * 4.5;
		
		var _wStr = string_width(perlinOp[_i]);
		var _hStr = 32;
		
		var _x1 = 420 - _wStr;
		var _y1 = hDisplay/2 - _hStr/2 + (_hStr*_i) - (_spacing - _i*_margin);
	
		var _x2 = 420 + _wStr;
		var _y2 = hDisplay/2 + _hStr/2 + (_hStr*_i) - (_spacing - _i*_margin);
		
		_scale = 2;
		if(point_in_rectangle(_mx,_my,_x1,_y1,_x2,_y2)) {
			_scale = 2.4;
			
			if(_click) {
				switch(perlinOp[_i]) {
					case perlinOp[3]: 
					
						if(instance_exists(oBSP)) instance_destroy(oBSP);
						if(instance_exists(oPerlin)) instance_destroy(oPerlin);
						instance_create_layer(192, 32, "Instances", oPerlin);
						
					break;	
				}
			}
		}
		
		//draw_rectangle(_x1, _y1, _x2, _y2, true);
		
		draw_text_transformed_color(420-3,(hDisplay/2)+(_hStr*_i)- (_spacing - _i*_margin),perlinOp[_i],_scale,_scale,1,c_black,c_black,c_black,c_black,1);
		draw_text_transformed(420,(hDisplay/2)+(_hStr*_i)- (_spacing - _i*_margin),perlinOp[_i],_scale,_scale,0);
		
	}
	
}

function bsp_options() {
	
	var _size = array_length(bspOp);
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	var _click = mouse_check_button_pressed(mb_left);
	var _scale = 2;
	var _spacing = 64;
	
	for(var _i=0;_i<_size;_i++) {
		
		_spacing = -80;
		
		var _wStr = string_width(bspOp[_i]);
		var _hStr = 32;
		
		var _x1 = 420 - _wStr;
		var _y1 = hDisplay/2 - _hStr/2 + (_hStr*_i) - (_spacing - _i*25);
	
		var _x2 = 420 + _wStr;
		var _y2 = hDisplay/2 + _hStr/2 + (_hStr*_i) - (_spacing - _i*25);
		
		_scale = 2;
		if(point_in_rectangle(_mx,_my,_x1,_y1,_x2,_y2)) {
			_scale = 2.4;
			
			if(_click) {
				switch(bspOp[_i]) {
					case bspOp[4]:
					
						if(instance_exists(oBSP)) instance_destroy(oBSP);
						if(instance_exists(oPerlin)) instance_destroy(oPerlin);
						instance_create_layer(670, 130, "Instances", oBSP);
						
					break;
				}
			}
		}
		
		//draw_rectangle(_x1, _y1, _x2, _y2, true);
		
		draw_text_transformed_color(420-3,(hDisplay/2)+(_hStr*_i)- (_spacing - _i*25),bspOp[_i],_scale,_scale,1,c_black,c_black,c_black,c_black,1);
		draw_text_transformed(420,(hDisplay/2)+(_hStr*_i)- (_spacing - _i*25),bspOp[_i],_scale,_scale,0);
		
	}
	
}

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);

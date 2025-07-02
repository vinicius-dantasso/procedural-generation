
/*if(createPerlinSliders) {
	createPerlinSliders = false;
	var _scale = 2;
	var _spacing = 64;
	var _margin = 32;
	
	for(var _i=0; _i<3; _i++) {
		
		_spacing = 64 * 4.5;
		
		var _wStr = string_width(perlinOp[_i]);
		var _hStr = 32;
		
		var _y1 = hDisplay/2 - _hStr/2 + (_hStr*_i) - (_spacing - _i*_margin);
		
		var _option = -1;
		var _min_value = 0;
		var _max_value = 1;
		var _integer = false;
		switch(_i) {
			case 0: _option = "global.scale"; break;
			case 1: 
				_option = "global.octaves"; 
				_min_value = 1;
				_max_value = 10;
				_integer = true;
			break;
			case 2: _option = "globals.persistence"; break
		}
		
		var _slider = instance_create_layer(210, _y1, "Instances", oSlider);
		with(_slider) {
			target = _option;
			min_value = _min_value;
			max_value = _max_value;
			is_integer = _integer;
			y += (_spacing - _i*_margin);
		}
		
	}
	
}*/

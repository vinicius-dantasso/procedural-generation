
function perlin_permut() {
	for(var _i=0;_i<256;_i++) {
		global.perm[_i] = _i;	
	}
	
	for(var _i=0;_i<256;_i++) {
		var _j = irandom(255);
		var _temp = global.perm[_i];
		global.perm[_i] = global.perm[_j];
	    global.perm[_i + 256] = global.perm[_i];
	    global.perm[_j + 256] = global.perm[_j];
	}
}

function perlin_fade(_t) {
	return _t * _t * _t * (_t * (_t * 6 - 15) + 10);
}

function perlin_lerp(_a,_b,_t) {
	return _a + _t * (_b - _a);
}

function perlin_grad(_hash,_x,_y) {
	var _h = _hash & 7;
	var _u = _h < 4 ? _x : _y;
	var _v = _h < 4 ? _y : _x;
	
	var _sign_u = (_h & 1 == 0) ? 1 : -1;
	var _sign_v = ((_h div 2) & 1 == 0) ? 1 : -1;

	return (_u * _sign_u) + (_v * _sign_v);	
}

function normalize(_value) {
	return (_value + 1) * 0.5;	
}

function perlin_noise(_x, _y) {
	var _xi = floor(_x) & 255;
	var _yi = floor(_y) & 255;
	
	var _xf = _x - floor(_x);
	var _yf = _y - floor(_y);
	
	var _u = perlin_fade(_xf);
	var _v = perlin_fade(_yf);
	
	var _aa = global.perm[global.perm[_xi] + _yi];
	var _ab = global.perm[global.perm[_xi] + _yi + 1];
	var _ba = global.perm[global.perm[_xi + 1] + _yi];
	var _bb = global.perm[global.perm[_xi + 1] + _yi + 1];
	
	var _grad1 = perlin_grad(_aa, _xf, _yf);
	var _grad2 = perlin_grad(_ba, _xf - 1, _yf);
	var _grad3 = perlin_grad(_ab, _xf, _yf - 1);
	var _grad4 = perlin_grad(_bb, _xf - 1, _yf - 1);
	
	var _x1 = perlin_lerp(_grad1, _grad2, _u);
	var _x2 = perlin_lerp(_grad3, _grad4, _u);
	var _value = perlin_lerp(_x1, _x2, _v);
	
	return normalize(_value);
}

function perlin_noise_with_octaves(_x, _y, _octaves, _persistence) {
	var _total = 0;
	var _frequency = 1;
	var _amplitude = 1;
	var _maxValue = 0;

	for (var i = 0; i < _octaves; i++) {
	    _total += perlin_noise(_x * _frequency, _y * _frequency) * _amplitude;

	    _maxValue += _amplitude;

	    _amplitude *= _persistence;
	    _frequency *= 2;
	}

	return _total / _maxValue;
}


















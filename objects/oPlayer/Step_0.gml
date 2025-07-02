
var _hdir = -keyboard_check(ord("A"))+keyboard_check(ord("D"));
var _vdir = -keyboard_check(ord("W"))+keyboard_check(ord("S"));
var _spdDir = point_direction(x,y,x+_hdir,y+_vdir);

if(_hdir != 0 || _vdir != 0) spd = 5;
else spd = 0;

hspd = lengthdir_x(spd,_spdDir);
vspd = lengthdir_y(spd, _spdDir);

x += hspd;
y += vspd;
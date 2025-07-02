// Perlin Variables
#macro PTILE_SIZE 4
#macro PMAP_W 100
#macro PMAP_H 100
#macro SCALE .04
#macro OCTAVES 3
#macro PERSISTENCE .6
global.scale = .04;
global.octaves = 3;
global.persistence = .6;
global.perm = [];

// BSP Variables
#macro BMAP_W 500
#macro BMAP_H 400
#macro DEPTH 5
#macro MIN_SIZE 80
#macro MIN_ROOM_SIZE 40
#macro MARGIN 8
global.bdepth = 5;
global.min_size = 80;
global.min_room_size = 40;
global.margin = 8;

// Both Algorithms
global.map = -1;
global.tilelayer = -1;
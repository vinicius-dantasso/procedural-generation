
function Room(_x, _y, _width, _height) constructor {
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	center_x = x + width div 2;
	center_y = y + height div 2;
}

function Node(_x, _y, _width, _height) constructor {
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	
	left = undefined;
	right = undefined;
	
	space = undefined;
	
	corridors = [];
}

function split(_node, _depth) {
	
	if(_depth <= 0 || _node.width < global.min_size*2 || _node.height < global.min_size*2) return;
	
	var split_percent = random_range(.3, .7);
	var split_horizontal = _node.height >= _node.width;
	
	if(split_horizontal) {
		var split_pos = round(_node.height * split_percent);
		_node.left = new Node(_node.x, _node.y, _node.width, split_pos);
		_node.right = new Node(_node.x, _node.y + split_pos, _node.width, _node.height - split_pos);
	}
	else {
		var split_pos = round(_node.width * split_percent);
		_node.left = new Node(_node.x, _node.y, split_pos, _node.height);
		_node.right = new Node(_node.x + split_pos, _node.y, _node.width - split_pos, _node.height); 
	}
	
	split(_node.left, _depth - 1);
	split(_node.right, _depth - 1);
	
}

function connect_rooms(_node) {
	
	if (_node.left == undefined && _node.right == undefined) return;

    connect_rooms(_node.left);
    connect_rooms(_node.right);

    var left_room = get_rooms(_node.left);
    var right_room = get_rooms(_node.right);

    if (left_room == undefined || right_room == undefined) return;

    var x1 = left_room.center_x;
    var y1 = left_room.center_y;
    var x2 = right_room.center_x;
    var y2 = right_room.center_y;

    if (x1 == x2 || y1 == y2) {
        // Alinhados em X ou Y → cria um corredor reto
        array_push(_node.corridors, [x1, y1, x2, y2]);
    } else {
        // Não alinhados → cria corredor em "L"
        if (choose(true, false)) {
            array_push(_node.corridors, [x1, y1, x2, y1]);
            array_push(_node.corridors, [x2, y1, x2, y2]);
        } else {
            array_push(_node.corridors, [x1, y1, x1, y2]);
            array_push(_node.corridors, [x1, y2, x2, y2]);
        }
    }
	
}


function get_rooms(_node) {
	if (_node == undefined) return undefined;

    if (_node.left == undefined && _node.right == undefined) {
        return _node.space;
    }

    var l_room = get_rooms(_node.left);
    if (l_room != undefined) return l_room;

    var r_room = get_rooms(_node.right);
    return r_room;	
}


function generate_rooms(_node) {
	
	if(_node.left != undefined && _node.right != undefined) {
		generate_rooms(_node.left);
		generate_rooms(_node.right);
		return;
	}
	
	var space_width = irandom_range(global.min_room_size, _node.width - global.margin * 2);
	var space_height = irandom_range(global.min_room_size, _node.height - global.margin * 2);
	var space_x = _node.x + global.margin + irandom(_node.width - space_width - global.margin * 2);
	var space_y = _node.y + global.margin + irandom(_node.height - space_height - global.margin * 2);
	
	_node.space = new Room(space_x, space_y, space_width, space_height); 
	
}

function draw_node(_node) {
	
	//draw_set_color(c_green);
	//draw_rectangle(_node.x, _node.y, _node.x + _node.width, _node.y + _node.height, true);
	
	if(_node.space != undefined) {
		draw_set_color(c_lime);
		draw_rectangle(_node.space.x, _node.space.y, (_node.space.x + _node.space.width), _node.space.y + _node.space.height, false);
	}
	
	draw_set_color(c_orange);
	for (var i = 0; i < array_length(_node.corridors); i++) {
		var conn = _node.corridors[i];
		draw_line_width(conn[0], conn[1], conn[2], conn[3], 3);
	}
	
	/*var coords = string_concat(string(_node.x), ", ", string(_node.y));
	draw_set_color(c_white);
	draw_text(_node.x, _node.y, coords);*/
	
	if(_node.left != undefined && _node.right != undefined) {
		draw_node(_node.left);
		draw_node(_node.right);
	}
	
	draw_set_color(-1);
	
}
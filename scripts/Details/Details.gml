
function get_color_from_height(_height) {
	if (_height < 0.3) {
		return make_color_rgb(0, 0, 128); // Água profunda
	}
	else if (_height < 0.4) {
	    return make_color_rgb(0, 0, 255); // Água rasa
	}
	else if (_height < 0.45) {
	    return make_color_rgb(240, 240, 64); // Praia
	}
	else if (_height < 0.6) {
	    return make_color_rgb(32, 160, 0); // Grama
	}
	else if (_height < 0.7) {
	    return make_color_rgb(100, 100, 100); // Montanha
	}
	else {
	    return make_color_rgb(255, 255, 255); // Neve
	}	
}

function define_tiles(_height) {
	var _tile_index = random_range(0,1);
	
	if (_height < 0.3) { // Água profunda
        return 12;
    }
    else if (_height < 0.4) { // Água rasa
        return 11;
    }
    else if (_height < 0.45) { // Praia
        
		if(_tile_index <= 0.7) return 6;
		else if(_tile_index < 0.8) return 7;
		else if(_tile_index < 0.9) return 8;
		else return 9;
		
    }
    else if (_height < 0.6) { // Grama
		
		if(_tile_index <= 0.7) return 1;
		else if(_tile_index < 0.8) return 2;
		else if(_tile_index < 0.9) return 3;
		else return 4;
		
    }
    else if (_height < 0.7) { // Montanha
        return 13;
    }
    else { // Neve
        return 13;
    }	
}

function find_grass_spawn() {
    var _max_attempts = 100; // Evitar loops infinitos
    var _attempts = 0;
    
    while (_attempts < _max_attempts) {
        // Escolhe uma posição aleatória no mapa
        var _x = irandom(PMAP_W - 1);
        var _y = irandom(PMAP_H - 1);
        
        // Verifica se a altura é de grama
        var _height = global.map[# _x, _y];
        if (_height >= 0.45 && _height < 0.6) {
            return [_x * PTILE_SIZE, _y * PTILE_SIZE]; // Retorna posição em pixels
        }
        _attempts++;
    }
    
    // Se não encontrar em 1000 tentativas, retorna um fallback (centro do mapa)
    return [PMAP_W * PTILE_SIZE / 2, PMAP_H * PTILE_SIZE / 2];
}

function generate_trees(num_trees, min_distance = 3) {
    var _trees_placed = 0;
    var _max_attempts = num_trees * 10; // Limite para evitar loops infinitos
    var _attempts = 0;
    var _spawn_x, _spawn_y;
    
    // Verifica se já existe um spawn do jogador definido
    if (instance_exists(oPlayer)) {
        _spawn_x = oPlayer.x div PTILE_SIZE;
        _spawn_y = oPlayer.y div PTILE_SIZE;
    } else {
        _spawn_x = -1;
        _spawn_y = -1;
    }
    
    while (_trees_placed < num_trees && _attempts < _max_attempts) {
        var _x = irandom(PMAP_W - 1);
        var _y = irandom(PMAP_H - 1);
        
        // Verifica se é grama e não está muito perto do spawn
        var _height = global.map[# _x, _y];
        if (_height >= 0.45 && _height < 0.6) {
            var _too_close_to_spawn = false;
            
            // Evita árvores muito perto do spawn do jogador
            if (_spawn_x != -1 && _spawn_y != -1) {
                if (point_distance(_x, _y, _spawn_x, _spawn_y) < 5) {
                    _too_close_to_spawn = true;
                }
            }
            
            // Verifica se já existe uma árvore muito perto
            var _too_close_to_tree = false;
            with (oTree) {
                if (point_distance(x, y, _x * PTILE_SIZE, _y * PTILE_SIZE) < min_distance * PTILE_SIZE) {
                    _too_close_to_tree = true;
                    break;
                }
            }
            
            // Se passar todas as verificações, cria a árvore
            if (!_too_close_to_spawn && !_too_close_to_tree) {
                var _tree = instance_create_layer(_x * PTILE_SIZE, _y * PTILE_SIZE, "Instances", oTree);
				_tree.depth = -1;
                _trees_placed++;
            }
        }
        _attempts++;
    }
}

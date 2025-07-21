
function get_color_from_height(_height) {
	if (_height < 0.4) {
		return make_color_rgb(0, 0, 128); // Água profunda
	}
	else if (_height < 0.5) {
	    return make_color_rgb(0, 0, 255); // Água rasa
	}
	else if (_height < 0.55) {
	    return make_color_rgb(240, 240, 64); // Praia
	}
	else if (_height < 0.7) {
	    return make_color_rgb(32, 160, 0); // Grama
	}
	else if (_height < 0.8) {
	    return make_color_rgb(100, 100, 100); // Montanha
	}
	else {
	    return make_color_rgb(255, 255, 255); // Neve
	}	
}

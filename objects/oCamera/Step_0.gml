
if(instance_exists(target)){
	x = lerp(x,target.x - cam_width/2,cam_spd);
	y = lerp(y,target.y - cam_height/2,cam_spd);
	
	//x = clamp(x,0,(PMAP_W * PTILE_SIZE) - cam_width);
	//y = clamp(y,0,(PMAP_H * PTILE_SIZE) - cam_height);
	
	camera_set_view_pos(view_camera[0],x,y);
}
else{
	target = -1;	
}

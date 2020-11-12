// Zooming

if(false){
	with(global.player){
		if(x > 0 and x < 1300){
			global.camera.scale_camera(0.5, 0.005);
		}
		else if(x >= 1300 and x < 5000){
			global.camera.scale_camera(1, 0.01);
		}
		else if(x >= 5000){
			global.camera.scale_camera(1.75, 0.005);
		}
	}
}
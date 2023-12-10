//Positioning on oPlayer
x = oPlayer.x;
y = oPlayer.y+5;


image_angle = point_direction(x,y,mouse_x,mouse_y);

//Schussgeschwindigkeit
firingdelay = firingdelay - 1;
if (mouse_check_button(mb_left)) && (firingdelay < 0){
	firingdelay = 5;
	with (instance_create_layer(x,y,"Bullets",oBullet)){
		speed = 25;
		
	}
}
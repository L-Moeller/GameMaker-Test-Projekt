//Check Inputs
var _keyleft = keyboard_check(vk_left);
var _keyright = keyboard_check(vk_right);
var _keyjump = keyboard_check_pressed(vk_space);

//Define controls
hsp = (_keyright - _keyleft) * walkspeed;

vsp = vsp + grv;

//Springen möglich?
if (canjump-- > 0) && (_keyjump){
	vsp = jspeed;
	canjump = 0;
}

//Colide and move
if (place_meeting(x+hsp,y,oWall)){
	while(abs(hsp) > 0.1){
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oWall)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oWall)){
	if (vsp > 0) canjump = 10;
	while (abs(vsp) > 0.1){
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oWall)) y+= vsp;
	}
	vsp = 0;
}
y += vsp;

//Animation
if (!place_meeting(x,y+1,oWall)){
	sprite_index = sPlayerJ;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = sPlayer;
	}else{
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);
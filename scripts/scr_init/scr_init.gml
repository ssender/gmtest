// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init(){
	enum d {
		neutral,
		up,
		down,
		upright,
		upleft,
		right,
		left,
		downright,
		downleft
	}
	enum at {
		dir_left,
		dir_center,
		dir_right,
		pierce,
		sweep,
		splash_left,
		splash_right,
		bifurcating
	}
	
	room_goto(rm_battle);
}
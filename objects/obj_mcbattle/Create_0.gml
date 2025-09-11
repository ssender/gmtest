/// @description Insert description here
// You can write your code in this editor

dodgetime = 30;
aframe = 0;
dodging = d.neutral;
hitstun = 0;

cast = false;
cast_isleft = false;
incant = [];
ddecoder = [-1, 1, 3, -1, -1, 0, 2, -1, -1]

center_x = 140; 
center_y = 130;
mana = 30;
display_mana = mana;
initial_mana = mana;
max_mana = 30;
recovery = 1;
push_spell = function()
{
	if array_length(incant) >= 3 {incant = [];}
	array_push(incant, dodging);
}

check_hit = function(_hitbox_infolist)
{
	var _target = _hitbox_infolist[3];
	var _effect = _hitbox_infolist[0];
	var _hit = false;
	var _actual_pos = d.neutral;
	if dodging != d.neutral and aframe >= 10 and aframe <=27
	{
		_actual_pos = dodging;
	}
	switch _target
	{
		case at.bifurcating:
		_hit = (_actual_pos == d.left) or (_actual_pos == d.right);
		break
		case at.dir_center:
		_hit = (_actual_pos == d.neutral);
		break
		case at.dir_left:
		_hit = (_actual_pos == d.left);
		break
		case at.dir_right:
		_hit = (_actual_pos == d.right);
		break
		case at.pierce:
		_hit = not((_actual_pos == d.left) or (_actual_pos == d.right));
		break
		case at.splash_left:
		_hit = not((_actual_pos == d.right) or (_actual_pos == d.up));
		break
		case at.splash_right:
		_hit = not((_actual_pos == d.left) or (_actual_pos == d.up));
		break
		case at.sweep:
		_hit = not(_actual_pos == d.down);
		break
	}
	
	if _hit 
	{
		hitstun = 30;
		incant = [];
		cast = false;
		aframe = 0;
		dodging = d.neutral;
	}
	
	return _hit;
}
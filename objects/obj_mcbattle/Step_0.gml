/// @description Insert description here
// You can write your code in this editor

var _in = getinputs();

if display_mana != mana
{
	var _delta = mana - display_mana;
	var _max_change = max_mana*0.0025;
	if abs(_delta) < _max_change {display_mana = mana;}
	else {display_mana += sign(_delta)*_max_change;}
}

if hitstun > 0
{
	hitstun += -1;
	image_index = 3;
	x = center_x;
	y = center_y + clamp(hitstun*2, 0, 20);
	exit;
}

if cast
{
	aframe += -1;
	if aframe == 0
	{
		if cast_isleft {instance_create_depth(100, 20, depth + 3, obj_attack);}
		else {instance_create_depth(180, 20, depth + 3, obj_attack);}
		incant = [];
		cast = false;
	}
}
else if dodging == d.neutral
{
	image_alpha = 1;
	image_index = 0;
	if _in.Ap and array_length(incant) >= 1
	{
		cast = true;
		cast_isleft = true;
		aframe = 30;
		initial_mana = mana;
		mana += -array_length(incant);
	}
	else if _in.Bp and array_length(incant) >= 1
	{
		cast = true;
		cast_isleft = false;
		aframe = 30;
		initial_mana = mana;
		mana += -array_length(incant);
	}
	else
	{
		if _in.Lp {dodging = d.left; aframe = dodgetime; push_spell();}
		else if _in.Rp {dodging = d.right; aframe = dodgetime; push_spell();}
		else if _in.Dp {dodging = d.down; aframe = dodgetime; push_spell();}
		else if _in.Up {dodging = d.up; aframe = dodgetime; push_spell();}
	}
	x = center_x;
	y = center_y;
	recovery += 1;
}

if not dodging == d.neutral
{
	image_alpha = 1;
	recovery += 1;
	var _ac = animcurve_channel_evaluate(animcurve_get_channel(ac_dodge, 0), (dodgetime-aframe)/dodgetime);
	var _ac2 = animcurve_channel_evaluate(animcurve_get_channel(ac_dodge, 1), (dodgetime-aframe)/dodgetime);
	var _f = floor(_ac*3)
	switch dodging
	{
		case d.left:
		x = center_x - _ac*40;
		y = center_y + _ac2*16;
		image_index = _f;
		break
		
		case d.down:
		x = center_x;
		y = center_y + _ac*10;
		break
		
		case d.up:
		x = center_x;
		y = center_y - _ac*20;
		break
		
		case d.right:
		x = center_x + _ac*40;
		y = center_y + _ac2*16;
		if _f == 0 {image_index = 0;}
		else {image_index = _f + 3;}
		break
	}
	
	aframe += -1;
	if aframe == 0
	{
		dodging = d.neutral
	}
}

if recovery >= 120
{
	recovery = 0;
	if mana < max_mana {mana += 1;}
}
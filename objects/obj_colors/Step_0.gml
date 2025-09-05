/// @description Insert description here
// You can write your code in this editor

var _in = getinputs();



var _tx = tilex*16;
var _ty = tiley*16;
if x == _tx and y == _ty
{
	if _in.D {tiley += 1;}
	else if _in.U {tiley += -1;}
	else if _in.R {tilex += 1;}
	else if _in.L {tilex += -1;}
	else {moving = false;}
}

if not (x == _tx and y == _ty)
{
	moving = true;
	if x < _tx
	{
		facing = d.right;
		x += 1;
	}
	else if x > _tx
	{
		facing = d.left;
		x += -1;
	}
	if y < _ty
	{
		facing = d.down;
		y += 1;
	}
	else if y > _ty
	{
		facing = d.up;
		y += -1;
	}
	
}

if moving
{
	aclock += 1;
	if aclock >= 8
	{
		aclock = 0;
		aframe += 1;
		if aframe >= 4 {aframe = 0;}
	}
}
else
{
	aclock = 1;
	aframe = 1;
}
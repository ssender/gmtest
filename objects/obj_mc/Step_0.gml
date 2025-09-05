/// @description Insert description here
// You can write your code in this editor

var _in = getinputs();

if _in.D {moving[1] = d.down;}
else if _in.U {moving[1] = d.up;}
else {moving[1] = d.neutral;}
if _in.R {moving[0] = d.right;}
else if _in.L {moving[0] = d.left;}
else {moving[0] = d.neutral;}

var _vx = 0;
var _vy = 0;

switch moving[0]
{
	case d.neutral:
	if moving[1] == d.up {facing = d.up; _vy = -1;}
	else if moving[1] == d.down {facing = d.down; _vy = 1;}
	break;
	
	case d.right:
	if moving[1] = d.up {facing = d.upright; _vx = 1; _vy = -1;}
	else if moving[1] = d.down {facing = d.downright; _vx = 1; _vy = 1;}
	else {facing = d.right; _vx = 1;}
	break;
	
	case d.left:
	if moving[1] = d.up {facing = d.upleft; _vx = -1; _vy = -1;}
	else if moving[1] = d.down {facing = d.downleft; _vx = -1; _vy = 1;}
	else {facing = d.left; _vx = -1;}
	break;
}

var _speed = 2;
var _m = sqrt(sqr(_vx) + sqr(_vy));
if _m != 0 {_vx = _speed*_vx/_m; _vy = _speed*_vy/_m;}
x += _vx;
y += _vy;

if _m != 0 or aclock > 0
{
	aclock += 1;
	if aclock >= 10
	{
		aframe += 1;
		if aframe >= 4 {aframe = 0;}
		aclock = 0;
	}
}
else
{
	aframe = 1;
}
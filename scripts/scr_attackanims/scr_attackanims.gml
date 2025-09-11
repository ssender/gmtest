// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_anim(_in) constructor{
	sprite_index = _in[0];
	x0 = _in[1];
	y0 = _in[2];
	x1 = _in[3];
	y1 = _in[4];
	start = _in[5];
	length = _in[6];
	x = x0; y = y0;
	update = function(_aframe)
	{
		if _aframe >= start and _aframe <= start + length
		{
			_aframe += -start;
			x = (_aframe*x1 + (length-_aframe)*x0)/length
			y = (_aframe*y1 + (length-_aframe)*y0)/length
		}
	}
	draw = function(_aframe, _x, _y)
	{
		draw_sprite(sprite_index, 0, x + _x, y + _y);
	}
}
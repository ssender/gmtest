/// @description Insert description here
// You can write your code in this editor

if cast and (aframe % 4 <= 2 or aframe <= 12)
{
	draw_set_alpha(image_alpha);
	draw_sprite(sprite_index, image_index, x, y);
	draw_set_alpha(1);

	var _xo = 60
	if cast_isleft {_xo = -16;}
	for (var _i = array_length(incant)-1; _i >= 0; _i+= -1;)
	{
		draw_sprite(spr_magiccircle, _i*4 + ddecoder[incant[_i]], x + _xo, y + 48);
	}
}
else
{
	for (var _i = array_length(incant)-1; _i >= 0; _i+= -1;)
	{
		draw_sprite(spr_magiccirclef, _i*4 + ddecoder[incant[_i]], x+22, y+74);
	}
	draw_set_alpha(image_alpha);
	draw_sprite(sprite_index, image_index, x, y);
	draw_set_alpha(1);
}




draw_sprite(spr_manabarred, 0, 256, floor((1 - display_mana/max_mana)*188))
draw_sprite(spr_manabarfill, 0, 256, floor((1 - mana/max_mana)*188))
draw_sprite(spr_manabar, 0, 256, 0);


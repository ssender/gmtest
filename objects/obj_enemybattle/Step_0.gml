/// @description Insert description here
// You can write your code in this editor

if hitstun > 0
{
	
	hitstun += -1;
	exit;
}

if lag > 0
{
	lag += -1;
	exit;
}

if current_pattern = noone
{
	
	if downtime == 0
	{
		do_draw = false;
		aframe = 0;
		current_pattern = array_choose(patterns);
		pattern_step = 0;
		change_attack(current_pattern.pattern[0]);
	}
	else
	{
		downtime += -1;
	}
}
else
{
	aframe += 1;
	for (var _i = 0; _i < array_length(current_attack.hitboxes); _i+=1;)
	{
		var _hbdata = current_attack.hitboxes[_i]
		if (not hits[_i]) and aframe >= _hbdata[1] and aframe < _hbdata[1]+_hbdata[2]
		{
			hits[_i] = obj_mcbattle.check_hit(_hbdata);
		}
	}
	if aframe > current_attack.length 
	{
		aframe = 0;
		if not current_pattern.skip_endlag {lag = current_attack.lag_length;}
		pattern_step += 1;
		if pattern_step < array_length(current_pattern.pattern)
		{
			change_attack(current_pattern.pattern[pattern_step]);
		}
		else
		{
			lag = current_attack.lag_length;
			change_animation(seq_idle);
			current_pattern = noone;
			current_attack = noone;
			downtime = downtime_base;
			
		}
	}
}



/// @description Insert description here
// You can write your code in this editor
position = d.neutral;
aframe = 0;
attackanims = [];
downtime = 120;
downtime_range = 30;
downtime_base = 120;
hitstun = 0;
lag = 0;
current_pattern = noone;
current_animation = noone;
previous_animation = noone;
pattern_step = 0;
current_attack = noone;
hits = [];
do_draw = true;

change_animation = function(_seq)
{
	if current_animation != noone
	{
		previous_animation = current_animation;
	}
	current_animation = layer_sequence_create(layer, 160, 120, _seq);
}

change_animation(seq_idle);

change_attack = function(_att_name)
{
	current_attack = attacks[$ _att_name];
	change_animation(current_attack.animation);
	hits = array_create(array_length(current_attack.hitboxes), false);
}

patterns = [
	{
		pattern : ["punch_left", "punch_right"],
		downtime_multiplier : 2,
		skip_endlag : true
	}
]

attacks = {
	punch_left : {
		length : 40,
		charge_length : 20,
		lag_length : 15,
		animation: seq_attack,
		hitboxes : [
			[{damage : 2}, 25, 3, at.dir_center]
		]
	},
	punch_right : {
		length : 40,
		charge_length : 20,
		lag_length : 15,
		animation: seq_attack,
		hitboxes : [
			[{damage : 2}, 25, 3, at.dir_center]
		]
	},
}

/*
ATTACK PATTERN STRUCT FORMAT
{
	pattern (list of strings) :
		[attack1, attack2, ...] *sequence of attacks to perform
	downtime_multiplier (real) : m *number to multiply the downtime by after this attack
	skip_endlag (boolean) : P *whether to skip the endlag of moves which are not the final in the sequence
}

ATTACK STRUCT FORMAT
{
	length (integer) : n *total length of the attack in frames (invincible during this time)
	charge_length (integer) : m *length of attack windup
	lag_length (integer) : k *length of attack endlag in frames (not invincible during this time)
	animation (sequence asset) : seq_
	hitboxes (list of lists):
		[
			[effect_struct, start, length, target]
		] *list of attack effect and timing info (target comes from enum at)
}

EFFECT STRUCT FORMAT
{
	damage (integer) : n
}
*/
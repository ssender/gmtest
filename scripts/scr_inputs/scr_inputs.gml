// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getinputs(){
	var _out = {};
	if gamepad_is_connected(0)
	{
		_out.A = gamepad_button_check(0, gp_face2);
		_out.Ap = gamepad_button_check_pressed(0, gp_face2);
		_out.B = gamepad_button_check(0, gp_face1);
		_out.Bp = gamepad_button_check_pressed(0, gp_face1);
		_out.X = gamepad_button_check(0, gp_face3);
		_out.Xp = gamepad_button_check_pressed(0, gp_face3);
		_out.Lp = gamepad_button_check_pressed(0, gp_padl);
		_out.Rp = gamepad_button_check_pressed(0, gp_padr);
		_out.Up = gamepad_button_check_pressed(0, gp_padu);
		_out.Dp = gamepad_button_check_pressed(0, gp_padd);
		_out.L = gamepad_button_check(0, gp_padl);
		_out.R = gamepad_button_check(0, gp_padr);
		_out.U = gamepad_button_check(0, gp_padu);
		_out.D = gamepad_button_check(0, gp_padd);
	}
	else
	{
		_out.A = keyboard_check(vk_space);
		_out.Ap = keyboard_check_pressed(vk_space);
		_out.B = keyboard_check(ord("C"));
		_out.Bp = keyboard_check_pressed(ord("C"));
		_out.X = keyboard_check(ord("X"));
		_out.Xp = keyboard_check_pressed(ord("X"));
		_out.Lp = keyboard_check_pressed(vk_left);
		_out.Rp = keyboard_check_pressed(vk_right);
		_out.Up = keyboard_check_pressed(vk_up);
		_out.Dp = keyboard_check_pressed(vk_down);
		_out.L = keyboard_check(vk_left);
		_out.R = keyboard_check(vk_right);
		_out.U = keyboard_check(vk_up);
		_out.D = keyboard_check(vk_down);
	}
	return _out
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_choose(_array, _weights=[]){
	var _n = array_length(_array);
	if array_length(_weights) == 0
	{
		var _roll = irandom(_n-1);
		return _array[_roll];
	}
	else if array_length(_weights) == _n
	{
		var _sum = 0;
		for (var _i = 0; _i < _n; _i++)
		{
			_sum += _weights[_i];
		}
		var _roll = random(_sum);
		_sum = 0;
		for (var _i = 0; _i < _n; _i++)
		{
			_sum += _weights[_i]
			if _roll <= _sum
			{
				return _array[_i]
			}
		}
	}
	else
	{
		throw ("array_choose() received an improper _weights array!")
	}
}
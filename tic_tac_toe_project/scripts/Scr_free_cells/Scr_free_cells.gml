// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_free_cells(_field, _size_w, _size_h)
{
	var res = 0;
	for (var i = 0; i < _size_w; i++)
	{
		for (var j = 0; j < _size_h; j++)
		{
			if (!_field[i][j])
				res++;
		}
	}
	return res;
}
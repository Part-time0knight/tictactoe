// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_vector_win(_field, _size_w, _size_h,_size_vector)
{
	var vector_id = 0
	var state = 0;
	for (var i = 0; i < _size_h; i++)
		for (var j = 0; j < _size_w; j++)
		{
			state = _field[j][i];
			if (_field[j][i])
			{
				vector_id = Scr_read_vector(_field, _size_w, _size_h, j, i);
				if (vector_id.size >= _size_vector)
				{
					instance_destroy(vector_id);
					return state;
				}
			}
		}
	return 0;
}
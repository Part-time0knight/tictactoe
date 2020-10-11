// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function  Scr_get_random_cell(_field, _size_w, _size_h)
{
	var rand_vector = instance_create_depth(0, 0, 0, vector);
	for (var i = 0; i < _size_h; i++)
	{
		for (var j = 0; j < _size_w; j++)
		{
			if (!_field[j][i])
			{
				rand_vector.coord_x = j;
				rand_vector.coord_y = i;
				rand_vector.size++;
			}
		}
	}
	return rand_vector;
}
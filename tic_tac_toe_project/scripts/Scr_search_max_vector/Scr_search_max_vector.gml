// Script assets have changed for v2.3.0 see
function Scr_search_max_vector(_field, _size_w, _size_h, _player, _size_vector)
{
	var vector_id = 0, vector_temp = 0;
	
	for (var i = 0; i < _size_h; i++)
	{
		for (var j = 0; j < _size_w; j++)
		{
			if (_field[j][i] == _player)
			{
				vector_temp = Scr_read_AI_vector(_field, _size_w, _size_h, j, i, _size_vector);
				
				if (vector_id && vector_temp && vector_id.size >= vector_temp.size)
				{
					instance_destroy(vector_temp);
				}
				else if (vector_temp)
				{
					if (vector_id)
						instance_destroy(vector_id);
					vector_id = vector_temp;
				}
			}
		}
	}
	return vector_id;
}
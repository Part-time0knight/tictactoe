// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_vector_free_check(_field, _size_w, _size_h, _vector, _size_m)
{
	var length = 0, j = 0;
	
	switch _vector.dir
	{
		case "w": 
			for (var i = _vector.coord_x[0] - 1; i >= 0; i--)
			{
				if (!_field[i][_vector.coord_y[0]])
				{
					length++;
				}
			}
			for (var i = _vector.coord_x[0]; i < _size_w; i++)
			{
				if (!_field[i][_vector.coord_y[0]] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
			}
			break;
			
		case "h":
			for (var i = _vector.coord_y[0] - 1; i >= 0; i--)
			{
				if (!_field[_vector.coord_x[0]][i] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
			}
			for (var i = _vector.coord_y[0]; i < _size_h; i++)
			{
				if (!_field[_vector.coord_x[0]][i] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
			}
			break;
		case "l":
			j = _vector.coord_y[0] - 1;
			for (var i = _vector.coord_x[0] - 1; i >= 0 && j >= 0; i--)
			{
				if (!_field[i][j] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
				j--;
			}
			j = _vector.coord_y[_vector.size-1];
			for (var i = _vector.coord_x[0]; i < _size_w && j < _size_h; i++)
			{
				if (!_field[i][_vector.coord_y[0]] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
				j++;
			}
			break;
		case "r":
			j = _vector.coord_y[0] - 1;
			for (var i = _vector.coord_x[0] - 1; i >= 0 && j >= 0; i--)
			{
				if (!_field[i][j] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
				j--;
			}
			j = _vector.coord_y[_vector.size-1];
			for (var i = _vector.coord_x[0]; i < _size_w && j < _size_h; i++)
			{
				if (!_field[i][_vector.coord_y[0]] || _field[i][_vector.coord_y[0]] == _vector.player)
				{
					length++;
				}
				j++;
			}
			break;
	}
	if (length >= _size_m)
		return true;
	else 
		return false;
}
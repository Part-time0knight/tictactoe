// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_read_vector(_field, _size_w, _size_h, _x, _y)
{
	var state = _field[_x][_y];
	var x0 = _x, y0 = _y, ind = 0, j;
	for (var i = 0; i < 4; i++)
	{
		vector_id[i] = instance_create_depth(0, 0, 0, vector);//w, h, l, r
		vector_id[ind].player = state;
	}
	for (var i = _x; i >= 0 && _field[i][_y] == state; i--)
		x0 = i;
		
	for (var i = x0; i < _size_w && _field[i][_y] == state; i++)
	{
		vector_id[ind].coord_x[vector_id[ind].size] = i;
		vector_id[ind].coord_y[vector_id[ind].size] = _y;
		vector_id[ind].size++;
		vector_id[ind].dir = "w";
	}
	ind++;
	
	for (var i = _y; i >= 0 && _field[_x][i] == state; i--)
		y0 = i;
		
	for (var i = y0; i < _size_h && _field[_x][i] == state; i++)
	{
		vector_id[ind].coord_x[vector_id[ind].size] = _x;
		vector_id[ind].coord_y[vector_id[ind].size] = i;
		vector_id[ind].size++;
		vector_id[ind].dir = "h";
	}
	ind++;
	
	j = _y;
	for (var i = _x; i >= 0 && j >= 0 && _field[i][j] == state; i--)
	{
		x0 = i;
		y0 = j;
		j--;
	}
	j = y0;
	for (var i = x0; i < _size_w && j < _size_h && _field[i][j] == state; i++)
	{
		vector_id[ind].coord_x[vector_id[ind].size] = i;
		vector_id[ind].coord_y[vector_id[ind].size] = j;
		vector_id[ind].size++;
		vector_id[ind].dir = "l";
		j++;
	}
	ind++;
	
	j = _y;
	for (var i = _x; i < _size_w && j >= 0 && _field[i][j] == state; i++)
	{
		x0 = i;
		y0 = j;
		j--;
	}
	j = y0;
	for (var i = x0; i >= 0 && j < _size_h && _field[i][j] == state; i--)
	{
		vector_id[ind].coord_x[vector_id[ind].size] = i;
		vector_id[ind].coord_y[vector_id[ind].size] = j;
		vector_id[ind].size++;
		vector_id[ind].dir = "r";
		j++;
	}
	ind++;
	for (var i = 0; i < ind && vector_id[i]; i++)
		{
			if (vector_id[i] && vector_id[0].size < vector_id[i].size)
			{
				instance_destroy(vector_id[0]);
				vector_id[0] = vector_id[i];
				instance_destroy(vector_id[i]);
			}
			else
				instance_destroy(vector_id[i]);
		}
	return vector_id[0];
}
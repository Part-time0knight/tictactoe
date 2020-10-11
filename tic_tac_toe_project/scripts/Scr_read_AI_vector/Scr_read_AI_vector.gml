// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_read_AI_vector(_field, _size_w, _size_h, _x, _y, _length)
{
	var cell_type = _field[_x][_y];
	var ind = 0;
	var x0, y0;
	for (var i = 0; i < 4; i++)
	{
		_vector_arr[i] = 0;
	}
//-------------------------------------------	
	//w - чтение по ширине
	_vector_arr[ind] = instance_create_depth(0, 0, 0, vector);
	for (var i = _x; i >= 0 && (!_field[i][_y] || _field[i][_y] == cell_type); i--)
	{
		x0 = i;
	}
	
	for (var i = x0; i < _size_w && (!_field[i][_y] || _field[i][_y] == cell_type); i++)
	{
		var temp;
		_vector_arr[ind].coord_x[_vector_arr[ind].size_free] = i;
		_vector_arr[ind].coord_y[_vector_arr[ind].size_free++] = _y;
		_vector_arr[ind].dir = "w";
		if (_field[i][_y] == cell_type)
			temp = ++_vector_arr[ind].size;
	}
	
	if (_vector_arr[ind].size_free == _length)
		_vector_arr[ind++].free = true;
	else
		instance_destroy(_vector_arr[ind]);
//-------------------------------------------
	//h = чтение по вертикали
	_vector_arr[ind] = instance_create_depth(0, 0, 0, vector);
	for (var i = _y; i >= 0 && (!_field[_x][i] || _field[_x][i] == cell_type); i--)
	{
		y0 = i;
	}
	
	for (var i = y0; i < _size_h && (!_field[_x][i] || _field[_x][i] == cell_type); i++)
	{
		_vector_arr[ind].coord_x[_vector_arr[ind].size_free] = _x;
		_vector_arr[ind].coord_y[_vector_arr[ind].size_free++] = i;
		_vector_arr[ind].dir = "h";
		if (_field[_x][i] == cell_type)
			_vector_arr[ind].size++;
	}
	if (_vector_arr[ind].size_free == _length)
		_vector_arr[ind++].free = true;
	else
		instance_destroy(_vector_arr[ind]);
//-------------------------------------------	
	//l = диагональ слева на право и сверху вниз (начинается в 0:0 и заканчивается в 3:3 для поля 3*3)
	_vector_arr[ind] = instance_create_depth(0, 0, 0, vector);
	var i = _x, j = _y;
	while (i >= 0 && j >=0 && (!_field[i][j] || _field[i][j] == cell_type))
	{
		x0 = i--;
		y0 = j--;
	}
	var i = x0, j = y0;
	while (i < _size_w && j < _size_h && (!_field[i][j] || _field[i][j] == cell_type))
	{
		_vector_arr[ind].dir = "l";
		if (_field[i][j] == cell_type)
			_vector_arr[ind].size++;
		_vector_arr[ind].coord_x[_vector_arr[ind].size_free] = i++;
		_vector_arr[ind].coord_y[_vector_arr[ind].size_free++] = j++;
	}
	if (_vector_arr[ind].size_free == _length)
		_vector_arr[ind++].free = true;
	else
		instance_destroy(_vector_arr[ind]);
//-------------------------------------------	
	//r = диагональ справа на лево и сверху вниз (начинается в 3:0 и заканчивается в 0:3 для поля 3*3)
	_vector_arr[ind] = instance_create_depth(0, 0, 0, vector);
	var i = _x, j = _y;
	while (i < _size_w && j >=0 && (!_field[i][j] || _field[i][j] == cell_type))
	{
		x0 = i++;
		y0 = j--;
	}
	var i = x0, j = y0;
	while (i >= 0 && j < _size_h && (!_field[i][j] || _field[i][j] == cell_type))
	{
		_vector_arr[ind].dir = "r";
		if (_field[i][j] == cell_type)
			_vector_arr[ind].size++;
		_vector_arr[ind].coord_x[_vector_arr[ind].size_free] = i--;
		_vector_arr[ind].coord_y[_vector_arr[ind].size_free++] = j++;
	}
	if (_vector_arr[ind].size_free == _length)
		_vector_arr[ind++].free = true;
	else
		instance_destroy(_vector_arr[ind]);
	_vector_arr[ind]= 0;
//-------------------------------------------
	//выбор наибольшего вектора
	for (var i = 1; i < ind && _vector_arr[i]; i++)
	{
		if (_vector_arr[0].size < _vector_arr[i].size)
		{
			instance_destroy(_vector_arr[0]);
			_vector_arr[0] = _vector_arr[i];
		}
		else
			instance_destroy(_vector_arr[i]);
	}
	return _vector_arr[0];
}
/// @description Insert description here
// You can write your code in this editor
if (make_turn)
{
	if (!Obj_tick_main.tick)
	{
		state_cell = 1;
		image_index = state_cell;
		Obj_tick_main.state[x_m][y_m] = state_cell;
	}
	else
	{
		state_cell = 2;
		image_index = state_cell;
		Obj_tick_main.state[x_m][y_m] = state_cell;
	}
	//Obj_tick_main.tick = !Obj_tick_main.tick;
	Obj_tick_main.end_turn = true;
	make_turn = false;
}
/// @description
if (end_turn)
{
	alarm[1] = delay * room_speed;
	check = Scr_vector_win(state, field_size_w, field_size_h, vector_size);
	if (!check)
		end_turn = false;
	else
		draw_t = true;
	free_cells = Scr_free_cells(state, field_size_w, field_size_h);
	if (!free_cells)
	{
		draw_t = true;
		end_turn = true;
	}
}
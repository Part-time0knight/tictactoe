/// @description Insert description here
// You can write your code in this editor

if (!Obj_tick_main.alarm[1] && Obj_tick_main.tick)
{
	var centr_x = round((Obj_tick_main.field_size_w - 1)/2);
	var centr_y = round((Obj_tick_main.field_size_h - 1)/2);
	if (!turn)
	{
		turn++;
		if (!Obj_tick_main.state[centr_x][centr_y])
		{
			Obj_tick_main.field[centr_x][centr_y].make_turn = true;
			line = 1;
		}
		else
		{
			var cell_to_move = irandom(3);
			line = 2;
			switch (cell_to_move)
			{
				case 0:
					Obj_tick_main.field[centr_x - 1][centr_y - 1].make_turn = true;
					break;
				case 1:
					Obj_tick_main.field[centr_x + 1][centr_y - 1].make_turn = true;
					break;
				case 2:
					Obj_tick_main.field[centr_x - 1][centr_y + 1].make_turn = true;
					break;	
				case 3:
					Obj_tick_main.field[centr_x + 1][centr_y + 1].make_turn = true;
					break;
			}
		}
	}
	else if (turn == 1)
	{
		
		turn++;
		if (line == 1)
		{
			vector_metod = true;
			if (Obj_tick_main.field[centr_x - 1][centr_y - 1].state_cell == 1 && Obj_tick_main.field[centr_x + 1][centr_y + 1].state_cell == 1 ||
				Obj_tick_main.field[centr_x + 1][centr_y - 1].state_cell == 1 && Obj_tick_main.field[centr_x - 1][centr_y + 1].state_cell == 1)
			{
				var cell_to_move = irandom(3);
				switch (cell_to_move)
				{
					case 0:
						Obj_tick_main.field[centr_x][centr_y - 1].make_turn = true;
						break;
					case 1:
						Obj_tick_main.field[centr_x + 1][centr_y].make_turn = true;
						break;
					case 2:
						Obj_tick_main.field[centr_x][centr_y + 1].make_turn = true;
						break;	
					case 3:
						Obj_tick_main.field[centr_x - 1][centr_y].make_turn = true;
						break;
				}
			}
			else 
				vector_metod = true;
		}
		else if (line == 2)
		{
			if (Obj_tick_main.state[0][0] == 1 && Obj_tick_main.state[Obj_tick_main.field_size_w - 1][Obj_tick_main.field_size_h - 1] == 2
				|| Obj_tick_main.state[0][0] == 2 && Obj_tick_main.state[Obj_tick_main.field_size_w - 1][Obj_tick_main.field_size_h - 1] == 1
				|| Obj_tick_main.state[Obj_tick_main.field_size_w - 1][0] == 1 && Obj_tick_main.state[0][Obj_tick_main.field_size_h - 1] == 2
				|| Obj_tick_main.state[Obj_tick_main.field_size_w - 1][0] == 2 && Obj_tick_main.state[0][Obj_tick_main.field_size_h - 1] == 1)
			{
				if (!Obj_tick_main.state[0][0])
					Obj_tick_main.field[0][0].make_turn = true;
				else if (!Obj_tick_main.state[Obj_tick_main.field_size_w - 1][0])
					Obj_tick_main.field[Obj_tick_main.field_size_w - 1][0].make_turn = true;
				else if (!Obj_tick_main.state[0][Obj_tick_main.field_size_h - 1])
					Obj_tick_main.field[0][Obj_tick_main.field_size_h - 1].make_turn = true;
				else 
					Obj_tick_main.field[Obj_tick_main.field_size_w - 1][Obj_tick_main.field_size_h - 1].make_turn = true;
			}
			vector_metod = true;
		}
	}
	else if (vector_metod)
	{
		turn++;
		max_vector_my = Scr_search_max_vector(Obj_tick_main.state, Obj_tick_main.field_size_w,  Obj_tick_main.field_size_h, 2, Obj_tick_main.vector_size);
		max_vector_enemy = Scr_search_max_vector(Obj_tick_main.state, Obj_tick_main.field_size_w,  Obj_tick_main.field_size_h, 1, Obj_tick_main.vector_size);
		if (max_vector_my && max_vector_my.size == Obj_tick_main.vector_size - 1)
		{
			var turn_x, turn_y;
			for (var i = 0; i < max_vector_my.size_free; i++)
			{
				if (!Obj_tick_main.state[max_vector_my.coord_x[i]][max_vector_my.coord_y[i]])
				{
					turn_x = max_vector_my.coord_x[i];
					turn_y = max_vector_my.coord_y[i];
				}
			}
			Obj_tick_main.field[turn_x][turn_y].make_turn = true;
		}
		else if (max_vector_enemy && max_vector_enemy.size == Obj_tick_main.vector_size - 1)
		{
			var turn_x, turn_y;
			for (var i = 0; i < max_vector_enemy.size_free; i++)
			{
				if (!Obj_tick_main.state[max_vector_enemy.coord_x[i]][max_vector_enemy.coord_y[i]])
				{
					turn_x = max_vector_enemy.coord_x[i];
					turn_y = max_vector_enemy.coord_y[i];
				}
			}
			Obj_tick_main.field[turn_x][turn_y].make_turn = true;
		}
		else if (max_vector_my && max_vector_my.size < Obj_tick_main.vector_size - 1)
		{
			var turn_x, turn_y;
			for (var i = 0; i < max_vector_my.size_free; i++)
			{
				if (!Obj_tick_main.state[max_vector_my.coord_x[i]][max_vector_my.coord_y[i]])
				{
					turn_x = max_vector_my.coord_x[i];
					turn_y = max_vector_my.coord_y[i];
				}
			}
			Obj_tick_main.field[turn_x][turn_y].make_turn = true;
		} 
		else if (max_vector_enemy && max_vector_enemy.size < Obj_tick_main.vector_size - 1)
		{
			var turn_x = 0, turn_y = 0;
			for (var i = 0; i < max_vector_enemy.size_free && !turn_x; i++)
			{
				if (!Obj_tick_main.state[max_vector_enemy.coord_x[i]][max_vector_enemy.coord_y[i]])
				{
					turn_x = max_vector_enemy.coord_x[i];
					turn_y = max_vector_enemy.coord_y[i];
				}
			}
			Obj_tick_main.field[turn_x][turn_y].make_turn = true;
		}
		else
		{
			var vector_turn, rand_numb;
			var turn_x = 0, turn_y = 0;
			vector_turn = Scr_get_random_cell(Obj_tick_main.state, Obj_tick_main.field_size_w, Obj_tick_main.field_size_h);
			rand_numb = irandom(vector_turn.size - 1);
			turn_x = vector_turn.coord_x;
			turn_y = vector_turn.coord_y;
			Obj_tick_main.field[turn_x][turn_y].make_turn = true;
		}
		if (max_vector_my)
			instance_destroy(max_vector_my);
		if (max_vector_enemy)
			instance_destroy(max_vector_enemy);
	}
	
}
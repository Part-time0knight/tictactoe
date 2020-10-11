/// @description создание клеток игрового поля
x0 = room_width/2 - sprite_width * field_size_w/2;
y0 = room_height/2 - sprite_height * field_size_h/4;
for (var i = 0; i < field_size_h; i++)
	for (var j = 0; j < field_size_w; j++)
	{
		field[j][i] = instance_create_layer(x0 + sprite_width * j, y0 + sprite_height * i, "field", Obj_cell);
		field[j][i].x_m = j;
		field[j][i].y_m = i;
		state[j][i] = 0;
	}
if (mode == "PVC")
{
	if (!player_t)
		AI_player_tac = instance_create_depth(x, y, depth, Obj_AI_tac);
	else
		AI_player_tic = instance_create_depth(x, y, depth, Obj_AI_tic);
}
else if (mode == "CVC")
{
	AI_player_tac = instance_create_depth(x, y, depth, Obj_AI_tac);
	AI_player_tic = instance_create_depth(x, y, depth, Obj_AI_tic);	
}
game_type_name = instance_create_layer(544, 96, "field", Obj_game_type);

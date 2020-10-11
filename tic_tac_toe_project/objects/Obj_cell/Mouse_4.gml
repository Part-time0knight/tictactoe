/// @description Insert description here
// You can write your code in this editor
if (!state_cell && !Obj_tick_main.alarm[1])
{
	if (!Obj_tick_main.tick && !Obj_tick_main.AI_player_tic ||
		Obj_tick_main.tick && !Obj_tick_main.AI_player_tac)
		make_turn = true;
		
}
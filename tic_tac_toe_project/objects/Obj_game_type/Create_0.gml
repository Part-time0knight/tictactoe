/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
if (Obj_tick_main.mode == "PVP")
{
	image_index = 0;
}
else if (Obj_tick_main.mode == "PVC")
{
	if (Obj_tick_main.AI_player_tic)
		image_index = 2;
	else if (Obj_tick_main.AI_player_tac)
		image_index = 1;
}
else if (Obj_tick_main.mode == "CVC")
{
	image_index = 3;
}
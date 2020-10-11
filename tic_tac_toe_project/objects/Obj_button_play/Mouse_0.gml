/// @description Insert description here
if (!Obj_button_players.ind && !Obj_button_size.ind)
	room_goto(Room_PVP);
if (!Obj_button_players.ind && Obj_button_size.ind == 1)
	room_goto(Room_PVP_5x5);
else if (Obj_button_players.ind == 1 && !Obj_button_size.ind)
	room_goto(Room_PVC);
else if (Obj_button_players.ind == 1 && Obj_button_size.ind = 1)
	room_goto(Room_PVC_5x5);
else if (Obj_button_players.ind == 2 && !Obj_button_size.ind)
	room_goto(Room_CVC);
else if (Obj_button_players.ind == 2 && Obj_button_size.ind == 1)
	room_goto(Room_CVC_5x5);

	

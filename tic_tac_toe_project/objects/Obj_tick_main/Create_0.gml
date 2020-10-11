/// @description Инициация игрового поля
//размер поля определяется как field_size_w*field_size_h
field_size_w = 3; 
field_size_h = 3;

vector_size = 3; //необходимый размер вектора для победы
field[0][0] = 0; //инициация матрицы индексов
state[0][0] = 0; //инициация матрицы состояний
alarm[0] = 1;
/*создание клеток поля и занесение их индексов в матрицу field
создание происходит через кадр, после события создания главного объекта
это делается что бы была возможность изменить размер поля перед его созданием.*/
tick = false; //текущий ход. False - 1 игрок, true - 2 игрок
end_turn = false;
delay =0.5;//задержка смены хода в секундах
draw_t = 0;
reset_button = 0;
mode = 0;
AI_player_tic = 0;
AI_player_tac = 0;
player_t = 0;
button_menu = instance_create_layer(1056, 96, "field", Obj_button_menu);
/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_font(Font1);
//draw_self();
if (draw_t && check == 1)
	draw_text (x + 655, y + 158, "X win!");
else if (draw_t && check == 2)
	draw_text (x + 655, y + 158, "0 win!");
else if (draw_t && !free_cells)
	draw_text (x + 625, y + 158, "Nobody win!");
if (draw_t && !reset_button)
	reset_button = instance_create_layer(x + 620, y + 200, "instances", Obj_reset_button);
if (!tick && !draw_t && !alarm[1])
{
	draw_set_color(make_color_rgb(158, 11, 15));
	draw_text (x + 650, y + 358 + (64 * field_size_h), "X turn");
}
else if (!draw_t && !alarm[1])
{
	draw_set_color(make_color_rgb(0, 84, 166));
	draw_text (x + 650, y + 358 + (64 * field_size_h), "0 turn");
}
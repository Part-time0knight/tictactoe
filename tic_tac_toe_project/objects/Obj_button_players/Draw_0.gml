/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(Font1);
if (!image_index)
	draw_set_color(c_black);
else
	draw_set_color(c_white);
draw_text(x + sprite_width/3.2, y + sprite_height/3.5, "mode");

draw_set_color(c_black);
indent_y = 100;
indent_x = -50;

draw_sprite(Spr_tac, 0, x + indent_x, y + indent_y * (ind + 1));

draw_text (x, y + indent_y, "player vs. player");


draw_text (x, y + indent_y * 2, "player vs. computer");


draw_text (x, y + indent_y * 3, "computer vs. computer");
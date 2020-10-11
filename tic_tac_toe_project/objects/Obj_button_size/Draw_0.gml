/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(Font1);
if (!image_index)
	draw_set_color(c_black);
else
	draw_set_color(c_white);
draw_text(x + sprite_width/3, y + sprite_height/3.5, "size");

draw_set_color(c_black);
indent_y = 100;
indent_x = 0;

draw_sprite(Spr_tic, 0, x + indent_x, y + indent_y * (ind + 1));

draw_text (x + 46, y + indent_y, "3x3");


draw_text (x + 46, y + indent_y * 2, "5x5");
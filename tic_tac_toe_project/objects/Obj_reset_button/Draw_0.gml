/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(Font1);
if (!image_index)
	draw_set_color(c_black);
else
	draw_set_color(c_white);
draw_text(x + sprite_width/4.5, y + sprite_height/3.5, "Restart");
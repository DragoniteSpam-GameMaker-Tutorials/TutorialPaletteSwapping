for (var i = 0; i < 3; i++) {
    draw_sprite_ext(spr_hearts, 0, 64 + 72 * i, 64, 4, 4, 0, c_white, 1);
}

if (talking) {
    draw_sprite_stretched(spr_nineslice, 0, 0, window_get_height() - 128, window_get_width(), 128);
    
    draw_set_font(fnt_game);
    draw_text_colour(32, window_get_height() - 96, string_copy(talking.text, 1, talking_t), c_black, c_black, c_black, c_black, 1);
    
    if (talking_t < string_length(talking.text)) {
        talking_t++;
    } else {
        if (keyboard_check_pressed(vk_space)) {
            talking = noone;
            talking_t = 0;
        }
    }
}
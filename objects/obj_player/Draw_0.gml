shader_set(shd_indexed_color);

if (keyboard_check_pressed(vk_space)) {
    palette_index++;
    if (palette_index >= 4) palette_index = 0;
}

var samp_palette = shader_get_sampler_index(shd_indexed_color, "samp_palette");
texture_set_stage(samp_palette, sprite_get_texture(spr_duck_palette, 0));

var u_palette_size = shader_get_uniform(shd_indexed_color, "u_palette_size");
var u_palette_index = shader_get_uniform(shd_indexed_color, "u_palette_index");
shader_set_uniform_f(u_palette_size, sprite_get_height(spr_duck_palette));

shader_set_uniform_f(u_palette_index, palette_index);

if (casting_frame == 0) {
    sprite_index = running ? spr_duckling_run : spr_duckling;
    event_inherited();
} else {
    var frame_count = sprite_get_number(spr_duckling_cast) / 4;
    draw_sprite(spr_duckling_cast, ((anim_dir + 1) * frame_count) - casting_frame, x, y);
}

shader_reset();
shader_set(shd_palette);

var samp_targets = shader_get_sampler_index(shd_palette, "samp_targets");
texture_set_stage(samp_targets, sprite_get_texture(spr_duck_palette, 0));

var u_palette_size = shader_get_uniform(shd_palette, "palette_size");
var u_palette_index = shader_get_uniform(shd_palette, "palette_index");
shader_set_uniform_f(u_palette_size, sprite_get_width(spr_duck_palette), sprite_get_height(spr_duck_palette));

var palette_uvs = texture_get_uvs(sprite_get_texture(spr_duck_palette, 0));
var u_palette_start = shader_get_uniform(shd_palette, "u_palette_start");
var u_palette_end = shader_get_uniform(shd_palette, "u_palette_end");
shader_set_uniform_f(u_palette_start, palette_uvs[0], palette_uvs[1]);
shader_set_uniform_f(u_palette_end, palette_uvs[2], palette_uvs[3]);

if (keyboard_check(vk_space)) {
    shader_set_uniform_f(u_palette_index, 0);
} else {
    shader_set_uniform_f(u_palette_index, 1);
}

if (casting_frame == 0) {
    sprite_index = running ? spr_duckling_run : spr_duckling;
    event_inherited();
} else {
    var frame_count = sprite_get_number(spr_duckling_cast) / 4;
    draw_sprite(spr_duckling_cast, ((anim_dir + 1) * frame_count) - casting_frame, x, y);
}

shader_reset();
if (moving) {
    var dx = cos(move_dir);
    var dy = -sin(move_dir);
    anim_frame = (anim_frame + 0.125) % 4;
    anim_dir = radtodeg(move_dir) / 90;
    x += dx * 2;
    y += dy * 2;
} else {
    anim_frame = 0;
}
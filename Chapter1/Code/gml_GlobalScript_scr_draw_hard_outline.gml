function scr_draw_hard_outline(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var __surf = -1;
    if (!surface_exists(__surf))
    {
        __surf = surface_create(64, 64);
    }
    surface_set_target(__surf);
    draw_clear_alpha(c_black, 0);
    var __xdirA = arg9;
    var __xdirB = 0;
    var __ydirA = 0;
    var __ydirB = arg9;
    draw_sprite_ext(arg0, arg1, arg9 + __xdirA, arg9 + __ydirA, arg4 / 2, arg5 / 2, 0, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg9 - __xdirA, arg9 - __ydirA, arg4 / 2, arg5 / 2, 0, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg9 + __xdirB, arg9 + __ydirB, arg4 / 2, arg5 / 2, 0, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg9 - __xdirB, arg9 - __ydirB, arg4 / 2, arg5 / 2, 0, c_white, 1);
    surface_reset_target();
    gpu_set_fog(true, arg7, 0, 0);
    draw_surface_ext(__surf, arg2 - (arg9 * 2), arg3 - (arg9 * 2), 2, 2, arg6, c_white, arg8);
    gpu_set_fog(false, c_white, 0, 0);
    if (surface_exists(__surf))
    {
        surface_free(__surf);
    }
}

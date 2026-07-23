function scr_sneo_savemeact_drawface()
{
    if (global.chapter == 2 && instance_exists(obj_spamton_neo_enemy) && obj_spamton_neo_enemy.savemeactcon > 0 && !scr_havechar(4))
    {
        var savemetotal = obj_spamton_neo_enemy.savemeactcon;
        for (var i = 0; i < 3; i++)
        {
            if (i >= global.charturn)
            {
                break;
            }
            if (global.actingsingle[i] == 1)
            {
                savemetotal++;
            }
        }
        if (savemetotal == 1 || savemetotal == 2)
        {
            if (global.char[global.charturn] == 3)
            {
                draw_sprite_ext(spr_headkris, 0, xx + 30, yy + 380, 1, 1, 0, c_white, 1);
            }
            else
            {
                draw_sprite_ext(spr_headralsei, 0, xx + 30, yy + 380, 1, 1, 0, c_white, 1);
            }
        }
        if (savemetotal == 3 || savemetotal == 4)
        {
            if (global.char[global.charturn] == 2)
            {
                draw_sprite_ext(spr_headkris, 0, xx + 30, yy + 380, 1, 1, 0, c_white, 1);
            }
            else
            {
                draw_sprite_ext(spr_headsusie, 0, xx + 30, yy + 380, 1, 1, 0, c_white, 1);
            }
        }
        if (savemetotal == 5)
        {
            draw_sprite_ext(spr_headnoelle, 0, xx + 30, yy + 380, 1, 1, 0, c_white, 1);
        }
    }
}

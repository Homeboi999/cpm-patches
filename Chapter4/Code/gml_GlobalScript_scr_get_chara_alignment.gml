function scr_get_chara_alignment(arg0, arg1 = -4)
{
    switch (arg0)
    {
        case "kris":
        default:
            return 
            {
                halign: 0,
                valign: 0
            };
        case "susie":
            var result = 
            {
                halign: (global.darkzone == 0) ? 3 : 6,
                valign: (global.darkzone == 0) ? 6 : 16
            };
            if (room == room_dw_castle_town && scr_flag_get(793) == 1)
            {
                result.valign = 20;
            }
            return result;
        case "ralsei":
            result = 
            {
                halign: 2,
                valign: 12
            };
            with (arg1)
            {
                if (global.chapter == 4)
                {
                    if (sprite_index == spr_ralsei_splat_caterpillar)
                    {
                        result.halign = 12;
                    }
                    if (room == room_dw_castle_town)
                    {
                        if (scr_flag_get(793) == 1)
                        {
                            if (sprite_index == spr_ralsei_walk_left)
                            {
                                result.halign -= 12;
                            }
                            if (sprite_index == spr_ralsei_walk_right)
                            {
                                result.halign += 12;
                            }
                            result.valign = 16;
                        }
                    }
                }
            }
            return result;
        case "noelle":
            return 
            {
                halign: (global.darkzone == 0) ? 2 : 4,
                valign: (global.darkzone == 0) ? 9 : 18
            };
    }
}

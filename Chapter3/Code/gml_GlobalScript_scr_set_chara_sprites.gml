function scr_set_chara_sprites(arg0, arg1)
{
    with (arg1)
    {
        switch (arg0)
        {
            case "kris":
                dsprite = spr_krisd;
                rsprite = spr_krisr;
                usprite = spr_krisu;
                lsprite = spr_krisl;
                slidesprite = spr_krisd_slide;
                climbsprite = 3935;
                if (global.darkzone == 1)
                {
                    dsprite = spr_krisd_dark;
                    rsprite = spr_krisr_dark;
                    lsprite = spr_krisl_dark;
                    usprite = spr_krisu_dark;
                }
                break;
            case "susie":
                usprite = spr_susie_walk_up_dw;
                dsprite = spr_susie_walk_down_dw;
                rsprite = spr_susie_walk_right_dw;
                lsprite = spr_susie_walk_left_dw;
                slidesprite = spr_susie_slide;
                climbsprite = 2409;
                if (global.darkzone == 0)
                {
                    usprite = spr_susie_walk_up_lw;
                    rsprite = spr_susie_walk_right_lw;
                    lsprite = spr_susie_walk_left_lw;
                    dsprite = spr_susie_walk_down_lw;
                }
                if (room == room_dw_snow_zone)
                {
                    if (global.plot > 160 && global.plot < 170)
                    {
                        rsprite = spr_susie_walk_right_dw_unhappy;
                        lsprite = spr_susie_walk_left_dw_unhappy;
                        dsprite = spr_susie_walk_down_dw_unhappy;
                    }
                }
                break;
            case "ralsei":
                usprite = spr_ralsei_walk_up;
                dsprite = spr_ralsei_walk_down;
                rsprite = spr_ralsei_walk_right;
                lsprite = spr_ralsei_walk_left;
                slidesprite = spr_ralsei_slide;
                climbsprite = 4222;
                if (room == room_dw_snow_zone)
                {
                    if (global.plot > 160 && global.plot < 170)
                    {
                        rsprite = spr_ralsei_walk_right_unhappy;
                        lsprite = spr_ralsei_walk_left_unhappy;
                        dsprite = spr_ralsei_walk_down_unhappy;
                    }
                }
                break;
            case "noelle":
                usprite = spr_noelle_walk_up_dw;
                dsprite = spr_noelle_walk_down_dw;
                rsprite = spr_noelle_walk_right_dw;
                lsprite = spr_noelle_walk_left_dw;
                slidesprite = spr_noelle_walk_up_dw;
                climbsprite = 276;
                if (global.darkzone == 0)
                {
                    usprite = spr_noelle_walk_up_lw;
                    rsprite = spr_noelle_walk_right_lw;
                    lsprite = spr_noelle_walk_left_lw;
                    dsprite = spr_noelle_walk_down_lw;
                }
                break;
            case "starwalker":
                usprite = spr_npc_originalstarwalker;
                dsprite = spr_npc_originalstarwalker;
                rsprite = spr_npc_originalstarwalker;
                lsprite = spr_npc_originalstarwalker;
                slidesprite = spr_npc_originalstarwalker;
                climbsprite = 1071;
                break;
        }
    }
}

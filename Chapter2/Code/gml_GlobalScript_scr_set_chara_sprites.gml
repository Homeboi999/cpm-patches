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
                rsprite = spr_susie_walk_right_dw;
                lsprite = spr_susie_walk_left_dw;
                dsprite = spr_susie_walk_down_dw;
                slidesprite = spr_susie_slide;
                if (global.darkzone == 0)
                {
                    usprite = spr_susie_walk_up_lw;
                    rsprite = spr_susie_walk_right_lw;
                    lsprite = spr_susie_walk_left_lw;
                    dsprite = spr_susie_walk_down_lw;
                }
                break;
            case "ralsei":
                usprite = spr_ralsei_walk_up;
                dsprite = spr_ralsei_walk_down;
                rsprite = spr_ralsei_walk_right;
                lsprite = spr_ralsei_walk_left;
                slidesprite = spr_ralsei_slide;
                break;
            case "noelle":
                usprite = spr_noelle_walk_up_dw;
                dsprite = spr_noelle_walk_down_dw;
                rsprite = spr_noelle_walk_right_dw;
                lsprite = spr_noelle_walk_left_dw;
                slidesprite = spr_noelle_slide;
                if (global.plot == 95)
                {
                    dsprite = spr_noelle_walk_down_blush_dw;
                    rsprite = spr_noelle_walk_right_blush_dw;
                    lsprite = spr_noelle_walk_left_blush_dw;
                }
                if (global.darkzone == 0)
                {
                    usprite = spr_noelle_walk_up_lw;
                    rsprite = spr_noelle_walk_right_lw;
                    lsprite = spr_noelle_walk_left_lw;
                    dsprite = spr_noelle_walk_down_lw;
                }
                break;
            case "berdly":
                usprite = spr_berdly_walk_up_dw;
                dsprite = spr_berdly_walk_down_dw;
                rsprite = spr_berdly_walk_right_dw;
                lsprite = spr_berdly_walk_left_dw;
                slidesprite = spr_berdly_walk_down_dw;
                break;
            case "starwalker":
                usprite = spr_npc_originalstarwalker;
                dsprite = spr_npc_originalstarwalker;
                rsprite = spr_npc_originalstarwalker;
                lsprite = spr_npc_originalstarwalker;
                slidesprite = spr_npc_originalstarwalker;
                break;
        }
    }
}

function scr_set_chara_sprites(arg0)
{
    init_clothes = false;
    switch (arg0)
    {
        case "kris":
            dsprite = spr_krisd;
            rsprite = spr_krisr;
            usprite = spr_krisu;
            lsprite = spr_krisl;
            climbsprite = 3708;
            if (global.darkzone == 1)
            {
                dsprite = spr_krisd_dark;
                rsprite = spr_krisr_dark;
                lsprite = spr_krisl_dark;
                usprite = spr_krisu_dark;
            }
            if (global.chapter == 4)
            {
                if (global.darkzone == 0 && global.plot >= 11 && global.plot < 35)
                {
                    init_clothes = true;
                    dsprite = spr_kris_walk_down_church;
                    rsprite = spr_kris_walk_right_church;
                    lsprite = spr_kris_walk_left_church;
                }
                tower_shake_xoffset = 0;
            }
            break;
        case "susie":
            usprite = spr_susieu_dark;
            dsprite = spr_susied_dark;
            rsprite = spr_susier_dark;
            lsprite = spr_susiel_dark;
            slidesprite = spr_susie_slide;
            climbsprite = 2649;
            if (global.chapter >= 2)
            {
                usprite = spr_susie_walk_up_dw;
                rsprite = spr_susie_walk_right_dw;
                lsprite = spr_susie_walk_left_dw;
                dsprite = spr_susie_walk_down_dw;
                if (global.darkzone == 0)
                {
                    usprite = spr_susie_walk_up_lw;
                    rsprite = spr_susie_walk_right_lw;
                    lsprite = spr_susie_walk_left_lw;
                    dsprite = spr_susie_walk_down_lw;
                    if (global.chapter == 4)
                    {
                        init_clothes = false;
                        if (global.darkzone == 0)
                        {
                            if (global.plot >= 11 && global.plot < 35)
                            {
                                init_clothes = true;
                                dsprite = spr_susie_walk_down_church;
                                rsprite = spr_susie_walk_right_church;
                                lsprite = spr_susie_walk_left_church;
                                usprite = spr_susie_walk_up_church;
                            }
                            if (global.plot >= 220)
                            {
                                init_clothes = true;
                                rsprite = spr_susie_walk_right_lw_unhappy;
                                dsprite = spr_susie_walk_down_lw_unhappy;
                                lsprite = spr_susie_walk_left_lw_unhappy;
                            }
                            if (room == room_town_shelter)
                            {
                                init_clothes = true;
                                rsprite = spr_susie_walk_right_lw_unhappy;
                                dsprite = spr_susie_walk_down_lw_unhappy;
                                lsprite = spr_susie_walk_left_lw_unhappy;
                            }
                        }
                        else if (room == room_dw_castle_town)
                        {
                            if (scr_flag_get(793) == 1)
                            {
                                init_clothes = true;
                                dsprite = spr_susie_lancer_carry_walk_down;
                                rsprite = spr_susie_lancer_carry_walk_right;
                                lsprite = spr_susie_lancer_carry_walk_left;
                                usprite = spr_susie_lancer_carry_walk_up;
                            }
                        }
                    }
                }
            }
            break;
        case "ralsei":
            usprite = spr_ralseiu;
            dsprite = spr_ralseid;
            rsprite = spr_ralseir;
            lsprite = spr_ralseil;
            if (global.chapter >= 2)
            {
                usprite = spr_ralsei_walk_up;
                dsprite = spr_ralsei_walk_down;
                rsprite = spr_ralsei_walk_right;
                lsprite = spr_ralsei_walk_left;
            }
            break;
        case "noelle":
            usprite = spr_noelle_walk_up_dw;
            dsprite = spr_noelle_walk_down_dw;
            rsprite = spr_noelle_walk_right_dw;
            lsprite = spr_noelle_walk_left_dw;
            if (global.darkzone == 0)
            {
                usprite = spr_noelle_walk_up_lw;
                dsprite = spr_noelle_walk_down_lw;
                rsprite = spr_noelle_walk_right_lw;
                lsprite = spr_noelle_walk_left_lw;
            }
            break;
        case "berdly":
            usprite = spr_berdly_walk_up_dw;
            dsprite = spr_berdly_walk_down_dw;
            rsprite = spr_berdly_walk_right_dw;
            lsprite = spr_berdly_walk_left_dw;
            break;
        case "starwalker":
            usprite = spr_npc_originalstarwalker;
            dsprite = spr_npc_originalstarwalker;
            rsprite = spr_npc_originalstarwalker;
            lsprite = spr_npc_originalstarwalker;
            break;
        case "lancer":
            usprite = spr_lancer_ut;
            dsprite = spr_lancer_dt;
            rsprite = spr_lancer_rt;
            lsprite = spr_lancer_lt;
            break;
    }
}

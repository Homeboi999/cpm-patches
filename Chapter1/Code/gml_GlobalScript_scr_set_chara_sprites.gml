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
                usprite = spr_susieu_dark;
                dsprite = spr_susied_dark;
                rsprite = spr_susier_dark;
                lsprite = spr_susiel_dark;
                if (global.plot >= 240)
                {
                    usprite = spr_susieu_dark;
                    dsprite = spr_susied_dark_eyes;
                    rsprite = spr_susier_dark_eyes;
                    lsprite = spr_susiel_dark_eyes;
                }
                break;
            case "ralsei":
                usprite = spr_ralseiu;
                dsprite = spr_ralseid;
                rsprite = spr_ralseir;
                lsprite = spr_ralseil;
                break;
            case "starwalker":
                usprite = spr_npc_originalstarwalker;
                dsprite = spr_npc_originalstarwalker;
                rsprite = spr_npc_originalstarwalker;
                lsprite = spr_npc_originalstarwalker;
                break;
        }
    }
}

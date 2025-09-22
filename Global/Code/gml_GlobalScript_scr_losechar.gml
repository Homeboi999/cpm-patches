function scr_losechar()
{
    if (scr_modconfig("forceParty") != 1)
    {
        global.char[2] = 0;
        global.char[1] = 0;
        scr_charupdate();
        global.submenu = 0;
        global.charselect = -1;
        for (i = 0; i < 36; i += 1)
        {
            global.submenucoord[i] = 0;
        }
    }
}


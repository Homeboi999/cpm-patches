function scr_getchar(arg0)
{
    if (scr_modconfig("forceParty") != 1)
    {
        getchar = 0;
        if (global.char[0] == 0)
        {
            global.char[0] = arg0;
            getchar = 1;
        }
        if (global.char[1] == 0 && getchar == 0)
        {
            global.char[1] = arg0;
            getchar = 1;
        }
        if (global.char[2] == 0 && getchar == 0)
        {
            global.char[2] = arg0;
            getchar = 1;
        }
        scr_charupdate();
    }
}


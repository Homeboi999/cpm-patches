function scr_susiemode()
{
    var modsetting = scr_modconfig("autoSusie");
    switch (modsetting)
    {
        case 0:
            if (global.plot < 150)
            {
                return true;
            }
            else
            {
                return false;
            }
            break;
        case 1:
            return true;
            break;
        case 2:
            return false;
            break;
    }
}

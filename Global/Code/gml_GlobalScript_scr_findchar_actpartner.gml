function scr_findchar_actpartner(arg0)
{
    for (var i = 0; i < 3; i++)
    {
        if (global.char[i] == arg0 && global.acting[i] == 2)
        {
            return i;
        }
    }
    return -1;
}

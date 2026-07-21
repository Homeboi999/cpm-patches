function scr_actactor_char_available(arg0)
{
    if (global.hp[arg0] <= 0)
    {
        return false;
    }
    for (var i = 0; i < 3; i++)
    {
        if (global.char[i] == arg0 && global.charaction[i] == 0)
        {
            return true;
        }
    }
    return false;
}

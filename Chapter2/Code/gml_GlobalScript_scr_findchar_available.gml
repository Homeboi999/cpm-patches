function scr_findchar_available(arg0)
{
    for (var i = 0; i < 3; i++)
    {
        if (global.char[i] == arg0 && scr_actactor_slot_available(i).available)
        {
            return i;
        }
    }
    return -1;
}

function scr_actactor_char_available(arg0)
{
    var result = new actactor_status(false);
    for (var i = 0; i < 3; i++)
    {
        if (global.char[i] != arg0)
        {
            continue;
        }
        result.or_in_place(scr_actactor_slot_available(i));
    }
    return result;
}

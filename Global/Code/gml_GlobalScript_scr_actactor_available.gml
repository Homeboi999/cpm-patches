function scr_actactor_available(arg0)
{
    switch (arg0)
    {
        case 2:
            return scr_actactor_char_available(2);
        case 3:
            return scr_actactor_char_available(3);
        case 4:
            var result = scr_actactor_char_available(2);
            result.and_in_place(scr_actactor_char_available(3));
            return result;
        case 5:
            return scr_actactor_char_available(4);
        case 6:
        case 7:
            result = new actactor_status(true);
            var character_count = 0;
            for (var i = 0; i < 3; i++)
            {
                if (global.char[i] == 0)
                {
                    continue;
                }
                character_count++;
                result.and_in_place(scr_actactor_slot_available(i));
            }
            if (character_count <= 1)
            {
                return new actactor_status(false);
            }
            return result;
        case 8:
            if (global.charturn == 0)
            {
                return scr_actactor_slot_available(1);
            }
            else
            {
                return scr_actactor_slot_available(0);
            }
        case 9:
            if (global.charturn == 2)
            {
                return scr_actactor_slot_available(1);
            }
            else
            {
                return scr_actactor_slot_available(2);
            }
        default:
            return new actactor_status(true);
    }
}

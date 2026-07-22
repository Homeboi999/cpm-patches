function scr_actactor_available(arg0)
{
    switch (arg0)
    {
        case 2:
            return scr_actactor_char_available(2);
        case 3:
            return scr_actactor_char_available(3);
        case 4:
            return scr_actactor_char_available(2) && scr_actactor_char_available(3);
        case 5:
            return scr_actactor_char_available(4);
        case 6:
            var character_count = 0;
            for (var i = 0; i < 3; i++)
            {
                if (global.char[i] == 0)
                {
                    continue;
                }
                character_count++;
                if (global.hp[global.char[i]] <= 0)
                {
                    return false;
                }
                if (global.charaction[i] != 0)
                {
                    return false;
                }
            }
            if (character_count <= 1)
            {
                return false;
            }
            return true;
        default:
            return true;
    }
}

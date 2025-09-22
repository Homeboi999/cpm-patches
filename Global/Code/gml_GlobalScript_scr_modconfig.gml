function scr_modconfig(arg0)
{
    var init = false;
    if (!variable_global_exists("modconfig"))
    {
        init = true;
    }
    else if (!is_array(global.modconfig))
    {
        init = true;
    }
    if (init)
    {
        global.modconfig = [0, 0, 0, 0, 0];
        for (i = 0; i < array_length(global.modconfig); i++)
        {
            var checker = string_char_at(string_digits(global.othername[2]), i + 1);
            if (checker != "")
            {
                global.modconfig[i] = real(checker);
            }
        }
    }
    switch (arg0)
    {
        case "menuMode":
            return global.modconfig[0];
            break;
        case "forceParty":
            return global.modconfig[1];
            break;
        case "coasterMode":
            return global.modconfig[2];
            break;
        case "enableTea":
            return global.modconfig[3];
            break;
        case "coasterType":
            return global.modconfig[4];
            break;
        default:
            return -1;
            break;
    }
}

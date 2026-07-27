function scr_actwait_available(arg0)
{
    var is_before_kris = false;
    var i = arg0 + 1;
    while (i < 3)
    {
        if (global.char[i] == 1)
        {
            is_before_kris = true;
            break;
        }
        i++;
    }
    if (!is_before_kris)
    {
        return false;
    }
    var is_included_in_act = false;
    for (var monster_index = 0; monster_index < 3 && !is_included_in_act; monster_index++)
    {
        if (global.monster[monster_index] == 0)
        {
            continue;
        }
        for (var act_index = 0; act_index < 6 && !is_included_in_act; act_index++)
        {
            if (global.canact[monster_index][act_index] == 0)
            {
                continue;
            }
            var actactor = global.actactor[monster_index][act_index];
            var char = global.char[arg0];
            switch (actactor)
            {
                case 2:
                    is_included_in_act = char == 2;
                    break;
                case 3:
                    is_included_in_act = char == 3;
                    break;
                case 4:
                    is_included_in_act = char == 2 || char == 3;
                    break;
                case 6:
                    is_included_in_act = true;
                    break;
            }
        }
    }
    if (!is_included_in_act)
    {
        return false;
    }
    return true;
}

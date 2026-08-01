function scr_act_charsprite_simul(arg0, arg1, arg2, arg3)
{
    var __simulorder = -1;
    var char = 0;
    if (arg0 == "kris")
    {
        char = 1;
    }
    else if (arg0 == "susie")
    {
        char = 2;
    }
    else if (arg0 == "ralsei")
    {
        char = 3;
    }
    else if (arg0 == "noelle")
    {
        char = 4;
    }
    for (var i = 0; i < 3; i++)
    {
        if (global.char[i] == char && simulorder[i] != -1 && !instance_exists(_charactsprite[i]))
        {
            __simulorder = i;
            break;
        }
    }
    return scr_act_charsprite(__simulorder, arg1, arg2, arg3);
}

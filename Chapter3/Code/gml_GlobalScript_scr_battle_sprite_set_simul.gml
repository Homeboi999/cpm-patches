function scr_battle_sprite_set_simul(arg0, arg1, arg2, arg3)
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
        if (global.char[i] == char && simulorder[i] != -1 && instance_exists(global.charinstance[i]) && global.charinstance[i].state != 8)
        {
            __simulorder = i;
            break;
        }
    }
    scr_battle_sprite_set(__simulorder, arg1, arg2, arg3);
    return __simulorder;
}

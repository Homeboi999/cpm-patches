function scr_nextact()
{
    __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]];
    with (__minstance)
    {
        acting = 0;
        actcon = 0;
    }
    while (global.currentactingchar < 3)
    {
        if (global.acting[global.currentactingchar] != 2)
        {
            global.acting[global.currentactingchar] = 0;
        }
        global.currentactingchar++;
        if (global.currentactingchar < 3)
        {
            if (global.acting[global.currentactingchar] == 1)
            {
                __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]];
                var actchoice = global.actingchoice[global.currentactingchar];
                if (global.char[global.currentactingchar] == 1)
                {
                    with (__minstance)
                    {
                        acting = actchoice + 1;
                    }
                    break;
                }
            }
        }
    }
    if (global.currentactingchar >= 3)
    {
        for (var i = 0; i < 3; i++)
        {
            global.acting[i] = 0;
        }
        with (obj_monsterparent)
        {
            acting = 0;
        }
        scr_attackphase();
    }
}

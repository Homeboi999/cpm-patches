function scr_nextact_simul()
{
    for (var slot = 0; slot < 3; slot++)
    {
        var needact = simulorder[slot] != -1 && simuldone[slot] == 0 && global.actingtarget[slot] == myself;
        var actreset = false;
        var actchoice = global.actingchoice[slot];
        switch (global.char[slot])
        {
            case 1:
                if (simulcountkri > 0 && needact)
                {
                    acting = actchoice + 1;
                    actcon = 0;
                    simulcountkri--;
                    actreset = true;
                }
                break;
            case 2:
                if (simulcountsus > 0 && needact)
                {
                    actingsus = actchoice + 1;
                    actconsus = 1;
                    simulcountsus--;
                    actreset = true;
                }
                break;
            case 3:
                if (simulcountral > 0 && needact)
                {
                    actingral = actchoice + 1;
                    actconral = 1;
                    simulcountral--;
                    actreset = true;
                }
                break;
            case 4:
                if (simulcountnoe > 0 && needact)
                {
                    actingnoe = actchoice + 1;
                    actconnoe = 1;
                    simulcountnoe--;
                    actreset = true;
                }
                break;
        }
        if (actreset)
        {
            break;
        }
    }
}

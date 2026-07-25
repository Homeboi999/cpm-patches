function scr_spellmenu_setup()
{
    var __actnamecheck = 0;
    var __monstertype = global.monstertype[0];
    for (var i = 1; i < 3; i++)
    {
        if (global.monster[i] == 1 && global.monstertype[i] != __monstertype)
        {
            __actnamecheck = 1;
        }
    }
    for (var i = 0; i < 3; i++)
    {
        global.battleactcount[i] = 0;
        if (scr_actwait_available(i))
        {
            var offset = global.battleactcount[i];
            if (global.battleactcount[i] < (offset + 1))
            {
                global.battleactcount[i] = offset + 1;
            }
            global.battlespell[i][offset] = -2;
            global.battlespellcost[i][offset] = 0;
            global.battlespellname[i][offset] = "Wait";
            global.battlespelldesc[i][offset] = "Act with#Kris";
            global.battlespelltarget[i][offset] = 0;
            global.battlespellspecial[i][offset] = 1;
        }
    }
    scr_spellinfo_all();
    for (var i = 0; i < 3; i++)
    {
        for (var fj = 0; fj < 12; fj++)
        {
            var ib = global.battleactcount[i] + fj;
            global.battlespell[i][ib] = global.spell[global.char[i]][fj];
            global.battlespellcost[i][ib] = global.spellcost[global.char[i]][fj];
            global.battlespellname[i][ib] = global.spellnameb[global.char[i]][fj];
            global.battlespelldesc[i][ib] = global.spelldescb[global.char[i]][fj];
            global.battlespelltarget[i][ib] = global.spelltarget[global.char[i]][fj];
        }
    }
}

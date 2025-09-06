if (partyMenu == 0)
{
    if (left_p())
    {
        snd_play(snd_menumove);
        partySelect -= 1;
        if (partySelect < 0)
        {
            partySelect = 3;
        }
    }
    if (right_p())
    {
        snd_play(snd_menumove);
        partySelect += 1;
        if (partySelect > 3)
        {
            partySelect = 0;
        }
    }
    if (partySelect < 3)
    {
        global.charselect = partySelect;
    }
    if (button1_p() && onebuffer < 0)
    {
        snd_play(snd_select);
        onebuffer = 2;
        if (partySelect < 3)
        {
            if (global.char[partySelect] > 0)
            {
                charSelect = global.char[partySelect];
            }
            else if (charSelect == 0)
            {
                charSelect = 1;
            }
            partyMenu = 1;
        }
        else
        {
            configMenu = instance_create(x, y, obj_configmenu);
            partyMenu = 2;
        }
    }
    if (button2_p() && twobuffer < 0)
    {
        snd_play(snd_smallswing);
        twobuffer = 2;
        global.charselect = global.submenucoord[20];
        instance_destroy();
    }
    if (button3_p() && threebuffer < 0)
    {
        threebuffer = 2;
        if (partySelect < 3)
        {
            if (global.char[partySelect] != 0)
            {
                global.char[partySelect] = 0;
                scr_charupdate();
                snd_play(snd_equip);
            }
            else
            {
                snd_play(snd_cantselect);
            }
        }
    }
}
if (partyMenu == 1)
{
    if (left_p())
    {
        snd_play(snd_menumove);
        charSelect -= 1;
        if (charSelect < 1)
        {
            charSelect = array_length(charList) - 1;
        }
    }
    if (right_p())
    {
        snd_play(snd_menumove);
        charSelect += 1;
        if (charSelect > (array_length(charList) - 1))
        {
            charSelect = 1;
        }
    }
    if (button1_p() && onebuffer < 0)
    {
        snd_play(snd_select);
        onebuffer = 2;
        global.char[partySelect] = charSelect;
        scr_charupdate();
    }
    if (button2_p() && twobuffer < 0)
    {
        snd_play(snd_smallswing);
        twobuffer = 2;
        partyMenu = 0;
    }
    if (button3_p() && threebuffer < 0)
    {
        threebuffer = 2;
        if (global.char[partySelect] != 0)
        {
            global.char[partySelect] = 0;
            scr_charupdate();
            snd_play(snd_equip);
        }
        else
        {
            snd_play(snd_cantselect);
        }
    }
}
if (partyMenu == 2)
{
    if (!instance_exists(obj_configmenu))
    {
        partyMenu = 0;
    }
}
onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;

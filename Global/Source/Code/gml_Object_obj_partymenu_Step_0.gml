if (partyMenu == 0)
{
    // select party slot
    if (left_p())
    {
        snd_play(snd_menumove);
        partySelect -= 1;
        
        if (partySelect < 0) // wrap around
            partySelect = 3;
    }
    
    if (right_p())
    {
        snd_play(snd_menumove);
        partySelect += 1;
        
        if (partySelect > 3) // wrap around
            partySelect = 0;
    }
    
    // if not hovering over the config button, change which char
    // thats selected at the bottom. only visible in the POWER menu
    if (partySelect < 3)
        global.charselect = partySelect;
    
    // check if a character slot is selected, and switch to char selector
    // otherwise switch to mod configs
    if (button1_p() && onebuffer < 0)
    {
        snd_play(snd_select);
        onebuffer = 2;
        
        if (partySelect < 3)
        {
            if (global.char[partySelect] > 0)
            {
                charSelect = global.char[partySelect]; // char selector selects current char
            }
            else if (charSelect == 0)
            {
                charSelect = 1; // if no previous value, default to selecting kris
            }

            partyMenu = 1;
        }
        else
        {
            // reworking the config menu to be more dynamic,
            // and trying to improve the way they're read/saved
            configMenu = instance_create(x, y, obj_configmenu);
            partyMenu = 2;
        }
    }
    
    if (button2_p() && twobuffer < 0)
    {
        snd_play(snd_smallswing);
        twobuffer = 2;
        global.charselect = global.submenucoord[20]; // reset global.charselect
        instance_destroy();
    }
    
    if (button3_p() && threebuffer < 0)
    {
        threebuffer = 2;
        
        if (partySelect < 3) // if not selecting config
        {
            if (global.char[partySelect] != 0)
            {
                global.char[partySelect] = 0; // clear party slot
                scr_charupdate(); // update other menus
                snd_play(snd_equip);
            }
            else
            {
                snd_play(snd_cantselect); // if already 0, play diff sound
            }
        }
    }
}

if (partyMenu == 1) // char selector
{
    if (left_p())
    {
        snd_play(snd_menumove);
        charSelect -= 1;
        
        if (charSelect < 1) // wrap around
            charSelect = array_length(charList) - 1;
    }
    
    if (right_p())
    {
        snd_play(snd_menumove);
        charSelect += 1;
        
        if (charSelect > array_length(charList) - 1) // wrap around
            charSelect = 1;
    }
    
    if (button1_p() && onebuffer < 0)
    {
        snd_play(snd_select);
        onebuffer = 2;
        global.char[partySelect] = charSelect; // set char
        scr_charupdate();
    }
    
    if (button2_p() && twobuffer < 0)
    {
        snd_play(snd_smallswing);
        twobuffer = 2;
        partyMenu = 0; // return to main selector
    }
    
    if (button3_p() && threebuffer < 0)
    {
        threebuffer = 2;
        
        if (global.char[partySelect] != 0)
        {
            global.char[partySelect] = 0; // clear char slot
            scr_charupdate(); // update other menus
            snd_play(snd_equip);
        }
        else
        {
            snd_play(snd_cantselect); // if already 0, play diff sound
        }
    }
}

if (partyMenu == 2) // mod config menu
{
    if (!instance_exists(obj_configmenu))
        partyMenu = 0;
}

// Decrement the input buffers.
onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;
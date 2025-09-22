if (global.chapter == 2)
{
    if (global.modconfig[2] == 2)
    {
        config_list = [0, 1, 2, 4];
    }
    else
    {
        config_list = [0, 1, 2];
    }
}
if (configMenu == 0)
{
    if (up_p())
    {
        snd_play(snd_menumove);
        configSelect -= 1;
        if (configSelect < 0)
        {
            configSelect = array_length(config_list) - 1;
        }
    }
    if (down_p())
    {
        snd_play(snd_menumove);
        configSelect += 1;
        if (configSelect > (array_length(config_list) - 1))
        {
            configSelect = 0;
        }
    }
    if (button1_p() && onebuffer < 0)
    {
        if (config_max[config_list[configSelect]] > 0)
        {
            snd_play(snd_select);
            onebuffer = 2;
            global.modconfig[config_list[configSelect]]++;
            if (global.modconfig[config_list[configSelect]] > config_max[config_list[configSelect]])
            {
                global.modconfig[config_list[configSelect]] = 0;
            }
        }
        else
        {
            snd_play(snd_cantselect);
        }
    }
    if (button2_p() && twobuffer < 0)
    {
        snd_play(snd_smallswing);
        twobuffer = 2;
        obj_partymenu.partyMenu = 0;
        global.othername[2] = string(global.modconfig);
        instance_destroy();
    }
}
onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;

// Mod Config menu
if (configMenu == 0)
{
    var menu_x = x + 160;
    var menu_y = y + 190 - (10 * array_length(config_list));
    var menu_width = 320;
    var menu_height = 100 + (20 * array_length(config_list));

    // find my strings
    var configName = config_info[config_list[configSelect]][0];
    var configDesc = config_info[config_list[configSelect]][1];
    
    // check to see if current setting is out-of-bounds, and reset to 0 to avoid crash
    if (global.modconfig[config_list[configSelect]] > config_max[config_list[configSelect]])
    {
        global.modconfig[config_list[configSelect]] = 0;
    }

    var stateName = config_state[config_list[configSelect]][global.modconfig[config_list[configSelect]]][0];
    var stateDesc = config_state[config_list[configSelect]][global.modconfig[config_list[configSelect]]][1];
    
    // Draw the descriptions for the config options.
    draw_set_color(c_white);

    draw_text(x + 20, y + 10, string_hash_to_newline(configDesc));
    if (stateDesc != "")
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + stateName + " - " + stateDesc));
        
    // menu bg
    draw_set_color(c_black);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
    scr_darkbox(menu_x - 10, menu_y - 10, menu_x + menu_width + 10, menu_y + menu_height + 10);

    // header
    draw_set_color(c_white);
    draw_text(menu_x + 87, menu_y + 12, stringset("Mod Options"));

    // menu mode setting text, since its the only one with more than 2 options

    for (i = 0; i < (array_length(config_list)); i++)
    {
        if (config_max[config_list[i]] == 0)
            draw_set_color(c_gray);
        else
            draw_set_color(c_white);
        
        draw_text(menu_x + 40, menu_y + 50 + (i * 30), config_info[config_list[i]][0] + ": " + config_state[config_list[i]][global.modconfig[config_list[i]]][0]);
    }

    // selector heart
    draw_sprite_ext(spr_heart, 0, menu_x + 15, menu_y + 60 + (configSelect * 30), 1, 1, 0, c_white, 1);
}
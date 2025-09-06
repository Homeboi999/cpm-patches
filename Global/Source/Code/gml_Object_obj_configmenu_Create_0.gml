globalPatches = true;
chapterPatches = true;
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
cur_jewel = 0;
depth = -1500;
configMenu = 0;
configSelect = 0;
config_info[0] = ["Menu Mode", stringsetsub("Change when the menu can be accessed with ~1.#", scr_get_input_name(6))];
config_state[0][0] = ["SAVE", "Only open at SAVE points."];
config_state[0][1] = ["POWER", "Open from the POWER menu."];
config_state[0][2] = ["BOTH", "Open from the POWER or SAVE menus."];
config_info[1] = ["Force Party", "Locks the party to the chosen characters.#Useful for plot-relevant encounters."];
config_state[1][0] = ["OFF", ""];
config_state[1][1] = ["ON", ""];
config_info[2] = ["Coasters", "Change how the party affects Berdly's coasters."];
config_state[2][0] = ["MATCH", "Coaster variants match the party."];
config_state[2][1] = ["MIX", "Coaster variants aren't changed."];
config_info[3] = ["Enable Tea", "Adds preservatives to the tea from Chapter 2."];
config_state[3][0] = ["OFF", "Own-flavored tea rots like normal."];
config_state[3][1] = ["ON", "Own-flavored tea will stay fresh."];
config_max[0] = array_length(config_state[0]) - 1;
config_max[1] = array_length(config_state[1]) - 1;
config_max[2] = array_length(config_state[2]) - 1;
config_max[3] = array_length(config_state[3]) - 1;
if (!globalPatches)
{
    config_info[1] = ["Force Party", "Locks the party to the chosen characters.#[!] Requires the global patch to function."];
    config_state[1][0] = ["OFF", ""];
    config_state[1][1] = ["OFF", ""];
    config_max[1] = 0;
}
config_list[0] = 0;
config_list[1] = 1;
if (chapterPatches)
{
    switch (global.chapter)
    {
        case 2:
            config_list[2] = 2;
            break;
        case 3:
        case 4:
            config_list[2] = 3;
            break;
    }
}

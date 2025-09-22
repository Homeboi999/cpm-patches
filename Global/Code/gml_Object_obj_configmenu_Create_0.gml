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
config_info[1] = ["Force Party", "Locks the party to the chosen characters,#preventing anything from changing it."];
config_state[1][0] = ["OFF", ""];
config_state[1][1] = ["ON", ""];
config_info[2] = ["Coasters", "Change what variants of coaster are used."];
config_state[2][0] = ["DEFAULT", "Matches the vanilla game's coasters."];
config_state[2][1] = ["MATCH", "Coasters match the chosen party."];
config_state[2][2] = ["FIXED", "Use the chosen coaster type."];
config_info[3] = ["Enable Tea", "Adds preservatives to the tea from Chapter 2."];
config_state[3][0] = ["OFF", "Own-flavored tea rots like normal."];
config_state[3][1] = ["ON", "Own-flavored tea will stay fresh."];
config_info[4] = ["  Type", config_info[2][1] + config_state[2][2][0] + " - " + config_state[2][2][1]];
config_state[4][0] = ["Spamton NEO", ""];
config_state[4][1] = ["Kris", ""];
config_state[4][2] = ["Susie", ""];
config_state[4][3] = ["Ralsei", ""];
config_state[4][4] = ["Noelle", ""];
config_state[4][5] = ["Berdly", ""];
config_max[0] = array_length(config_state[0]) - 1;
config_max[1] = array_length(config_state[1]) - 1;
config_max[2] = array_length(config_state[2]) - 1;
config_max[3] = array_length(config_state[3]) - 1;
config_max[4] = array_length(config_state[4]) - 1;
config_list[0] = 0;
config_list[1] = 1;
switch (global.chapter)
{
    case 2:
        if (global.modconfig[2] == 2)
        {
            config_list = [0, 1, 2, 4];
        }
        else
        {
            config_list = [0, 1, 2];
        }
        break;
    case 3:
    case 4:
        config_list = [0, 1, 3];
        break;
    default:
        config_list = [0, 1];
        break;
}

// required misc variables from obj_darkcontroller
// input buffers
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
cur_jewel = 0; // box corners
menusiner = 0; // heart sprite w/ arrows

// draw over other menus, namely obj_darkcontroller
depth = -1000;

// isolated variables for menu navigation
partyMenu = 0;
partySelect = 0;
charSelect = 1;
charChange = 0; // this is a mediator for charSelect

// make list of character-specific portions of text
//
// array length also limits the range of characters
// might use this for ch 1, but too much is different for my script to work
charList[0] = ["", ""];
charList[1] = ["Krises", ""];
charList[2] = ["Susies", "S-Action"];
charList[3] = ["Ralseis", "R-Action"];
charList[4] = ["Noelles", "N-Action"];

// initialize warning variables, alongside the associated text
flavorText = ["Customize your party at will!", "(Don't expect cutscenes to look normal.)"];

warnPrefix = "[!] ";

krisWarnText = "Kris's ACTs might not work as intended.";
krisWarn = 0;

slot1WarnText = "~1 doesn't work from Slot 1.";
slot1Warn = 0;

emptyWarnText = "An empty party is VERY UNSTABLE!";
emptyWarn = 0;

dupeWarnText = "ACTing with multiple ~1 might break.";
dupeWarn = 0;
dupeChar = 0;

gapWarnText = "Gaps in the party are likely to crash.";
gapWarn = 0;

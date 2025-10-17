// input buffers
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;

// menu setup + navigation
cur_jewel = 0;
menusiner = 0;
depth = -1000; // move to front
partyMenu = 0;
partySelect = 0;

// Chapter 1 doesnt update charselect in the POWER menu...
if (global.charselect > -1)
{
    partySelect = global.charselect;
}
else
{
    global.charselect = 0;
}

charSelect = global.char[partySelect];
charChange = 0;
charMax = (global.chapter > 1) ? 4 : 3;

// warning text
flavorText = ["Customize your party at will!", "(Don't expect cutscenes to look normal.)"];
warnPrefix = "[!] ";

// ACTing with Kris overwrites slot 1's action,
// regardless of which slot Kris is in.
krisWarnText = "Kris's ACTs might not work as intended.";
krisWarn = 0;

// Taking damage with an empty party crashes the game,
// and it could cause other issues elsewhere but idk
emptyWarnText = "An empty party is VERY UNSTABLE!";
emptyWarn = 0;

// Having a character in slot 3 but not in slot 2 can
// act strange in a few places, like the battle menu
gapWarnText = "Gaps in the party are likely to crash.";
gapWarn = 0;

// Warnings relating to X-Actions, irrelevant for Chapter 1
if (global.chapter > 1)
{
    // X-Actions do nothing in slot 1, and could
    // mess with future acts in unpredictable ways.
    slot1WarnText = "~1 doesn't work from Slot 1.";
    slot1Warn = 0;

    // Theres 1 variable controlling each X-Action,
    // so the game can get stuck if using two in one turn.
    dupeWarnText = "ACTing with multiple ~1 might break.";
    dupeWarn = 0;
    dupeChar = 0;
}

// Character-Specific Text for X-Action Warnings.
charList[0] = ["", ""];
charList[1] = ["Krises", ""];
charList[2] = ["Susies", "S-Action"];
charList[3] = ["Ralseis", "R-Action"];
charList[4] = ["Noelles", "N-Action"];
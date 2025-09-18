// Description background, similar to the one that items and spells use
draw_set_color(c_black);
draw_rectangle(x - 10, y + 80, x + 650, y - 10, false);

// Set the font to the one obj_darkcontroller uses
scr_84_set_draw_font("mainbig");


// Custom Party Menu: 0 for selecting a slot and 1 for changing the character
// 
// Also checks if the current party could cause problems during battle
// and warns the player about any strange behavior I found during testing.

if (partyMenu == 0 || partyMenu == 1)
{
    var menu_x = x + 160;
    var menu_y = y + 150;
    var menu_width = 320;
    var menu_height = 190;

    // Reset the party warnings before starting the checks
    var showWarning = false;
    var showText = true;
    krisWarn = 0;
    slot1Warn = 0;
    emptyWarn = 0;
    gapWarn = 0;
    dupeWarn = 0;
    
    // Look for Kris in the 2nd and 3rd slots of the party.
    //
    // The battle code assumes Kris is in slot 1 when selecting an ACT,
    // overwriting the action of any other character in that slot.

    if (global.char[1] == 1 || global.char[2] == 1)
        krisWarn = 1;

    
    // Check if slot 1 has a character that isn't Kris.
    // 
    // The inverse of the other bug. Since the code for the X-Actions
    // doesn't check slot 1, they do nothing. Ignore for Chapter 1.

    if (global.char[0] > 1 && global.chapter > 1)
        slot1Warn = 1;

    
    // Check if the entire party is empty.
    // 
    // Surprisingly functional, but the game crashes when you take a hit.
    // Also you don't get any turns. Idk if it's possible to beat a fight like this lmao.

    if (global.char[0] == 0 && global.char[1] == 0 && global.char[2] == 0)
        emptyWarn = 1;

    
    // Check if there is a gap in the party. (Empty slot or Kris)
    // 
    // If there is a gap between Kris and whoever's following them, the game
    // will crash when starting a battle because of the little intro animation.

    if (global.char[1] <= 1 && global.char[2] > 1)
        gapWarn = 1;

    
    // Check if the party contains any duplicate characters.
    // 
    // Only affects ACTs, and could cause softlocks if you aren't careful.
    // Aside from that, a party of 3 Susies should work just fine (in this mod.)

    for (i = 0; i < 3; i++)
    {
        // Find the next possible pair of slots.
        if (i == 2)
        var otherSlot = 0;
        else
            otherSlot = i + 1;

        // Check if the chosen slots have the same characters.
        if (global.char[i] == global.char[otherSlot])
        {
            // Save which character there's a duplicate of.
            dupeChar = global.char[i];
            
            // Don't warn if there's 2 empty slots.
            if (dupeChar != 0)
                dupeWarn = 1;
        }
    }
    
    // Display the necessary warnings, depending on which slot is selected.
    //
    // The warning for an empty party overrides all other warnings,
    // since they likely wouldn't find any issue anyway.

    if (emptyWarn == 1)
    {
        showWarning = true;

        // Draw the main text describing the warning.
        draw_set_color(c_white);
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix + emptyWarnText));

        // Draw the "[!]" again with a different color.
        draw_set_color(c_red);
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix));
    }
    else if (partySelect != 3) // Don't show warnings if hovering over the config button.
    {
        // Warnings show up on line 2 by default.
        var warnPos = "#";
        
        if (dupeWarn == 1 && global.char[global.charselect] == dupeChar)
        {
            // if theres a different warning, hide the top row of the text
            // only attempt to draw the warning text if there's space
            if (showText)
            {
                if (showWarning)
                {
                    showText = false;
                    warnPos = "";
                }
                else
                {
                    showWarning = true;
                }
            
                // Draw the main text describing the warning.
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix + stringsetsub(dupeWarnText, charList[global.char[global.charselect]][0])));

                // Draw the prefix again with a different color.
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix));
            }
        }
        
        if (gapWarn == 1 && global.charselect == 1)
        {
            // if theres a different warning, hide the top row of the text
            // only attempt to draw the warning text if there's space
            if (showText)
            {
                if (showWarning)
                {
                    showText = false;
                    warnPos = "";
                }
                else
                {
                    showWarning = true;
                }
                
                // Draw the main text describing the warning.
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix + gapWarnText));

                // Draw the "[!]" again with a different color.
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix));
            }
        }
        
        if (krisWarn == 1 && global.char[global.charselect] == 1 && global.charselect != 0)
        {
            // if theres a different warning, hide the top row of the text
            // only attempt to draw the warning text if there's space
            if (showText)
            {
                if (showWarning)
                {
                    showText = false;
                    warnPos = "";
                }
                else
                {
                    showWarning = true;
                }
            
                // Draw the main text describing the warning.
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix + krisWarnText));

                // Draw the prefix again with a different color.
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix));
            }
        }
        
        if (slot1Warn == 1 && global.charselect == 0)
        {
            // if theres a different warning, hide the top row of the text
            // only attempt to draw the warning text if there's space
            if (showText)
            {
                if (showWarning)
                {
                    showText = false;
                    warnPos = "";
                }
                else
                {
                    showWarning = true;
                }
            
                // Draw the main text describing the warning.
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix + stringsetsub(slot1WarnText, charList[global.char[global.charselect]][1])));

                // Draw the "[!]" again with a different color.
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix));
            }
        }
    }
    
    if (showText) // only show if there isnt 2 warnings
    {
        draw_set_color(c_white);
        draw_text(x + 20, y + 10, string_hash_to_newline(flavorText[0]));
    }
    
    if (!showWarning) // only show if there arent currently warnings
    {
        draw_set_color(c_white);
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + flavorText[1]));
    }

    // Menu Background: black rectangle with the fancy menu borders
    draw_set_color(c_black);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
    scr_darkbox(menu_x - 10, menu_y - 10, menu_x + menu_width + 10, menu_y + menu_height + 10);
    
    // character portraits, same as from the existing menus
    // also draws a dot for empty slots, since they're never not selectable.
    for (i = 0; i < 3; i += 1)
    {
        chosen = 0.4;
        draw_set_color(c_dkgray);
        
        if (i == partySelect)
        {
            chosen = 1;
            draw_set_color(c_gray);
        }
        
        if (global.char[i] == 0)
            draw_text(menu_x + (50 * (i + 1)) + 4, menu_y + 75, stringset("."));
        else
        {
                draw_sprite_ext(spr_equipchar_ch2, global.char[i], menu_x + 32 + (i * 50), menu_y + 72, 2, 2, 0, c_white, chosen);
        }
    }
    draw_set_color(c_white);
    
    // selector heart for the party slot
    if (partyMenu == 0)
    {
        if (partySelect < 3)
            draw_sprite(spr_heart_harrows, menusiner / 20, menu_x + 42 + (partySelect * 50), menu_y + 53);

        menusiner++;
    }
    
    // warning indicators! draws an "!" over each character slot if theres a warning.
    // doesn't check for empty party warning, since i dont think its needed in that case
    if ((partyMenu != 0 || partySelect != 0) && ((slot1Warn == 1 && global.char[0] > 1) || (dupeWarn == 1 && global.char[0] == dupeChar)))
    {
        draw_set_color(c_yellow);
        draw_text(menu_x + 50, menu_y + 45, stringset("!"));
    }
    
    if ((partyMenu != 0 || partySelect != 1) && ((krisWarn == 1 && global.char[1] == 1) || (dupeWarn == 1 && global.char[1] == dupeChar) || (gapWarn == 1)))
    {
        draw_set_color(c_yellow);
        draw_text(menu_x + 100, menu_y + 45, stringset("!"));
    }
    
    if ((partyMenu != 0 || partySelect != 2) && ((krisWarn == 1 && global.char[2] == 1) || (dupeWarn == 1 && global.char[2] == dupeChar)))
    {
        draw_set_color(c_yellow);
        draw_text(menu_x + 150, menu_y + 45, stringset("!"));
    }
    draw_set_color(c_white);
    
    // change the config button's sprite depending on if its selected or not
    // 0: selected button with heart, 1: not selected
    var buttonState = 1;

    if (partySelect == 3)
        buttonState = 0;
    else
        buttonState = 1;

    draw_sprite_ext(spr_darkconfigbt, buttonState, menu_x + 215, menu_y + 63, 2, 2, 0, c_white, 1);
    
    // menu title
    draw_text(menu_x + 80, menu_y + 12, stringset("Custom Party"));
    // character separator
    draw_rectangle(menu_x, menu_y + 131, menu_x + menu_width, menu_y + 136, false);
    draw_sprite_ext(spr_dmenu_captions, 0, menu_x + 116, menu_y + 126, 2, 2, 0, c_white, 1)
    
    // check if the char selector is active, and dim the icons accordingly.
    var blendColor = 16777215;
    
    if (partyMenu == 1)
        blendColor = 16777215;
    else
        blendColor = 8421504;
    
    draw_sprite_ext(spr_headkris, (global.char[global.charselect] != 1) * 8, menu_x + 41, menu_y + 152, 1, 1, 0, blendColor, 1);
    draw_sprite_ext(spr_headsusie, (global.char[global.charselect] != 2) * 8, menu_x + 112, menu_y + 152, 1, 1, 0, blendColor, 1);
    draw_sprite_ext(spr_headralsei, (global.char[global.charselect] != 3) * 8, menu_x + 183, menu_y + 152, 1, 1, 0, blendColor, 1);
    if (global.chapter > 1)
    draw_sprite_ext(spr_headnoelle, (global.char[global.charselect] != 4) * 8, menu_x + 254, menu_y + 152, 1, 1, 0, blendColor, 1);
    
    // selector heart for the char selector
    if (partyMenu == 1)
        draw_sprite_ext(spr_heart, 0, (menu_x + (charSelect * 71)) - 51, menu_y + 156, 1, 1, 0, c_white, 1);
}
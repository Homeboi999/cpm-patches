draw_set_color(c_black);
draw_rectangle(x - 10, y + 80, x + 650, y - 10, false);
scr_84_set_draw_font("mainbig");
if (partyMenu == 0 || partyMenu == 1)
{
    var menu_x = x + 160;
    var menu_y = y + 150;
    var menu_width = 320;
    var menu_height = 190;
    var showWarning = false;
    var showText = true;
    krisWarn = 0;
    slot1Warn = 0;
    emptyWarn = 0;
    gapWarn = 0;
    dupeWarn = 0;
    if (global.char[1] == 1 || global.char[2] == 1)
    {
        krisWarn = 1;
    }
    if (global.char[0] > 1 && global.chapter > 1)
    {
        slot1Warn = 1;
    }
    if (global.char[0] == 0 && global.char[1] == 0 && global.char[2] == 0)
    {
        emptyWarn = 1;
    }
    if (global.char[1] <= 1 && global.char[2] > 1)
    {
        gapWarn = 1;
    }
    for (i = 0; i < 3; i++)
    {
        var otherSlot;
        if (i == 2)
        {
            otherSlot = 0;
        }
        else
        {
            otherSlot = i + 1;
        }
        if (global.char[i] == global.char[otherSlot])
        {
            dupeChar = global.char[i];
            if (dupeChar != 0)
            {
                dupeWarn = 1;
            }
        }
    }
    if (emptyWarn == 1)
    {
        showWarning = true;
        draw_set_color(c_white);
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix + emptyWarnText));
        draw_set_color(c_red);
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix));
    }
    else if (partySelect != 3)
    {
        var warnPos = "#";
        if (dupeWarn == 1 && global.char[global.charselect] == dupeChar)
        {
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
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix + stringsetsub(dupeWarnText, charList[global.char[global.charselect]][0])));
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline("#" + warnPrefix));
            }
        }
        if (gapWarn == 1 && global.charselect == 1)
        {
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
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix + gapWarnText));
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix));
            }
        }
        if (krisWarn == 1 && global.char[global.charselect] == 1 && global.charselect != 0)
        {
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
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix + krisWarnText));
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix));
            }
        }
        if (slot1Warn == 1 && global.charselect == 0)
        {
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
                draw_set_color(c_white);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix + stringsetsub(slot1WarnText, charList[global.char[global.charselect]][1])));
                draw_set_color(c_yellow);
                draw_text(x + 20, y + 10, string_hash_to_newline(warnPos + warnPrefix));
            }
        }
    }
    if (showText)
    {
        draw_set_color(c_white);
        draw_text(x + 20, y + 10, string_hash_to_newline(flavorText[0]));
    }
    if (!showWarning)
    {
        draw_set_color(c_white);
        draw_text(x + 20, y + 10, string_hash_to_newline("#" + flavorText[1]));
    }
    draw_set_color(c_black);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
    scr_darkbox(menu_x - 10, menu_y - 10, menu_x + menu_width + 10, menu_y + menu_height + 10);
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
        {
            draw_text(menu_x + (50 * (i + 1)) + 4, menu_y + 75, stringset("."));
        }
        else
        {
            draw_sprite_ext(spr_equipchar_ch2, global.char[i], menu_x + 32 + (i * 50), menu_y + 72, 2, 2, 0, c_white, chosen);
        }
    }
    draw_set_color(c_white);
    if (partyMenu == 0)
    {
        if (partySelect < 3)
        {
            draw_sprite(spr_heart_harrows, menusiner / 20, menu_x + 42 + (partySelect * 50), menu_y + 53);
        }
        menusiner++;
    }
    if ((partyMenu != 0 || partySelect != 0) && ((slot1Warn == 1 && global.char[0] > 1) || (dupeWarn == 1 && global.char[0] == dupeChar)))
    {
        draw_set_color(c_yellow);
        draw_text(menu_x + 50, menu_y + 45, stringset("!"));
    }
    if ((partyMenu != 0 || partySelect != 1) && ((krisWarn == 1 && global.char[1] == 1) || (dupeWarn == 1 && global.char[1] == dupeChar) || gapWarn == 1))
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
    var buttonState = 1;
    if (partySelect == 3)
    {
        buttonState = 0;
    }
    else
    {
        buttonState = 1;
    }
    draw_sprite_ext(spr_darkconfigbt, buttonState, menu_x + 215, menu_y + 63, 2, 2, 0, c_white, 1);
    draw_text(menu_x + 80, menu_y + 12, stringset("Custom Party"));
    draw_rectangle(menu_x, menu_y + 131, menu_x + menu_width, menu_y + 136, false);
    draw_sprite_ext(spr_dmenu_captions, 0, menu_x + 116, menu_y + 126, 2, 2, 0, c_white, 1);
    var blendColor = 16777215;
    if (partyMenu == 1)
    {
        blendColor = 16777215;
    }
    else
    {
        blendColor = 8421504;
    }
    draw_sprite_ext(spr_headkris, (global.char[global.charselect] != 1) * 8, menu_x + 41, menu_y + 152, 1, 1, 0, blendColor, 1);
    draw_sprite_ext(spr_headsusie, (global.char[global.charselect] != 2) * 8, menu_x + 112, menu_y + 152, 1, 1, 0, blendColor, 1);
    draw_sprite_ext(spr_headralsei, (global.char[global.charselect] != 3) * 8, menu_x + 183, menu_y + 152, 1, 1, 0, blendColor, 1);
    if (global.chapter > 1)
    {
        draw_sprite_ext(spr_headnoelle, (global.char[global.charselect] != 4) * 8, menu_x + 254, menu_y + 152, 1, 1, 0, blendColor, 1);
    }
    if (partyMenu == 1)
    {
        draw_sprite_ext(spr_heart, 0, (menu_x + (charSelect * 71)) - 51, menu_y + 156, 1, 1, 0, c_white, 1);
    }
}

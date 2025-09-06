if (!init)
{
    init = true;
    HeroType = global.char[HeroID];
    switch (CoasterType)
    {
        case 0:
            default_sprite_front = spr_sneo_car_front;
            default_sprite_back = spr_sneo_car_back;
            back_offset_x = 1;
            back_offset_y = -35;
            coaster_offset_x = 0;
            coaster_offset_y = -19;
            break;
        case 1:
            default_sprite_front = spr_kris_coaster_front;
            hurt_sprite_front = spr_kris_coaster_hurt_front;
            default_sprite_back = spr_kris_coaster_back;
            back_offset_x = 0;
            back_offset_y = -37;
            coaster_offset_x = 0;
            coaster_offset_y = -21;
            character_offset_x = 11;
            character_offset_y = 2;
            break;
        case 2:
            default_sprite_front = spr_susie_coaster_front;
            hurt_sprite_front = spr_susie_coaster_hurt_front;
            default_sprite_back = spr_susie_coaster_back;
            back_offset_x = 0;
            back_offset_y = -35;
            coaster_offset_x = 0;
            coaster_offset_y = -21;
            character_offset_x = 15;
            character_offset_y = -4;
            break;
        case 3:
            default_sprite_front = spr_ralsei_coaster_front;
            hurt_sprite_front = spr_ralsei_coaster_hurt_front;
            default_sprite_back = spr_ralsei_coaster_back;
            back_offset_x = -10;
            back_offset_y = -43;
            coaster_offset_x = -10;
            coaster_offset_y = -24;
            character_offset_x = -2;
            character_offset_y = -10;
            break;
        case 4:
            default_sprite_front = spr_noelle_coaster_front;
            hurt_sprite_front = spr_noelle_coaster_front;
            default_sprite_back = -1;
            character_offset_x = 4;
            character_offset_y = -15;
            coaster_offset_x = -17;
            coaster_offset_y = 35;
            coaster_offset_x += (2 * sprite_get_width(default_sprite_front));
            coaster_offset_y -= (2 * sprite_get_height(default_sprite_front));
            coaster_scale_x = -1;
            break;
    }
    switch (HeroType)
    {
        case 0:
            visible = 0;
            break;
        case 1:
            character_offset_x += 5;
            character_offset_y += 9;
            break;
        case 2:
            character_offset_x -= 5;
            character_offset_y -= 2;
            break;
        case 4:
            character_offset_x += 12;
            character_offset_y -= 4;
            break;
    }
}
if (o_coaster_controller_sneo.actcon == 1 && o_coaster_controller_sneo.timer < o_coaster_controller_sneo.timermax)
{
    if ((button1_p() && HeroID == 0 && gooffscreen == 0) || (button2_p() && HeroID == 1 && gooffscreen == 0) || (button3_p() && HeroID == 2 && gooffscreen == 0))
    {
        if (visible == 1)
        {
            if (button1_p() && HeroID == 0)
            {
                draw_button_press = 0;
            }
            if (button2_p() && HeroID == 1)
            {
                draw_button_press = 0;
            }
            if (button3_p() && HeroID == 2)
            {
                draw_button_press = 0;
            }
            mykeybuffer = 3;
            o_coaster_controller_sneo.playerinput = 1;
        }
    }
}
if (o_coaster_controller_sneo.actcon != 0)
{
    actoncondelay = 1;
}
if (instance_exists(obj_battleblcon))
{
    actoncondelay = 0;
}
if (disabled == 1)
{
    disabledtimer--;
    if (disabledtimer <= 0)
    {
        disabled = 0;
    }
}
if (con == 0)
{
    siner += 0.4;
    if (gooffscreen == 0)
    {
        x = xstart + (sin(siner / 6) * 3);
    }
    if (mykeybuffer > 0 && disabled == 0)
    {
        con = 1;
        dashtimer = 0;
        damaged = 0;
        with (o_coaster_controller_sneo)
        {
            buttonspressed += 1;
        }
    }
}
if (con == 1)
{
    if (nitro == 0)
    {
        hspeed += 4;
        if (hspeed > 30)
        {
            hspeed = 30;
        }
    }
    if (nitro == 1)
    {
        hspeed += 8;
        if (hspeed > 60)
        {
            hspeed = 60;
        }
    }
    smoketimer += 2;
    if (smoketimer >= 3)
    {
        smoke = instance_create(x + hspeed + 8, y - 10, o_coastersmoke);
        smoketimer = 0;
    }
    if (x >= (camerax() + 200))
    {
        con = 2;
    }
    if (damaged == 1)
    {
        con = 5;
        hspeed = -48;
        if (nitro == 1)
        {
            hspeed = -200;
        }
    }
}
if (con == 2)
{
    if (damaged == 1)
    {
        con = 5;
    }
    if (hspeed >= -6)
    {
        hspeed -= 2;
    }
    if (nitro == 1)
    {
        hspeed -= 1;
        if (x >= (camerax() + 400) && hspeed > 0)
        {
            hspeed = -2;
        }
    }
    if (x <= (xstart + 10))
    {
        damaged = 0;
        hspeed = 0;
        siner = 0;
        con = 0;
    }
}
if (con == 5)
{
    hspeed = -30;
    if (nitro == 1)
    {
        hspeed = -100;
    }
    if (x <= (xstart - hspeed))
    {
        hspeed = 0;
        damaged = 0;
        siner = 0;
        con = 0;
    }
}
mykeybuffer -= 1;


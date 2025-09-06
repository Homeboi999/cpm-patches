if (instance_exists(obj_berdlyb_enemy) && obj_berdlyb_enemy.nitro > 0)
{
    nitro = 1;
}
else
{
    nitro = 0;
}
if (o_coaster_controller.actcon == 1 && o_coaster_controller.timer < o_coaster_controller.timermax && bump == 1)
{
    if (HeroType > 0 && gooffscreen == 0)
    {
        if (visible == 1)
        {
            bump = 0;
            mykeybuffer = 3;
            o_coaster_controller.playerinput = 1;
            if (sprite_index != heroInstance.actsprite || (sprite_index == heroInstance.actsprite && image_index > heroInstance.actframes))
            {
                sprite_index = heroInstance.actsprite;
                image_index = 0;
                forceact = 1;
                image_speed = 0.5;
            }
        }
    }
}
if (o_coaster_controller.actcon != 0)
{
    actoncondelay = 1;
}
if (instance_exists(obj_battleblcon))
{
    actoncondelay = 0;
}
if (o_coaster_controller.actcon == 0 && actoncondelay == 0 && endscene == 0)
{
    if (forceact == 0 && instance_exists(heroInstance))
    {
        sprite_index = heroInstance.sprite_index;
        image_index = heroInstance.image_index - 1;
    }
}
if (instance_exists(heroInstance))
{
    if (sprite_index == heroInstance.actsprite && image_index > heroInstance.actframes)
    {
        heroInstance.sprite_index = heroInstance.idlesprite;
        image_speed = 0.25;
        forceact = 0;
    }
    if (forceact == 1 && introanim == 1)
    {
        if ((sprite_index == spr_ralsei_battleintro && image_index > 10) || (sprite_index == spr_noelleb_battleintro && image_index > 10))
        {
            sprite_index = heroInstance.idlesprite;
            image_speed = 0;
            image_index = 9;
            forceact = 0;
            introanim = 0;
        }
        else if (sprite_index == heroInstance.attacksprite && image_index > heroInstance.attackframes)
        {
            sprite_index = heroInstance.idlesprite;
            image_speed = 0;
            image_index = 0;
            forceact = 0;
            introanim = 0;
        }
    }
}
userealsprite = 0;
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
    if (gooffscreen == 0 && endscene == 0)
    {
        x = xstart + (sin(siner / 6) * 3);
    }
    if (mykeybuffer > 0 && disabled == 0)
    {
        con = 1;
        snd_play_pitch(snd_drive, 1 + random(0.2));
        dashtimer = 0;
        damaged = 0;
        with (o_coaster_controller)
        {
            buttonspressed += 1;
        }
    }
}
if (con == 1)
{
    if (nitro == 0)
    {
        if (obj_berdlyb_enemy.bumpactfast == 1)
        {
            hspeed += 6;
            if (hspeed > 45)
            {
                hspeed = 45;
            }
        }
        else
        {
            hspeed += 4;
            if (hspeed > 30)
            {
                hspeed = 30;
            }
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


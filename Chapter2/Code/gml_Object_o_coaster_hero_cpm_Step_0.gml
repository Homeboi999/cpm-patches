// cant put this in Create event cuz the 
// variables need to be set manually
if (!init)
{
    init = true;

    // set HeroType and find battle object
    HeroType = global.char[HeroID];

    // set coaster offsets
    switch (CoasterType)
    {
        // spamton neo
        case 7:
            default_sprite_front = spr_sneo_car_front;
            default_sprite_back = spr_sneo_car_back;
            back_offset_x = 1;
            back_offset_y = -35;
            coaster_offset_x = 0;
            coaster_offset_y = -19;

            // dont adjust per-sprite like other coasters
            // (now character_offset_y is the only offset)
            factor_y = 0;
            character_offset_x = -5;
            character_offset_y = -90;

            break;
        
        // kris
        case 1:
            default_sprite_front = spr_kris_coaster_front;
            hurt_sprite_front = spr_kris_coaster_hurt_front;
            default_sprite_back = spr_kris_coaster_back;
            back_offset_x = 0;
            back_offset_y = -37;
            coaster_offset_x = 0;
            coaster_offset_y = -23;
            break;

        // susie
        case 2:
            default_sprite_front = spr_susie_coaster_front;
            hurt_sprite_front = spr_susie_coaster_hurt_front;
            default_sprite_back = spr_susie_coaster_back;
            back_offset_x = 0;
            back_offset_y = -35;
            coaster_offset_x = 0;
            coaster_offset_y = -23;
            character_offset_x = -4;
            break;

        // ralsei
        case 3:
            default_sprite_front = spr_ralsei_coaster_front;
            hurt_sprite_front = spr_ralsei_coaster_hurt_front;
            default_sprite_back = spr_ralsei_coaster_back;
            back_offset_x = -10;
            back_offset_y = -43;
            coaster_offset_x = -10;
            coaster_offset_y = -26;
            break;

        // noelle
        case 4:
            default_sprite_front = spr_noelle_coaster_front;
            hurt_sprite_front = spr_noelle_coaster_front;
            default_sprite_back = -1;
            character_offset_x = 4;
            character_offset_y = -10;
            coaster_offset_x = -17;
            coaster_offset_y = 35;
            coaster_offset_x += (2 * sprite_get_width(default_sprite_front));
            coaster_offset_y -= (2 * sprite_get_height(default_sprite_front));
            coaster_scale_x = -1;
            break;
    }

    // starting as visible crashes on empty slots
    if (CoasterType != 0)
    {
        visible = true;
    }

    // char-specific offsets
    if (CoasterType == 7)
    {
        // unique offsets for spamton coaster
        switch (HeroType)
        {
            // kris
            case 1:
                character_offset_y += 6;
                break;

            // susie
            case 2:
                character_offset_x += -11;
                character_offset_y += -5;
                break;
            
            // ralsei
            case 3:
                character_offset_x += -5;
                character_offset_y += -3;
                break;
                break;
            
            // noelle
            case 4:
                character_offset_x += 5;
                character_offset_y += -5;
                break;
        }

    }
    else
    {
        // base offsets for other coasters
        switch (HeroType)
        {
            // kris
            case 1:
                character_offset_x += 2;
                character_offset_y += 1;
                break;

            // susie
            case 2:
                character_offset_x += -6;
                character_offset_y += -1;
                break;
            
            // noelle
            case 4:
                character_offset_x += 4;
                character_offset_y += -12;
                break;
        }
    }
}

// extra init check for obj_battlecontroller
// cuz spamton spawns the coasters early
if (i_ex(obj_battlecontroller) && !heroInit)
{
    // dont try to set if empty party slot
    if (HeroType > 0)
    {
        // check against default value for 
        // charinstance (try to prevent crashes)
        if (global.charinstance[HeroID] != 12129292)
        {
            heroInstance = global.charinstance[HeroID];
            heroInit = true;
        }
    }
    else
    {
        heroInit = true;
    }
}

// berdly logic
if (i_ex(obj_berdlyb_enemy))
{
    if (obj_berdlyb_enemy.nitro > 0)
    {
        nitro = 1;
    }
    else
    {
        nitro = 0;
    }

    // act sprite for bump?
    if (i_ex(o_coaster_controller))
    {
        if (o_coaster_controller.actcon == 1 && o_coaster_controller.timer < o_coaster_controller.timermax && bump == 1)
        {
            if (HeroType > 0 && gooffscreen == 0 && visible == 1)
            {
                bump = 0;
                mykeybuffer = 3;
                o_coaster_controller.playerinput = 1;

                if (instance_exists(heroInstance) && (sprite_index != heroInstance.actsprite || (sprite_index == heroInstance.actsprite && image_index > heroInstance.actframes)))
                {
                    sprite_index = heroInstance.actsprite;
                    image_index = 0;
                    forceact = 1;
                    image_speed = 0.5;
                }
            }
        }

        if (o_coaster_controller.actcon != 0)
        {
            actoncondelay = 1;
        }
    }
}

if (instance_exists(obj_battleblcon))
{
    actoncondelay = 0;
}

var controller_actcon = 0;

// diff coaster controllers...
if (i_ex(o_coaster_controller))
{
    controller_actcon = o_coaster_controller.actcon;
}

if (i_ex(o_coaster_controller_sneo))
{
    controller_actcon = o_coaster_controller_sneo.actcon;
}

if (instance_exists(heroInstance))
{
    // forceact checking
    if (controller_actcon == 0 && actoncondelay == 0 && endscene == 0)
    {
        if (forceact == 0)
        {
            sprite_index = heroInstance.sprite_index;
            image_index = heroInstance.image_index - 1;
        }
    }

    // end act anim??
    if (sprite_index == heroInstance.actsprite && image_index > heroInstance.actframes)
    {
        heroInstance.sprite_index = heroInstance.idlesprite;
        image_speed = 0.25;
        sprite_index = heroInstance.idlesprite;
        forceact = 0;
    }

    // intro animations
    if (forceact == 1 && introanim == 1)
    {
        // ralsei and noelle have unique anims
        // susie and kris use their attack anims
        if (sprite_index == spr_ralsei_battleintro || sprite_index == spr_noelleb_battleintro)
        {
            sprite_index = heroInstance.idlesprite;
            image_speed = 0;
            image_index = 9;
            forceact = 0;
            introanim = 0;
        }
        else if (sprite_index == heroInstance.attacksprite)
        {
            sprite_index = heroInstance.idlesprite;
            image_speed = 0;
            image_index = 0;
            forceact = 0;
            introanim = 0;
        }
    }
}

// anim offsets (skipped for sneo variant)
if (CoasterType != 7)
{
    switch (HeroType)
    {
        // kris
        case 1:
            if (sprite_index == spr_krisb_idle)
            {
                anim_offset_x = 4;
                anim_offset_y = -11;
            }
            else if (sprite_index == spr_krisb_attack || sprite_index == spr_krisb_attackready)
            {
                anim_offset_x = 0;
                anim_offset_y = 8;
            }
            else if (sprite_index == spr_krisb_victory)
            {
                anim_offset_x = 0;
                anim_offset_y = -11;
            }
            else if (sprite_index == spr_krisr_dark)
            {
                anim_offset_x = 5;
                anim_offset_y = -10;
            }
            else
            {
                anim_offset_x = 0;
                anim_offset_y = 0;
            }
            break;

        // susie
        case 2:
            if (sprite_index == spr_susieb_idle || sprite_index == spr_susieb_item || sprite_index == spr_susieb_itemready)
            {
                anim_offset_x = 0;
                anim_offset_y = -9;
            }
            else if (sprite_index == spr_susie_right_dw)
            {
                anim_offset_x = 10;
                anim_offset_y = -13;
            }
            else
            {
                anim_offset_x = 0;
                anim_offset_y = 0;
            }
            break;

        // ralsei
        case 3:
            if (sprite_index == spr_ralsei_idle)
            {
                anim_offset_x = -12;
                anim_offset_y = -9;
            }
            else if (sprite_index == spr_ralsei_act || sprite_index == spr_ralsei_actready)
            {
                anim_offset_x = -12;
                anim_offset_y = 0;
            }
            else if (sprite_index == spr_ralsei_walk_right || sprite_index == spr_ralsei_right)
            {
                anim_offset_x = 0;
                anim_offset_y = -16;
            }
            else if (sprite_index == spr_ralsei_victory)
            {
                anim_offset_x = 0;
                anim_offset_y = -9;
            }
            else if (sprite_index == spr_ralsei_walk_right)
            {
                anim_offset_x = 1;
                anim_offset_y = -2;
            }
            else
            {
                anim_offset_x = 0;
                anim_offset_y = 0;
            }
            break;

        // noelle doesnt have any
    }

    // susie's sprite-height weirdness
    if (HeroType == 2)
    {
        if (sprite_index == spr_susieb_actready || sprite_index == spr_susieb_act || sprite_index == spr_susie_actready || sprite_index == spr_susie_act)
        {
            factor_y = 1.5;
        }
        else if (sprite_index == spr_susieb_attackready || sprite_index == spr_susieb_attack || sprite_index == spr_susie_attackready || sprite_index == spr_susie_attack)
        {
            factor_y = 1.5;
        }
        else if (sprite_index == spr_susieb_defend || sprite_index == spr_susie_defend)
        {
            factor_y = 1.5;
        }
        else if (sprite_index == spr_susie_spell || sprite_index == spr_susie_spellready)
        {
            factor_y = 1.5;
        }
        else if (sprite_index == spr_susie_rudebuster)
        {
            factor_y = 1.5;
        }
        else
        {
            factor_y = 2;
        }
    }
}

// berdly logic
if (endscene == 1 && instance_exists(obj_ch2_scene11a))
{
    var temp_offset_x = 0;
    var temp_offset_y = 0;
    if (HeroID == 0)
    {
        temp_offset_x = obj_ch2_scene11a.coaster_kris.x + obj_ch2_scene11a.coaster_kris.sinerx + obj_ch2_scene11a.coaster_kris.coaster_offset_x;
    }
    if (HeroID == 1)
    {
        temp_offset_x = obj_ch2_scene11a.coaster_susie.x + obj_ch2_scene11a.coaster_susie.sinerx + obj_ch2_scene11a.coaster_susie.coaster_offset_x;
    }
    if (HeroID == 2)
    {
        temp_offset_x = obj_ch2_scene11a.coaster_ralsei.x + obj_ch2_scene11a.coaster_ralsei.sinerx + obj_ch2_scene11a.coaster_ralsei.coaster_offset_x;
    }
    if (endscenetimer < 10)
    {
        endscenetimer++;
    }
    x = lerp(x, temp_offset_x - coaster_offset_x, endscenetimer / 10);
}

if (disabled == 1)
{
    disabledtimer--;
    if (disabledtimer <= 0)
    {
        disabled = 0;
    }
}

// berdly logic
if (i_ex(o_coaster_controller))
{
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
            if (i_ex(obj_berdlyb_enemy) && obj_berdlyb_enemy.bumpactfast == 1)
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
}
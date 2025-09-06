if (!init)
{
    switch (CoasterType)
    {
        case 0:
            default_sprite_front = spr_sneo_car_front;
            default_sprite_back = spr_sneo_car_back;
            coaster_offset_x += -25;
            coaster_offset_y += 42;
            switch (HeroType)
            {
                case 1:
                    character_offset_y += 2;
                    break;
                case 2:
                    character_offset_x -= 2;
                    character_offset_y += 1;
                    break;
                case 3:
                    character_offset_x -= 5;
                    character_offset_y += 8;
                    break;
                case 4:
                    character_offset_x -= 5;
                    character_offset_y += 2;
                    break;
                case 0:
                    showCoaster = 0;
                    break;
            }
            break;
        case 1:
            default_sprite_front = spr_kris_coaster_front;
            default_sprite_back = spr_kris_coaster_back;
            hurt_sprite_front = spr_kris_coaster_hurt_front;
            hurt_sprite_back = spr_kris_coaster_hurt_back;
            coaster_offset_x += -25;
            coaster_offset_y += 40;
            break;
        case 2:
            default_sprite_front = spr_susie_coaster_front;
            default_sprite_back = spr_susie_coaster_back;
            hurt_sprite_front = spr_susie_coaster_hurt_front;
            hurt_sprite_back = spr_susie_coaster_hurt_back;
            coaster_offset_x += -24;
            coaster_offset_y += 42;
            break;
        case 3:
            default_sprite_front = spr_ralsei_coaster_front;
            default_sprite_back = spr_ralsei_coaster_back;
            hurt_sprite_front = spr_ralsei_coaster_hurt_front;
            hurt_sprite_back = spr_ralsei_coaster_hurt_back;
            coaster_offset_x += -30;
            coaster_offset_y += 34;
            break;
        case 4:
            default_sprite_front = spr_noelle_coaster_front;
            default_sprite_back = -1;
            coaster_offset_x += -43;
            coaster_offset_y += 18;
            character_offset_x = 10;
            character_offset_y = -15;
            coaster_scale_x = -1;
            coaster_offset_x += (2 * sprite_get_width(default_sprite_front));
            break;
        case 5:
            default_sprite_front = spr_berdly_coaster_front;
            default_sprite_back = spr_berdly_coaster_back;
            hurt_sprite_front = spr_berdly_coaster_hurt_front;
            hurt_sprite_back = spr_berdly_coaster_hurt_back;
            char_sprite_hurt = 1860;
            char_sprite_normal = 672;
            shocked_character_sprite = 1860;
            coaster_offset_x = -65;
            coaster_offset_y = 30;
            character_sprite = char_sprite_normal;
            break;
        case 6:
            default_sprite_front = spr_noelle_coaster_front;
            default_sprite_back = -1;
            character_sprite = spr_noelle_walk_left_dw;
            char_sprite_berdly_ramp = 720;
            coaster_offset_x = -65;
            coaster_offset_y = 46;
            character_sprite = char_sprite_normal;
            break;
    }
    switch (HeroType)
    {
        case 1:
            char_sprite_normal = 654;
            char_sprite_hurt = 1427;
            char_sprite_berdly_ramp = 654;
            char_sprite_sneo_intro = 1420;
            char_sprite_sneo_ball = 546;
            break;
        case 2:
            char_sprite_normal = 829;
            char_sprite_hurt = 1474;
            char_sprite_berdly_ramp = 1003;
            char_sprite_sneo_intro = 1003;
            char_sprite_sneo_ball = 544;
            character_offset_x += -3;
            character_offset_y += -14;
            break;
        case 3:
            char_sprite_normal = 800;
            char_sprite_hurt = 1516;
            char_sprite_berdly_ramp = 1003;
            char_sprite_sneo_intro = 1527;
            char_sprite_sneo_ball = 788;
            character_offset_y += -11;
            break;
        case 4:
            char_sprite_normal = 728;
            char_sprite_hurt = 1543;
            char_sprite_berdly_ramp = 720;
            char_sprite_sneo_intro = 720;
            char_sprite_sneo_ball = 3386;
            character_offset_x += -4;
            character_offset_y += -12;
            break;
        default:
            if (CoasterType < 5)
            {
                char_sprite_normal = 654;
                showHero = 0;
            }
            break;
    }
    character_sprite = char_sprite_normal;
    if (hurt_sprite_front == -1)
    {
        hurt_sprite_front = default_sprite_front;
    }
    actor = scr_dark_marker(0, 0, character_sprite);
    actor.visible = 0;
    coaster_offset_y += lane_coaster_y;
    character_offset_y += lane_coaster_y;
    init = 1;
}
if (character_sprite != actor.sprite_index && character_sprite != -1)
{
    actor.sprite_index = character_sprite;
    actor.image_index = 0;
}
else if (character_sprite == -1)
{
    character_sprite = char_sprite_normal;
}
if (con == 0)
{
    actor.image_speed = animate ? 0.25 : 0;
}
else
{
    image_speed = 0;
    if (HeroType == 1 && actor.image_index < 6)
    {
        actor.image_index += 0.25;
    }
    if (HeroType == 2 && actor.image_index < 5)
    {
        actor.image_index += 0.25;
    }
    if (HeroType == 3 && actor.image_index < 10)
    {
        actor.image_index += 0.5;
    }
    if (HeroType == 4 && actor.image_index < 10)
    {
        actor.image_index += 0.5;
    }
}
if (stop_siner == 1)
{
    sinerx = 0;
    battlecoasterx = ((camerax() + 122) - (laneID * 20)) + character_offset_x;
    repeat (4)
    {
        if (x < battlecoasterx)
        {
            x += 1;
        }
        if (x > battlecoasterx)
        {
            x -= 1;
        }
    }
}
else
{
    sinerx = 0;
    sinery = 0;
    if (siner_add0 != 0)
    {
        siner0 += siner_add0;
        if (siner_type0 == "sin")
        {
            sinmove = sin(siner0) * siner_amplitude0;
        }
        else
        {
            sinmove = cos(siner0) * siner_amplitude0;
        }
        if (siner_visual0 == 1)
        {
            sinerx += lengthdir_x(sinmove, siner_direction0);
            sinery += lengthdir_y(sinmove, siner_direction0);
        }
        else
        {
            x += lengthdir_x(sinmove, siner_direction0);
            y += lengthdir_y(sinmove, siner_direction0);
        }
    }
}


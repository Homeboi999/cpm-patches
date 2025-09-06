depth = 80 - (HeroID * 5);
if (HeroType > 0)
{
    if (instance_exists(obj_encounterbasic))
    {
        if (HeroType > 1 || HeroID == 0)
        {
            if (instance_exists(obj_encounterbasic.c[HeroID]))
            {
                obj_encounterbasic.c[HeroID].speed = 0;
                obj_encounterbasic.c[HeroID].depth = depth + 1;
            }
        }
    }
    else if (instance_exists(global.charinstance[HeroID]))
    {
        if (!char_offset_init)
        {
            hero_start_x = global.charinstance[HeroID].x;
            hero_start_y = global.charinstance[HeroID].y;
            char_offset_init = true;
        }
        else
        {
            global.charinstance[HeroID].x = hero_start_x + character_offset_x + lane_character_x;
            global.charinstance[HeroID].y = hero_start_y + character_offset_y + lane_character_y;
            global.charinstance[HeroID].depth = depth + 1;
        }
    }
}
if (default_sprite_back != -1)
{
    back.sprite_index = default_sprite_back;
    back.visible = 1;
    back.depth = depth + 1;
}
else
{
    back.sprite_index = spr_kris_coaster_back;
    back.visible = 0;
    back.depth = depth + 1;
}
switch (HeroID)
{
    case 0:
        cur_coaster_x = obj_ch2_sceneex2.coaster_kris.x + obj_ch2_sceneex2.coaster_kris.sinerx + obj_ch2_sceneex2.coaster_kris.coaster_offset_x;
        cur_coaster_y = obj_ch2_sceneex2.coaster_kris.y + obj_ch2_sceneex2.coaster_kris.sinery + obj_ch2_sceneex2.coaster_kris.coaster_offset_y;
        coaster_end_x = obj_ch2_sceneex2.coaster_kris.target_x_end;
        break;
    case 1:
        cur_coaster_x = obj_ch2_sceneex2.coaster_susie.x + obj_ch2_sceneex2.coaster_susie.sinerx + obj_ch2_sceneex2.coaster_susie.coaster_offset_x;
        cur_coaster_y = obj_ch2_sceneex2.coaster_susie.y + obj_ch2_sceneex2.coaster_susie.sinery + obj_ch2_sceneex2.coaster_susie.coaster_offset_y;
        coaster_end_x = obj_ch2_sceneex2.coaster_susie.target_x_end;
        break;
    case 2:
        cur_coaster_x = obj_ch2_sceneex2.coaster_ralsei.x + obj_ch2_sceneex2.coaster_ralsei.sinerx + obj_ch2_sceneex2.coaster_ralsei.coaster_offset_x;
        cur_coaster_y = obj_ch2_sceneex2.coaster_ralsei.y + obj_ch2_sceneex2.coaster_ralsei.sinery + obj_ch2_sceneex2.coaster_ralsei.coaster_offset_y;
        coaster_end_x = obj_ch2_sceneex2.coaster_ralsei.target_x_end;
        break;
}
coaster_target_x = 0;
coaster_target_y = 0;
if (lerpstate == 0)
{
    if (lerptimer < 10)
    {
        lerptimer++;
    }
    switch (HeroID)
    {
        case 0:
            coaster_target_x = 1705;
            coaster_target_y = 101;
            break;
        case 1:
            coaster_target_x = 1715;
            coaster_target_y = 182;
            break;
        case 2:
            coaster_target_x = 1710;
            coaster_target_y = 260;
            break;
    }
    x = lerp(cur_coaster_x, coaster_target_x + coaster_end_x, lerptimer / 10);
    y = lerp(cur_coaster_y, coaster_target_y, lerptimer / 10);
    if (lerptimer > 9 && instance_exists(global.charinstance[HeroID]))
    {
        lerptimer = 0;
        lerpstate = 1;
    }
}
if (lerpstate == 1)
{
    if (instance_exists(global.charinstance[HeroID]))
    {
        x = global.charinstance[HeroID].x - (character_offset_x + lane_character_x);
    }
}
if (lerpstate == 2)
{
    lerptimer += 1;
    hero_target_x = 0;
    switch (HeroID)
    {
        case 0:
            hero_target_x = 1710;
            break;
        case 1:
            hero_target_x = 1717;
            break;
        case 2:
            hero_target_x = 1712;
            break;
    }
    x = lerp(coaster_target_x, cur_coaster_x, lerptimer / 5);
    y = lerp(coaster_target_y, cur_coaster_y, lerptimer / 5);
    if (HeroType > 0)
    {
        if (instance_exists(global.charinstance[HeroID]))
        {
            global.charinstance[HeroID].x = lerp(hero_target_x + character_offset_x, cur_coaster_x, lerptimer / 5);
            if (HeroType == 2)
            {
                global.charinstance[HeroID].y += 0.5;
            }
        }
    }
    if (lerptimer == 4)
    {
        with (obj_coaster)
        {
            visible = 1;
        }
    }
    if (lerptimer > 4)
    {
        with (obj_coaster)
        {
            visible = 1;
        }
        with (obj_heroparent)
        {
            instance_destroy();
        }
        with (o_coaster_hero_sneo)
        {
            instance_destroy();
        }
        with (o_coaster_hero_back_sneo)
        {
            instance_destroy();
        }
        with (o_coaster_controller_sneo)
        {
            instance_destroy();
        }
        exit;
    }
}


// move back object with coaster
back.x = x + back_offset_x;
back.y = y + back_offset_y;

// change sprite based on heroInstance
var hurt = 0;

if (instance_exists(heroInstance))
{
    if (sprite_index == heroInstance.hurtsprite)
    {
        hurt = 1;
    }
    if (heroInstance.hurt > 0)
    {
        hurt = 1;
    }
}
// update o_coaster_hero_back
if (default_sprite_back != -1 && visible)
{
    // set hurt sprite
    if (hurt && hurt_sprite_back != -1)
    {
        back.sprite_index = hurt_sprite_back;
        back.image_index = 0;
    }
    else
    {
        back.sprite_index = default_sprite_back;
        back.image_index = 0;
    }

    back.visible = 1;
    back.image_xscale = 2 * coaster_scale_x;
}
else
{
    back.sprite_index = spr_kris_coaster_back;
    back.visible = 0;
}

// apply offsets for heroInstance.
userealsprite = 0;
var y_offset = 8;
depth = 80 - (HeroID * 5);
if (instance_exists(heroInstance))
{
    heroInstance.depth = depth + 1;

    if (sprite_index != heroInstance.idlesprite || dontshowherosprite < 1)
    {
        // no anim offsets for spamton coaster
        if (CoasterType != 7)
        {
            switch (HeroType)
            {
                // susie
                case 2:
                    if (heroInstance.sprite_index == spr_susie_rudebuster)
                    {
                        y_offset = 8;
                    }
                    else if (instance_exists(obj_rudebuster_anim))
                    {
                        obj_rudebuster_anim.x = x + 20 + character_offset_x + anim_offset_x;
                        obj_rudebuster_anim.y = (y - (sprite_get_height(sprite_index) * factor_y)) + character_offset_y + anim_offset_y + 64;
                        y_offset = 24;
                    }
                    else if (heroInstance.sprite_index == spr_susieb_spell)
                    {
                        y_offset = 64;
                    }
                    else if (heroInstance.sprite_index == spr_susieb_spellready)
                    {
                        y_offset = 27;
                    }
                    break;

                // ralsei
                case 3:
                    if (heroInstance.sprite_index == spr_ralsei_idle && sprite_index == spr_ralsei_spell)
                    {
                        y_offset = 0;
                    }
                    break;
            }
        }

        heroInstance.x = x + 20 + character_offset_x + anim_offset_x;
        heroInstance.y = (y - (sprite_get_height(sprite_index) * factor_y)) + character_offset_y + anim_offset_y + y_offset;
        userealsprite = 1;
        heroInstance.depth = depth + 1;
    }
    else if (dontshowherosprite > 0)
    {
        dontshowherosprite--;
        userealsprite = 0;
    }
    else
    {
        heroInstance.x = camerax() - 300;
    }
}

// spamton logic
if (i_ex(obj_ch2_sceneex2))
{
    // get positions from the non-battle coasters
    switch (HeroID)
    {
        case 0:
            cur_coaster_x = obj_ch2_sceneex2.coaster_kris.x + obj_ch2_sceneex2.coaster_kris.sinerx + lane_coaster_x;
            cur_coaster_y = obj_ch2_sceneex2.coaster_kris.y + obj_ch2_sceneex2.coaster_kris.sinery + lane_coaster_y;
            coaster_end_x = obj_ch2_sceneex2.coaster_kris.target_x_end;
            break;
        case 1:
            cur_coaster_x = obj_ch2_sceneex2.coaster_susie.x + obj_ch2_sceneex2.coaster_susie.sinerx + lane_coaster_x;
            cur_coaster_y = obj_ch2_sceneex2.coaster_susie.y + obj_ch2_sceneex2.coaster_susie.sinery + lane_coaster_y;
            coaster_end_x = obj_ch2_sceneex2.coaster_susie.target_x_end;
            break;
        case 2:
            cur_coaster_x = obj_ch2_sceneex2.coaster_ralsei.x + obj_ch2_sceneex2.coaster_ralsei.sinerx + lane_coaster_x;
            cur_coaster_y = obj_ch2_sceneex2.coaster_ralsei.y + obj_ch2_sceneex2.coaster_ralsei.sinery + lane_coaster_y;
            coaster_end_x = obj_ch2_sceneex2.coaster_ralsei.target_x_end;
            break;
    }

    // intro slide
    if (lerpstate == 0)
    {
        if (lerptimer < 10)
        {
            lerptimer++;
        }

        coaster_target_x = global.heromakex[HeroID] + lane_coaster_x;
        
        x = lerp(cur_coaster_x + coaster_end_x, coaster_target_x, lerptimer / 10);
        y = cur_coaster_y; // start already on the rail

        // advance stage once heroInstance exists
        if (lerptimer > 9 && instance_exists(heroInstance))
        {
            lerptimer = 0;
            lerpstate = 1;
        }
    }

    // mid-battle (i think?)
    if (lerpstate == 1)
    {
        x = coaster_target_x;
    }

    // after battle (unused i think?)
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
            if (instance_exists(heroInstance))
            {
                heroInstance.x = lerp(hero_target_x + character_offset_x, cur_coaster_x, lerptimer / 5);
                if (HeroType == 2)
                {
                    heroInstance.y += 0.5;
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
            with (o_coaster_hero_cpm)
            {
                instance_destroy();
            }
            with (o_coaster_hero_back)
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
}
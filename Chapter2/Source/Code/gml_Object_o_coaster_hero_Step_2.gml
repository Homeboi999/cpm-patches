back.x = x + back_offset_x;
back.y = y + back_offset_y;
if (default_sprite_back != -1)
{
    back.sprite_index = default_sprite_back;
    back.visible = 1;
}
else
{
    back.sprite_index = spr_kris_coaster_back;
    back.visible = 0;
}
userealsprite = 0;
var y_offset = 8;
depth = 80 - (HeroID * 5);
if (instance_exists(heroInstance))
{
    heroInstance.depth = depth + 1;
    if (sprite_index != heroInstance.idlesprite || dontshowherosprite < 1)
    {
        switch (HeroType)
        {
            case 2:
                if (instance_exists(obj_rudebuster_anim))
                {
                    obj_rudebuster_anim.x = x + 20 + character_offset_x + anim_offset_x;
                    obj_rudebuster_anim.y = (y - (sprite_get_height(sprite_index) * factor_y)) + character_offset_y + anim_offset_y;
                }
                break;
            case 3:
                if (heroInstance.sprite_index == spr_ralsei_idle && sprite_index == spr_ralsei_spell)
                {
                    y_offset = 0;
                }
                break;
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
    if (forceact == 1 && introanim == 1)
    {
        if ((sprite_index == spr_ralsei_battleintro && image_index) || (sprite_index == spr_noelleb_battleintro && image_index))
        {
            sprite_index = heroInstance.idlesprite;
            image_speed = 0;
            image_index = 9;
            forceact = 0;
            introanim = 0;
        }
        else if (sprite_index == heroInstance.attacksprite && image_index >= heroInstance.attackframes)
        {
            sprite_index = heroInstance.idlesprite;
            image_speed = 0;
            image_index = 0;
            forceact = 0;
            introanim = 0;
        }
    }
}


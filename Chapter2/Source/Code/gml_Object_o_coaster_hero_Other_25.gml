var hurt = 0;
if (instance_exists(heroInstance))
{
    if (sprite_index == heroInstance.hurtsprite)
    {
        hurt = 1;
    }
    if (instance_exists(heroInstance) && heroInstance.hurt > 0)
    {
        hurt = 1;
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
if (image_index < 0)
{
    image_index = 0;
}
if (userealsprite == 0)
{
    draw_sprite_ext(sprite_index, image_index, x + 20 + anim_offset_x + character_offset_x, (y - (sprite_get_height(sprite_index) * factor_y)) + anim_offset_y + character_offset_y + 8, image_xscale, image_yscale, 0, c_white, image_alpha);
}
if (hurt == 0)
{
    draw_sprite_ext(default_sprite_front, 0, x + coaster_offset_x, (y - sprite_get_height(default_sprite_front)) + coaster_offset_y + 8, image_xscale * coaster_scale_x, image_yscale, 0, c_white, image_alpha);
}
if (hurt == 1)
{
    draw_sprite_ext(hurt_sprite_front, 0, x + coaster_offset_x, (y - sprite_get_height(hurt_sprite_front)) + coaster_offset_y + 8, image_xscale * coaster_scale_x, image_yscale, 0, c_white, image_alpha);
}
if (hspeed < 0 || disabled == 1)
{
    if (userealsprite == 0)
    {
        draw_sprite_ext(sprite_index, image_index, x + 20 + anim_offset_x + character_offset_x, (y - (sprite_get_height(sprite_index) * factor_y)) + anim_offset_y + character_offset_x + 8, image_xscalex, image_yscale, 0, c_black, 0.4);
    }
    if (hurt == 0)
    {
        draw_sprite_ext(default_sprite_front, 0, x + coaster_offset_x, (y - sprite_get_height(default_sprite_front)) + coaster_offset_y + 8, image_xscale * coaster_scale_x, image_yscale, 0, c_black, 0.4);
    }
    if (hurt == 1)
    {
        draw_sprite_ext(hurt_sprite_front, 0, x + coaster_offset_x, (y - sprite_get_height(hurt_sprite_front)) + coaster_offset_y + 8, image_xscale * coaster_scale_x, image_yscale, 0, c_black, 0.4);
    }
}


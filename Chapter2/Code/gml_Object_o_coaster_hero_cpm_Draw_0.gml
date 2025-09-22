var hurt = 0;
if (CoasterType == 7)
{
    userealsprite = 1;
}
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
if (anim_markers)
{
    var charColor = 16777215;
    draw_sprite_ext(spr_pixel_white, 0, (x + 20 + character_offset_x) - 5, ((y - (sprite_get_height(sprite_index) * factor_y)) + character_offset_y + 8) - 5, 2.5, 2.5, 0, c_black, 1);
    if (i_ex(heroInstance))
    {
        draw_sprite_ext(spr_pixel_white, 0, heroInstance.x - 3, heroInstance.y - 3, 1.5, 1.5, 0, c_black, 1);
    }
    draw_sprite_ext(spr_pixel_white, 0, (x + 20) - 3, y - (sprite_get_height(sprite_index) * factor_y) - 3, 1.5, 1.5, 0, c_black, 1);
    switch (HeroType)
    {
        case 1:
            charColor = 16776960;
            break;
        case 2:
            charColor = 16711935;
            break;
        case 3:
            charColor = 65280;
            break;
        case 4:
            charColor = 65535;
            break;
    }
    draw_sprite_ext(spr_pixel_white, 0, (x + 20 + character_offset_x) - 4, ((y - (sprite_get_height(sprite_index) * factor_y)) + character_offset_y + 8) - 4, 2, 2, 0, charColor, 0.5);
    if (i_ex(heroInstance))
    {
        draw_sprite_ext(spr_pixel_white, 0, heroInstance.x - 2, heroInstance.y - 2, 1, 1, 0, charColor, 1);
    }
    draw_sprite_ext(spr_pixel_white, 0, (x + 20) - 2, y - (sprite_get_height(sprite_index) * factor_y) - 2, 1, 1, 0, c_white, 1);
}

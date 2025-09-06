back.x = x + back_offset_x + lane_coaster_x;
back.y = y + back_offset_y + lane_coaster_y;
draw_sprite_ext(default_sprite_front, 0, x + coaster_offset_x + lane_coaster_x, (y - sprite_get_height(default_sprite_front)) + coaster_offset_y + lane_coaster_y + 8, image_xscale * coaster_scale_x, image_yscale, 0, c_white, image_alpha);


var _center_x = (camerax() + (camerawidth() / 2)) - 20;
var _center_y = cameray() + 120;
reticle_over_good_shot = false;
if (place_meeting(x, y, obj_heroparent))
{
    reticle_over_good_shot = true;
}
switch (subact_state)
{
    case "init":
        with (enemy)
        {
            x = xstart;
            y = ystart;
            sprite_index = spr_shutta_idle;
            image_speed = 0.16666666666666666;
        }
        with (obj_monsterparent)
        {
            scr_move_to_point_over_time(x + 180, y, 8);
        }
        with (obj_heroparent)
        {
            if (global.charinstance[myself] != other.activenoelle)
            {
                scr_move_to_point_over_time(x - 180, y, 8);
            }
        }
        noelle_walk_time = 0;
        noelle_walk_duration = floor(point_distance(activenoelle.x, activenoelle.y, _center_x, _center_y) / 10);
        subact_state = "noelle_move";
        if (i_ex(activenoelle))
        {
            activenoelle.state = 0;
            global.faceaction[activenoelle.myself] = 0;
        }
        break;
    case "noelle_move":
        if (noelle_walk_time == 0)
        {
            scr_battle_sprite_set(activenoelle.myself, spr_noelle_walk_right_dw, 0.5, true);
            with (activenoelle)
            {
                scr_move_to_point_over_time(_center_x, _center_y, other.noelle_walk_duration);
            }
        }
        noelle_walk_time++;
        if (noelle_walk_time == noelle_walk_duration)
        {
            scr_battle_sprite_set(activenoelle.myself, spr_noelle_walk_down_dw, 0, true);
            subact_state = "noelle_stand";
        }
        break;
    case "noelle_stand":
        break;
    case "capture":
        subact_state = "post_capture";
        if (got_kris && closest_hero == "kris")
        {
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_kris;
                if (global.flag[513] > 0)
                {
                    obj_shutta_photo_controller.endmessage = message_kris2;
                }
            }
            global.flag[513] = 1;
        }
        else if (got_susie && closest_hero == "susie")
        {
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_susie;
                if (global.flag[514] > 0)
                {
                    obj_shutta_photo_controller.endmessage = message_susie2;
                }
            }
            global.flag[514] = 1;
        }
        else if (got_ralsei && closest_hero == "ralsei")
        {
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                if (global.flag[515] == 0)
                {
                    obj_shutta_photo_controller.endmessage = message_ralsei;
                }
                if (global.flag[515] > 0)
                {
                    obj_shutta_photo_controller.endmessage = message_ralsei2;
                }
            }
            global.flag[515] = 1;
        }
        else if (got_noelle && closest_hero == "noelle")
        {
            enemy.photosuccesscount++;
            enemy.photosuccessballoon = 1;
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                {
                    mercygained += 10;
                }
                mercygained += 10;
            }
            else
            {
                if (powerphoto)
                {
                    mercygained += 20;
                }
                mercygained += 80;
            }
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_noelle;
                if (global.flag[516] > 0)
                {
                    obj_shutta_photo_controller.endmessage = message_noelle2;
                }
            }
            global.flag[516] = 1;
        }
        with (obj_heroparent)
        {
            if (global.charinstance[myself] != other.activenoelle)
            {
                x = xstart;
                y = ystart;
            }
        }
        with (enemy)
        {
            scr_move_to_point_over_time(xstart, ystart, 8);
            x = xstart;
            y = ystart;
        }
        break;
    case "post_capture":
        with (activenoelle)
        {
            x = xstart;
            y = ystart;
        }
        with (obj_monsterparent)
        {
            scr_move_to_point_over_time(xstart, ystart, 8);
            x = xstart;
            y = ystart;
        }
        instance_destroy(obj_move_to_point);
        scr_battle_sprite_reset(activenoelle.myself);
        break;
}

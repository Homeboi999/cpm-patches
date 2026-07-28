function scr_remakecaterpillar()
{
    for (var pos = 0; pos < 3; pos++)
    {
        if (pos == 0)
        {
            with (obj_mainchara)
            {
                self.name = scr_char_id_to_name(global.char[pos]) ?? "kris";
                scr_set_chara_sprites(self.name, visual_info);
                var alignment = scr_get_chara_alignment(self.name, visual_info);
                visual_info.halign = alignment.halign;
                visual_info.valign = alignment.valign;
            }
        }
        else if (instance_exists(global.cinstance[pos - 1]))
        {
            if (global.char[pos] > 0)
            {
                var name = scr_char_id_to_name(global.char[pos]);
                var alignment = scr_get_chara_alignment(name);
                
                with (global.cinstance[pos - 1])
                {
                    self.name = name;
                    scr_set_chara_sprites(self.name, self);
                    x = remx[target] - alignment.halign;
                    y = remy[target] - alignment.valign;
                }
            }
            else
            {
                with (global.cinstance[pos - 1])
                    instance_destroy();
            }
        }
        else if (global.char[pos] > 0)
        {
            var targetpos = 12 * pos;
            var name = scr_char_id_to_name(global.char[pos]);
            var alignment = scr_get_chara_alignment(name);
            var makex = obj_mainchara.remx[targetpos] - alignment.halign;
            var makey = obj_mainchara.remy[targetpos] - alignment.valign;
            global.charinstance[pos] = scr_makecaterpillar(makex, makey, global.char[pos], pos - 1);
        }
    }
}

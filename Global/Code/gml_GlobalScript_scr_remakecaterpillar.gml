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
        else
        {
            var chara = -4;
            chara = global.cinstance[pos - 1];
            if (instance_exists(chara))
            {
                if (global.char[pos] > 0)
                {
                    var name = scr_char_id_to_name(global.char[pos]);
                    with (chara)
                    {
                        self.name = name;
                        scr_set_chara_sprites(name, self);
                    }
                }
                else
                {
                    with (chara)
                    {
                        instance_destroy();
                    }
                }
            }
            else if (global.char[pos] > 0)
            {
                var targetpos = 12 * pos;
                var makex = obj_mainchara.remx[targetpos];
                var makey = obj_mainchara.remy[targetpos];
                scr_makecaterpillar(makex, makey, global.char[pos], pos - 1);
            }
        }
    }
}

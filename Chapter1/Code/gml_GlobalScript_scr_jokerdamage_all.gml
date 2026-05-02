function scr_jokerdamage_all()
{
    if (instance_exists(obj_joker))
    {
        if (global.inv < 0)
        {
            scr_damage_cache();
            remdamage = damage;
            _temptarget = target;
            for (ti = 0; ti < 3; ti += 1)
            {
                global.inv = -1;
                damage = remdamage;
                target = ti;
                if (global.hp[obj_joker.hpchar[ti]] > 0 && obj_joker.hpchar[ti] != 0)
                {
                    scr_jokerdamage();
                }
            }
            global.inv = global.invc * 40;
            target = _temptarget;
            scr_damage_check();
        }
    }
}

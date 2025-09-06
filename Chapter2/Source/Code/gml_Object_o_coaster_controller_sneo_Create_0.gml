timer = 0;
timermax = 180;
playerinput = 0;
playerinputtimer = 0;
actcon = 0;
krisgooffscreen = 0;
susiegooffscreen = 0;
ralseigooffscreen = 0;
buttonspressed = 0;
bumpmercy = 0;
mykey[0] = 90;
mykey[1] = 88;
mykey[2] = 67;
for (i = 0; i < 3; i += 1)
{
    HeroCoaster[i] = instance_create(0, 0, o_coaster_hero_sneo);
    HeroCoaster[i].HeroID = i;
    HeroCoaster[i].depth = HeroCoaster[i].y * -100;
    HeroCoaster[i].siner = 0;
    HeroCoaster[i].mykey = mykey[i];
    if (scr_modconfig("coasterType") != 1)
    {
        HeroCoaster[i].CoasterType = global.char[i];
    }
    else
    {
        HeroCoaster[i].CoasterType = 0;
    }
    with (HeroCoaster[i])
    {
        back = instance_create(x, y, o_coaster_hero_back_sneo);
        back.parentid = id;
        if (global.char[HeroID] == 0)
        {
            back.visible = 0;
        }
    }
    switch (HeroCoaster[i].HeroID)
    {
        case 0:
            HeroCoaster[i].lane_coaster_x = -15;
            HeroCoaster[i].lane_coaster_y = 34;
            HeroCoaster[i].lane_character_x = -5;
            HeroCoaster[i].lane_character_y = -10;
            break;
        case 1:
            HeroCoaster[i].lane_coaster_x = -5;
            HeroCoaster[i].lane_coaster_y = 33;
            HeroCoaster[i].lane_character_x = 5;
            break;
        case 2:
            HeroCoaster[i].lane_coaster_x = -10;
            HeroCoaster[i].lane_coaster_y = 35;
            break;
    }
    yspot[i] = HeroCoaster[i].y;
}


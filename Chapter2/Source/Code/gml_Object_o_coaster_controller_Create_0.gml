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
endcoaster = 0;
endcoastertimer = 0;
mykey[0] = 90;
mykey[1] = 88;
mykey[2] = 67;
BerdlyCoaster = instance_create(camerax() + 470, cameray() + 203, o_coaster_berdly);
if (instance_exists(obj_ch2_scene11a))
{
    o_coaster_berdly.x = obj_ch2_scene11a.coaster_berdly.x + 16;
}
for (i = 0; i < 3; i += 1)
{
    HeroCoaster[i] = instance_create((camerax() + 100) - (i * 20), cameray() + 149 + (60 * i), o_coaster_hero);
    HeroCoaster[i].HeroID = i;
    HeroCoaster[i].HeroType = global.char[i];
    if (scr_modconfig("coasterType") == 1)
    {
        HeroCoaster[i].CoasterType = HeroCoaster[i].HeroID + 1;
    }
    else
    {
        HeroCoaster[i].CoasterType = global.char[i];
    }
    HeroCoaster[i].image_index = 0;
    HeroCoaster[i].depth = HeroCoaster[i].y * -100;
    HeroCoaster[i].siner = 0;
    HeroCoaster[i].mykey = mykey[i];
    BerdlyCoaster.yspot[i] = HeroCoaster[i].y;
    if (instance_exists(global.charinstance[i]))
    {
        global.charinstance[i].x = camerax() - 200;
        HeroCoaster[i].sprite_index = global.charinstance[i].idlesprite;
    }
    with (HeroCoaster[i])
    {
        back = instance_create(x, y + 1, o_coaster_hero_back);
        back.parentid = id;
        back.visible = visible;
        switch (HeroType)
        {
            case 1:
                sprite_index = spr_krisb_attack;
                break;
            case 2:
                sprite_index = spr_susieb_attack;
                break;
            case 3:
                sprite_index = spr_ralsei_battleintro;
                break;
            case 4:
                sprite_index = spr_noelleb_battleintro;
                break;
        }
    }
    if (instance_exists(obj_ch2_scene11a))
    {
        switch (i)
        {
            case 0:
                HeroCoaster[i].x = obj_ch2_scene11a.coaster_kris.x - 22;
                break;
            case 1:
                HeroCoaster[i].x = obj_ch2_scene11a.coaster_susie.x - 22;
                break;
            case 2:
                HeroCoaster[i].x = obj_ch2_scene11a.coaster_ralsei.x - 22;
                break;
        }
    }
}
jamatime = 90;
jamatimer = 0;
littime = 120;
littimer = 0;


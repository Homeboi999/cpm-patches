if (type == 0)
{
    if (init == 0)
    {
        ralseimax = 16;
        var chardepths = [-90, -94, -106, -100, -112];
        for (var i = 0; i < ralseimax; i++)
        {
            var char = (i % 4) + 1;
            while (scr_havechar(char))
            {
                char = choose(1, 2, 3, 4);
            }
            ralseiactor[i] = instance_create(camerax() + 140 + random(300), cameray() + 40 + random(190), obj_actor);
            ralseiactor[i].usprite = charusprites[char];
            ralseiactor[i].dsprite = chardsprites[char];
            ralseiactor[i].rsprite = charrsprites[char];
            ralseiactor[i].lsprite = charlsprites[char];
            ralseiactor[i].sprite_index = chardsprites[char];
            ralseiactor[i].image_speed = 0.25;
            ralseiactor[i].image_index = random(3);
            ralseiactor[i].image_xscale = 2;
            ralseiactor[i].image_yscale = 2;
            ralseiactor[i].mask_index = chardsprites[char];
            ralseiactor[i].ralseitimer = random(10);
            ralseiactor[i].ralseicon = 0;
            ralseiactor[i].auto_walk = 0;
            ralseiactor[i].depthbonus = chardepths[char];
        }
        var correctindex = 0;
        if (havekris)
        {
            with (ralseiactor[correctindex])
            {
                usprite = other.charusprites[1];
                dsprite = other.chardsprites[1];
                rsprite = other.charrsprites[1];
                lsprite = other.charlsprites[1];
                sprite_index = other.chardsprites[1];
                mask_index = other.chardsprites[1];
                depthbonus = chardepths[1];
            }
            correctindex++;
        }
        if (havesusie)
        {
            with (ralseiactor[correctindex])
            {
                usprite = other.charusprites[2];
                dsprite = other.chardsprites[2];
                rsprite = other.charrsprites[2];
                lsprite = other.charlsprites[2];
                sprite_index = other.chardsprites[2];
                mask_index = other.chardsprites[2];
                depthbonus = chardepths[2];
            }
            correctindex++;
        }
        if (haveralsei)
        {
            with (ralseiactor[correctindex])
            {
                usprite = other.charusprites[3];
                dsprite = other.chardsprites[3];
                rsprite = other.charrsprites[3];
                lsprite = other.charlsprites[3];
                sprite_index = other.chardsprites[3];
                mask_index = other.chardsprites[3];
                depthbonus = chardepths[3];
            }
            correctindex++;
        }
        if (havenoelle)
        {
            with (ralseiactor[correctindex])
            {
                usprite = other.charusprites[4];
                dsprite = other.chardsprites[4];
                rsprite = other.charrsprites[4];
                lsprite = other.charlsprites[4];
                sprite_index = other.chardsprites[4];
                mask_index = other.chardsprites[4];
                depthbonus = chardepths[4];
            }
            correctindex++;
        }
        if (correctindex == 0)
        {
            with (ralseiactor[correctindex])
            {
                usprite = other.charusprites[0];
                dsprite = other.chardsprites[0];
                rsprite = other.charrsprites[0];
                lsprite = other.charlsprites[0];
                sprite_index = other.chardsprites[0];
                mask_index = other.chardsprites[0];
                depthbonus = chardepths[0];
            }
            correctindex++;
        }
        init = 1;
    }
    if (con == 0)
    {
        with (obj_actor)
        {
            ralseitimer++;
            if (ralseitimer >= 30)
            {
                if (speed == 0)
                {
                    speed = 2;
                    direction = choose(0, 90, 180, 270);
                    ralseitimer = random(20);
                }
                else
                {
                    speed = 0;
                    ralseitimer = random(10);
                    if (direction != 90)
                    {
                        ralseitimer = 15 + random(5);
                    }
                }
            }
            if (x > (camerax() + 520))
            {
                x -= 4;
                hspeed = -hspeed;
            }
            if (x < (camerax() + 140))
            {
                x += 4;
                hspeed = -hspeed;
            }
            if (y > (cameray() + 200))
            {
                y -= 4;
                vspeed = -vspeed;
            }
            if (y < (cameray() + 0))
            {
                y += 4;
                vspeed = -vspeed;
            }
        }
    }
}
delaydeath--;
if (delaydeath == 0)
{
    instance_destroy();
    with (obj_shutta_nobyact_shutta)
    {
        instance_destroy();
    }
}

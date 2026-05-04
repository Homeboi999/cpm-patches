if (leapmode == 0)
{
    if (jumpcon == 1)
    {
        if (vspeed >= 0)
        {
            if (y >= (((obj_growtangle.y + (obj_growtangle.sprite_height / 2)) - sprite_height) + 1))
            {
                snd_play(snd_bump);
                sprite_index = spr_smallchecker_crouch;
                y = ((obj_growtangle.y + (obj_growtangle.sprite_height / 2)) - sprite_height) + 1;
                jumptimer = 0;
                vspeed = 0;
                gravity = 0;
                hspeed = 0;
                jumpcon = 0;
            }
        }
    }
    
    if (jumpcon == 3)
    {
        if (vspeed >= 0)
        {
            if (y >= (floory - 4))
            {
                sprite_index = spr_smallchecker_crouch;
                snd_play(snd_bump);
                y = floory;
                x = xstart;
                vspeed = 0;
                gravity = 0;
                hspeed = 0;
                jumpcon = 4;
            }
        }
    }
    
    if (jumpcon == 0)
    {
        sprite_index = spr_smallchecker_crouch;
        jumptimer += 1;
        jumpmax = 20;
        
        if (amt >= 1)
            jumpmax = 10;
        
        if (jumptimer >= jumpmax)
        {
            snd_play(snd_jump);
            floory = ystart;
            jumptimer = 0;
            jumpcon = 1;
            amt += 1;
            sprite_index = spr_smallchecker_leap;
            targetx = (obj_heart.x + 8) - (sprite_width / 2);
            vspeed = -15;
            
            if (amt == 1)
                vspeed = -17;
            
            gravity = 1;
            hspeed = (targetx - x) / 28;
            
            if (amt >= 4)
            {
                active = 0;
                jumpcon = 3;
                targetx = xstart;
                vspeed = -20;
                gravity = 2;
                hspeed = (targetx - x) / 18;
            }
        }
    }
    
    if (jumpcon == 4)
    {
        jumptimer += 1;
        
        if (jumptimer >= 10)
        {
            global.turntimer = -1;
            
            with (obj_smallcheckers_enemy)
                visible = 1;
            
            instance_destroy();
        }
    }
}

if (leapmode == 1)
{
    with (obj_regularbullet)
    {
        image_xscale += 0.01;
        image_yscale += 0.01;
    }
    
    if (jumpcon == 0)
    {
        sprite_index = spr_smallchecker_leg;
        image_index = 0;
        image_speed = 0.5;
        jumpcon = 1;
    }
    
    if (jumpcon == 1)
    {
        if (image_index == 3)
        {
            snd_play(snd_swing);
            bul = instance_create(x - random(sprite_width / 4), (y + (sprite_height / 2)) - 10, obj_regularbullet);
            bul.sprite_index = spr_wobblebullet;
            bul.direction = (point_direction(bul.x, bul.y, obj_heart.x + 8, obj_heart.y + 8) - 10) + random(20);
            bul.speed = 3.5 + random(1.8);
            bul.depth = depth + 1;
            bul.target = target;
            bul.damage = damage;
        }
        
        if (image_index >= 4)
        {
            image_index = 4;
            image_speed = 0;
            jumpcon = 2;
        }
    }
    
    if (jumpcon == 2)
    {
        jumptimer += 1;
        
        if (jumptimer >= 15)
        {
            sprite_index = spr_smallchecker_idle;
            image_index = 0;
        }
        
        if (jumptimer >= 25)
        {
            jumptimer = 0;
            jumpcon = 0;
            amt += 1;
            
            if (amt >= 4)
            {
                jumpcon = 3;
                jumptimer = 0;
            }
        }
    }
    
    if (jumpcon == 3)
    {
        jumptimer += 1;
        
        if (jumptimer >= 20)
        {
            with (obj_regularbullet)
            {
                image_alpha -= 0.1;
                active = 0;
            }
        }
        
        if (jumptimer >= 30)
        {
            global.turntimer = -1;
            instance_destroy();
            
            with (obj_smallcheckers_enemy)
                visible = 1;
        }
    }
}

if (grazed == 1)
{
    grazetimer += 1;
    
    if (grazetimer >= 10)
    {
        grazetimer = 0;
        grazed = 0;
    }
}
function scr_charupdate()
{
    // forgot that all of this code uses obj_darkcontroller variables lmao
    with (obj_darkcontroller)
    {
        chartotal = 0;
        havechar[0] = 0;
        havechar[1] = 0;
        havechar[2] = 0;
        havechar[3] = 0;
        
        for (var i = 0; i < 3; i += 1)
        {
            global.faceaction[i] = 0;
            
            if (global.char[i] != 0)
                chartotal += 1;
            
            if (global.char[i] == 1)
            {
                havechar[0] = 1;
                charpos[0] = i;
            }
            
            if (global.char[i] == 2)
            {
                havechar[1] = 1;
                charpos[1] = i;
            }
            
            if (global.char[i] == 3)
            {
                havechar[2] = 1;
                charpos[2] = i;
            }
            
            if (global.char[i] == 4)
            {
                havechar[3] = 1;
                charpos[3] = i;
            }
        }
    }
}
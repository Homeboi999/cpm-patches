function scr_susiemode()
{
    var modsetting = scr_modconfig("autoSusie");
    var auto = true;
    
    switch (modsetting)
    {
        case 0:
            if (global.plot < 150)
                auto = true;
            else
                auto = false;
            
            break;
        
        case 1:
            auto = true;
            break;
        
        case 2:
            auto = false;
            break;
    }
    
    global.charauto[2] = auto;
    return auto;
}

function scr_modconfig(arg0)
{
    // check to see if the mod config has been loaded yet
    //
    // checks if it exists, and also if it's a valid array.
    // usually triggers immediately bc of obj_darkcontroller
    var init = false;
    
    if (!variable_global_exists("modconfig"))
        init = true;
    else if (!is_array(global.modconfig))
        init = true;
    
    // if global.modconfig isn't valid yet, set it to default,
    // then read the values from global.othername[2].
    if (init)
    {
        // menuMode, forceParty, coasterType, enableTea
        global.modconfig = [0, 0, 0, 0];
        
        for (i = 0; i < array_length(global.modconfig); i++)
        {
            // isolate the numbers 0-9 in global.othername[2], then 
            // check the character at position i (GML strings start at 1)
            var checker = string_char_at(string_digits(global.othername[2]), i + 1);
            
            // update global.modconfig accordingly
            if (checker != "")
                global.modconfig[i] = real(checker);
        }
    }
    
    // return values from the given string
    //
    // mainly to keep my code readable, but also
    // allows me to change the index of a config if necessary.
    switch (arg0)
    {
        case "menuMode":
            return global.modconfig[0];
            break;
        
        case "forceParty":
            return global.modconfig[1];
            break;
        
        case "coasterType":
            return global.modconfig[2];
            break;
        
        case "enableTea":
            return global.modconfig[3];
            break;
        
        default:
            // return -1 if no valid config
            return -1;
            break;
    }
}

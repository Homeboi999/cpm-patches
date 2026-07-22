function scr_actactor_slot_available(arg0)
{
    if (global.char[arg0] == 0)
    {
        return new actactor_status(false);
    }
    if (global.hp[global.char[arg0]] <= 0)
    {
        return new actactor_status(false);
    }
    if (global.charaction[arg0] != 0)
    {
        return new actactor_status(false, scr_char_id_to_name(global.char[arg0]));
    }
    return new actactor_status(true);
}

function actactor_status(arg0, arg1 = undefined) constructor
{
    static and_in_place = function(arg0)
    {
        available = available && arg0.available;
        if (busy_char_name != undefined && arg0.busy_char_name != undefined && busy_char_name != arg0.busy_char_name)
        {
            busy_char_name = "everyone";
        }
        else if (busy_char_name == undefined)
        {
            busy_char_name = arg0.busy_char_name;
        }
    };
    
    static or_in_place = function(arg0)
    {
        available = available || arg0.available;
        if (busy_char_name != undefined && arg0.busy_char_name != undefined && busy_char_name != arg0.busy_char_name)
        {
            busy_char_name = "everyone";
        }
        else if (busy_char_name == undefined)
        {
            busy_char_name = arg0.busy_char_name;
        }
    };
    
    available = arg0;
    busy_char_name = arg1;
}

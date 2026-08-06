function scr_get_chara_alignment(arg0, arg1 = -4)
{
    switch (arg0)
    {
        case "kris":
        default:
            return 
            {
                halign: 0,
                valign: 0
            };
        case "susie":
            return 
            {
                halign: (global.darkzone == 0) ? 3 : 6,
                valign: (global.darkzone == 0) ? 6 : 16
            };
        case "ralsei":
            return 
            {
                halign: 2,
                valign: 12
            };
        case "noelle":
            return 
            {
                halign: (global.darkzone == 0) ? 2 : 4,
                valign: (global.darkzone == 0) ? 9 : 18
            };
    }
}

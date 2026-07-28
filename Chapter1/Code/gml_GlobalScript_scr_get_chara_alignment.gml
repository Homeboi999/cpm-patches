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
            var result = 
            {
                halign: (global.darkzone == 0) ? 3 : 6,
                valign: (global.darkzone == 0) ? 6 : 16
            };
            return result;
        case "ralsei":
            result = 
            {
                halign: 4,
                valign: 12
            };
            return result;
    }
}

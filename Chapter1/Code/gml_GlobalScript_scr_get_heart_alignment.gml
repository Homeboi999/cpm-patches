function scr_get_heart_alignment(arg0, arg1 = -4)
{
    switch (arg0)
    {
        case "kris":
        default:
            return 
            {
                halign: 12,
                valign: 40
            };
        case "susie":
            var result = 
            {
                halign: 11,
                valign: 30
            };
            return result;
        case "ralsei":
            result = 
            {
                halign: 11,
                valign: 38
            };
            return result;
    }
}

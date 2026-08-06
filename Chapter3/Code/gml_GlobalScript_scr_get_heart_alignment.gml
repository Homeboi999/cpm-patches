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
            return 
            {
                halign: 11,
                valign: 30
            };
        case "ralsei":
            return 
            {
                halign: 11,
                valign: 38
            };
        case "noelle":
            return 
            {
                halign: 11,
                valign: 34
            };
    }
}

function scr_hidecharactor()
{
    with (obj_actor)
    {
        visible = 1;
        if (name == "susie" && !scr_havechar(2))
        {
            visible = 0;
        }
        if (name == "ralsei" && !scr_havechar(3))
        {
            visible = 0;
        }
        if (name == "noelle" && !scr_havechar(4))
        {
            visible = 0;
        }
    }
}

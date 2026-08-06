function scr_menucharselect(arg0)
{
    var newcoord = (global.submenucoord[global.submenu] + 3 + arg0) % 3;
    if (global.char[newcoord] == 0)
    {
        newcoord = (newcoord + 3 + arg0) % 3;
    }
    if (global.char[newcoord] == 0)
    {
        newcoord = global.submenucoord[global.submenu];
    }
    return newcoord;
}

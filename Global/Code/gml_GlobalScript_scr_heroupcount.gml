function scr_heroupcount()
{
    var livingheroes = 0;
    for (var i = 0; i < 3; i++)
    {
        if (global.char[i] == 0)
        {
            continue;
        }
        if (global.hp[global.char[i]] < 1)
        {
            continue;
        }
        livingheroes++;
    }
    return livingheroes;
}

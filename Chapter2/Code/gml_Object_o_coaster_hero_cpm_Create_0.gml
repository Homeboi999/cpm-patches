// ---------------
//    CPM LOGIC
// ---------------

// variations
init = 0;
HeroID = 0; // lane #
HeroType = 0; // character
CoasterType = 0; // coaster

// battle object
heroInit = 0; // cuz intro shenanigans
heroInstance = 0; // battle object

// sprites
default_sprite_front = spr_sneo_car_front;
default_sprite_back = spr_sneo_car_back;
hurt_sprite_front = spr_sneo_car_front;
normalsprite = spr_krisr_dark;

// offsets
coaster_offset_x = 0;
coaster_offset_y = 0;
coaster_scale_x = 1;
back_offset_x = 0;
back_offset_y = 0;

character_offset_x = 0;
character_offset_y = 0;
anim_offset_x = 0;
anim_offset_y = 0;
factor_y = 2; // only susie uses this lmao

lane_coaster_x = 0; // rename these to
lane_coaster_y = 0; // "lane_offset" later
battle_hero_x = 0;
battle_hero_y = 0;

debug_markers = true; // debug squares

// delete these
lane_character_x = 0;
lane_character_y = 0;

// -------------------
//    VANILLA LOGIC
// -------------------

forceact = 1;
gooffscreen = 0;
userealsprite = 0;
introanim = 1;
image_speed = 0.25;
image_xscale = 2;
image_yscale = 2;
mask_index = spr_coaster_hero;
visible = false;
siner = 0;
smoketimer = 0;
con = 0;
action = 0;
mykey = 81;
damaged = 0;
mykeybuffer = 0;
nitro = 0;
barrier = 0;
disabled = 0;
disabledtimer = 0;
disabledtype = 0;
flametimer = 0;
flameindex = 0;
flameindextimer = 0;
fsiner = 0;
actoncondelay = 0;
dontshowherosprite = 0;
draw_button_press = 0;
draw_button_press_timer = 0;

// ------------------
//    BATTLE LOGIC
// ------------------

// berdly
endtargetx = 0;
endscene = 0;
endscenetimer = 0;
bump = 0;

// spamton
xx = 0;
yy = 0;
lerpstate = 0;
lerptimer = 0;
char_offset_init = 0;
hero_start_x = 0;
hero_start_y = 0;
offset_fix_init = 0;
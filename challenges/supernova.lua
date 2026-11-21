Allen.Challenge_stakes.c_allen_supernova = 6

local static_cards = {
    --upwards scaling cards
    {id = 'j_ceremonial'},
    {id = 'j_ride_the_bus'},
    {id = 'j_runner'},
    {id = 'j_constellation'},
    {id = 'j_green_joker'},
    {id = 'j_red_card'},
    {id = 'j_madness'},
    {id = 'j_square'},
    {id = 'j_vampire'},
    {id = 'j_hologram'},
    {id = 'j_rocket'},
    {id = 'j_obelisk'},
    {id = 'j_lucky_cat'},
    {id = 'j_flash'},
    {id = 'j_trousers'},
    {id = 'j_castle'},
    {id = 'j_glass'},
    {id = 'j_wee'},
    {id = 'j_caino'},
    {id = 'j_yorick'},

    --other scaling cards
    {id = 'j_stencil'},
    {id = 'j_steel_joker'},
    {id = 'j_abstract'},
    {id = 'j_ice_cream'},
    {id = 'j_blue_joker'},
    {id = 'j_cloud_9'},
    {id = 'j_turtle_bean'},
    {id = 'j_erosion'},
    {id = 'j_fortune_teller'},
    {id = 'j_stone'},
    {id = 'j_bull'},
    {id = 'j_popcorn'},
    {id = 'j_ramen'},
    {id = 'j_selzer'},
    {id = 'j_campfire'},
    {id = 'j_swashbuckler'},
    {id = 'j_throwback'},
    {id = 'j_hit_the_road'},
    {id = 'j_satellite'},
    {id = 'j_bootstraps'},
}

SMODS.Challenge { --Supernova
    key = 'supernova',
    loc_txt = {
        name = 'Static'
    },
    rules = {
        custom = {
            {id = 'supernova'},
            {id = 'purple_stake'},
        },
    },
    restrictions = {
        banned_cards = static_cards,
    },
    deck = {
        type = 'Challenge Deck',
    },
}

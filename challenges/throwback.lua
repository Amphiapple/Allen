Allen.Challenge_stakes.c_allen_throwback = 6

SMODS.Challenge { --Throwback
    key = 'throwback',
    loc_txt = {
        name = 'Old But Gold'
    },
    rules = {
        custom = {
            {id = 'throwback'},
            {id = 'purple_stake'},
            {id = 'old_but_gold'},
            {id = 'booster_ante_scaling'},
        },
        modifiers = {
            {id = 'hand_size', value = 7},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
}

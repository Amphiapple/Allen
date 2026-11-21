SMODS.Challenge { --Half Joker
    key = 'half',
    loc_txt = {
        name = 'The Snap'
    },
    rules = {
        custom = {
            {id = 'half'},
            {id = 'the_snap_1'},
            {id = 'the_snap_2'},
        },
        modifiers = {
            {id = 'joker_slots', value = 3},
            {id = 'consumable_slots', value = 1},
            {id = 'dollars', value = 2},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
    apply = function(self)
        change_shop_size(-1)
        SMODS.change_booster_limit(-1)
    end,
}

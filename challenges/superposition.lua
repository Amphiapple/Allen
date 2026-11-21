Allen.Challenge_stakes.c_allen_superposition = 8

SMODS.Challenge { --Superposition
    key = 'superposition',
    loc_txt = {
        name = 'Inversion'
    },
    rules = {
        custom = {
            {id = 'superposition'},
            {id = 'gold_stake'},
        },
        modifiers = {
            {id = 'hands', value = 3},
            {id = 'discards', value = 4},
            {id = 'joker_slots', value = 2},
            {id = 'consumable_slots', value = 5},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
}

Allen.Challenge_stakes.c_allen_joker = 8

SMODS.Challenge { --Joker
    key = 'joker',
    loc_txt = {
        name = 'You, Me, Gold Stake'
    },
    rules = {
        custom = {
            {id = 'joker'},
            {id = 'gold_stake'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
}

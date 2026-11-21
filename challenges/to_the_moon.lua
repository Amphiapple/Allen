Allen.Challenge_stakes.c_allen_to_the_moon = 8

SMODS.Challenge { --To The Moon
    key = 'to_the_moon',
    loc_txt = {
        name = 'Million Dollar Stake'
    },
    rules = {
        custom = {
            {id = 'to_the_moon'},
            {id = 'gold_stake'},
            {id = 'million_dollar_stake'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    apply = function(self)
        G.GAME.modifiers.scaling = 3
    end
}

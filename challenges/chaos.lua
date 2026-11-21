Allen.Challenge_stakes.c_allen_chaos = 8

SMODS.Challenge { --Chaos the Clown
    key = 'chaos',
    loc_txt = {
        name = 'Unrollenting'
    },
    rules = {
        custom = {
            {id = 'chaos'},
            {id = 'gold_stake'},
            {id = 'unrollenting'},
        },
    },
    jokers = {
        {id = 'j_chaos'},
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.ending_shop then
            G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + G.GAME.current_round.reroll_cost_increase
        end
    end
}

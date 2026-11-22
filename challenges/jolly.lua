Allen.Challenge_stakes.c_allen_jolly = 4

SMODS.Challenge { --Jolly Joker
    key = 'jolly',
    loc_txt = {
        name = 'Pairkiller'
    },  
    rules = {
        custom = {
            {id = 'jolly'},
            {id = 'black_stake'},
            {id = 'pairkiller'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.before and (context.scoring_name == 'High Card' or context.scoring_name == 'Pair') then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end
}

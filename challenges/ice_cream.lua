SMODS.Challenge { --Ice Cream
    key = 'ice_cream',
    loc_txt = {
        name = 'Meltdown'
    },
    rules = {
        custom = {
            {id = 'ice_cream'},
            {id = 'meltdown'},
        },
    },
    jokers = {
        {id = 'j_ice_cream'}
    },
    restrictions = {
        banned_cards = {
            {id = 'j_ice_cream'}
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.after then
            if #find_joker('Ice Cream') == 0 then
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
    end
}

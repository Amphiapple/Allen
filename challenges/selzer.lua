Allen.Challenge_stakes.c_allen_selzer = 8

SMODS.Challenge { --Seltzer
    key = 'selzer',
    loc_txt = {
        name = 'Cleaning Up',
    },
    rules = {
        custom = {
            {id = 'selzer'},
            {id = 'gold_stake'},
            {id = 'cleaning_up_1'},
            {id = 'cleaning_up_2'},
            {id = 'cleaning_up_3'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    jokers = {
        {id = 'j_selzer'}
    },
    restrictions = {
        banned_cards = {
            {id = 'j_selzer'}
        }
    },
    calculate = function(self, context)
        if context.using_consumeable then
            local seltzers = find_joker('Seltzer')
            for k, v in ipairs(seltzers) do
                if v.ability.extra >= 10 then
                    SMODS.destroy_cards(v, nil, nil, true)
                else
                    v.ability.extra = v.ability.extra + 1
                    v:juice_up()
                end
            end
        elseif context.after then
            if #find_joker('Seltzer') == 0 then
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

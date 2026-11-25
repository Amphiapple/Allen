Allen.Challenge_stakes.c_allen_madness = 8

SMODS.Challenge { --Madness
    key = 'madness',
    loc_txt = {
        name = 'Single Use Drill'
    },
    rules = {
        custom = {
            {id = 'madness'},
            {id = 'gold_stake'},
            {id = 'single_use_drill_1'},
            {id = 'single_use_drill_2'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.selling_card and context.card.ability.set == 'Joker' then
            G.GAME.banned_keys[context.card.config.center_key] = true
        elseif context.joker_type_destroyed then
            G.GAME.banned_keys[context.card.config.center_key] = true
        elseif context.end_of_round and not context.individual and not context.repetition then
            G.GAME.banned_keys = G.GAME.banned_keys or {}
            local deletable_jokers = {}
            for k, v in pairs(G.jokers.cards) do
                if not SMODS.is_eternal(v, self) then
                    deletable_jokers[#deletable_jokers + 1] = v
                end
            end
            local joker_to_destroy = #deletable_jokers > 0 and pseudorandom_element(deletable_jokers, pseudoseed('madness')) or nil
            if joker_to_destroy then
                joker_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.banned_keys[joker_to_destroy.config.center_key] = true
                        SMODS.destroy_cards(joker_to_destroy, nil, nil, true)
                        return true
                    end
                }))
            end
            
        end
    end
}

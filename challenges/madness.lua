SMODS.Challenge { --Madness
    key = 'madness',
    loc_txt = {
        name = 'Single Use Drill'
    },
    rules = {
        custom = {
            {id = 'madness'},
            {id = 'yellow_deck'},
            {id = 'single_use_drill'},
        },
        modifiers = {
            {id = 'money', value = 14}
        }
    },
    deck = {
        type = 'Yellow Deck',
    },
    calculate = function(self, context)
        if context.end_of_round and not context.individual and not context.repetition then
            G.GAME.banned_keys = G.GAME.banned_keys or {}
            local deletable_jokers = {}
            for k, v in pairs(G.jokers.cards) do
                if not SMODS.is_eternal(v, self) then deletable_jokers[#deletable_jokers + 1] = v end
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.75,
                func = function()
                    for k, v in pairs(deletable_jokers) do
                        G.GAME.banned_keys[v.config.center_key] = true
                        v.getting_sliced = true
                        SMODS.destroy_cards(v, nil, nil, true)
                    end
                    return true
                end
            }))
        end
    end
}

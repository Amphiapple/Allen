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
        if context.end_of_round and not context.individual and not context.repetition then
            G.GAME.banned_keys = G.GAME.banned_keys or {}
            local deletable_jokers = {}
            for k, v in pairs(G.jokers.cards) do
                if not SMODS.is_eternal(v, self) then
                    v.getting_sliced = true
                    deletable_jokers[#deletable_jokers + 1] = v
                end
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    for k, v in ipairs(deletable_jokers) do
                        G.GAME.banned_keys[v.config.center_key] = true
                        SMODS.destroy_cards(v, nil, nil, true)
                    return true
                end
            }))
        end
    end
}

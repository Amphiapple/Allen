SMODS.Atlas {
    key = 'Blind',
    path = 'blinds.png',
    px = 34,
    py = 34,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1,
}

SMODS.Blind {
    key = 'luchador',
    atlas = 'Blind',
    pos = { y = 0 },
    dollars = 5,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("94D708"),

    in_pool = function()
        return false
    end,
    defeat = function(self)
        if not self.disabled then
            local eligible_jokers = {}
            for k, v in ipairs(G.jokers.cards) do
                if not SMODS.is_eternal(v) then
                    table.insert(eligible_jokers, v)
                end
            end
            local eligible_card = #eligible_jokers > 0 and pseudorandom_element(eligible_jokers, pseudoseed('luchador')) or nil
            if eligible_card then
                eligible_card.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        eligible_card:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
        end
        self.defeated = true
    end,
}
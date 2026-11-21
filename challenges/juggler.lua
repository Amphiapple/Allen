Allen.Challenge_stakes.c_allen_juggler = 6

SMODS.Challenge { --Juggler
    key = 'juggler',
    loc_txt = {
        name = 'Joker Juggling'
    },
    rules = {
        custom = {
            {id = 'juggler'},
            {id = 'purple_stake'},
            {id = 'joker_juggling'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if (context.setting_blind or context.press_play) and #G.jokers.cards > 0 then
            G.jokers:unhighlight_all()
            for k, v in ipairs(G.jokers.cards) do
                if v.facing == 'front' then
                    v:flip()
                end
            end
            if #G.jokers.cards > 1 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function() 
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);
                                return true
                            end
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);
                                return true
                            end
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);
                                return true
                            end
                        }))
                        delay(0.5)
                        return true
                    end
                }))
            end
        end
    end
}

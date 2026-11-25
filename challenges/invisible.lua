SMODS.Challenge { --Invisible Joker
    key = 'invisible',
    loc_txt = {
        name = 'CT Scan'
    },
    rules = {
        custom = {
            {id = 'invisible'},
            {id = 'ct_scan_1'},
            {id = 'ct_scan_2'},
        },
    },
    restrictions = {
        banned_other = {
            {id = 'bl_house', type = 'blind'},
            {id = 'bl_wheel', type = 'blind'},
            {id = 'bl_fish', type = 'blind'},
            {id = 'bl_mark', type = 'blind'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    apply = function(self)
        G.GAME.modifiers.flipped_cards = 1.333
    end,
    calculate = function(self, context)
        if context.final_scoring_step and context.scoring_name == 'High Card' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("timpani", 1)
                    attention_text({
                        scale = 1.4,
                        text = "High Card!",
                        hold = 1.4,
                        align = "cm",
                        offset = { x = 0, y = -2.7 },
                        major = G.play,
                    })
                    return true
                end,
            }))
            return{
                Xmult = 0
            }
        end
    end
}

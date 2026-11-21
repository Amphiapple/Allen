SMODS.Challenge { --Square Joker
    key = 'square',
    loc_txt = {
        name = 'Root Sum Square'
    },
    rules = {
        custom = {
            {id = 'square'},
            {id = 'root_sum_square_1'},
            {id = 'root_sum_square_2'}
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.initial_scoring_step then
            mult = mod_mult(mult ^ 2)
            update_hand_text( { delay = 0 }, { chips = hand_chips, mult = mult } )
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('gong', 0.94, 0.3)
                    play_sound('gong', 0.94*1.5, 0.2)
                    attention_text({
                        scale = 1.4,
                        text = "Square!",
                        hold = 0.45,
                        align = "cm",
                        offset = { x = 0, y = -2.7 },
                        major = G.play,
                    })
                    return true
                end,
            }))
            delay(0.6)
        elseif context.final_scoring_step then
            mult = mod_mult(mult ^ 0.5)
            update_hand_text( { delay = 0 }, { chips = hand_chips, mult = mult } )
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('gong', 0.94, 0.3)
                    play_sound('gong', 0.94*1.5, 0.2)
                    attention_text({
                        scale = 1.4,
                        text = "Sq. Root!",
                        hold = 0.45,
                        align = "cm",
                        offset = { x = 0, y = -2.7 },
                        major = G.play,
                    })
                    return true
                end,
            }))
            delay(0.6)
        end
    end
}

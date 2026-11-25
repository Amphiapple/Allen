Allen.Challenge_stakes.c_allen_even_steven = 8

SMODS.Challenge { --Even Steven
    key = 'even_steven',
    loc_txt = {
        name = 'Even Parity'
    },
    rules = {
        custom = {
            {id = 'even_steven'},
            {id = 'gold_stake'},
            {id = 'even_parity'},
        },
    },
    consumeables = {
        {id = 'c_justice', edition = 'negative'},
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.final_scoring_step and mult % 2 ~= 0 then
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("timpani", 1)
					attention_text({
						scale = 1.4,
						text = "Not Even!",
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

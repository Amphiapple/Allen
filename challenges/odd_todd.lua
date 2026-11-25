Allen.Challenge_stakes.c_allen_odd_todd = 8

SMODS.Challenge { --Odd Todd
    key = 'odd_todd',
    loc_txt = {
        name = 'Odd Parity'
    },
    rules = {
        custom = {
            {id = 'odd_todd'},
            {id = 'gold_stake'},
            {id = 'odd_parity'},
        },
    },
    jokers = {
        {id = 'j_splash', edition = 'negative'},
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.final_scoring_step and hand_chips % 2 ~= 1 then
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("timpani", 1)
					attention_text({
						scale = 1.4,
						text = "Not Odd!",
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

SMODS.Challenge { --Acrobat
    key = 'acrobat',
    loc_txt = {
        name = 'Last Stand'
    },
    rules = {
        custom = {
            {id = 'acrobat'},
            {id = 'last_stand'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.final_scoring_step and G.GAME.current_round.hands_left ~= 0 then
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("timpani", 1)
					return true
				end,
			}))
            return{
                Xmult = 0
            }
        end
    end,
}

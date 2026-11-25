Allen.Challenge_stakes.c_allen_trio = 6

SMODS.Scoring_Calculation {
	key = 'allen_trio',
	func = function(self, chips, mult, flames)
		return math.floor(math.min(0.4 * G.GAME.blind.chips, chips * mult) + 0.5)
	end,
}

SMODS.Challenge { --The Trio
    key = 'trio',
    loc_txt = {
        name = 'Increasing Severity'
    },
    rules = {
        custom = {
            {id = 'trio'},
            {id = 'gold_stake'},
            {id = 'increasing_severity_1'},
            {id = 'increasing_severity_2'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    apply = function (self)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.set_scoring_calculation('allen_trio')
                return true
            end
        }))
    end,
    calculate = function(self, context)
        if context.final_scoring_step then
            local temp_Xmult = 1.5 ^ G.GAME.current_round.hands_played
            if temp_Xmult > 1 then
                return {
                    Xmult = temp_Xmult
                }
            end
        end
    end
}

Allen.Challenge_stakes.c_allen_trio = 6

SMODS.Scoring_Calculation {
	key = 'allen_trio',
	func = function(self, chips, mult, flames)
        local score_cap = 0.75 - 0.05 * (G.GAME.round_resets.ante - 1)
		return math.floor(math.min(score_cap * G.GAME.blind.chips, chips * mult) + 0.5)
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
    restrictions = {
        banned_other = {
            {id = 'bl_needle', type = 'blind'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.set_scoring_calculation('allen_trio')
                return true
            end
        }))
    end
}

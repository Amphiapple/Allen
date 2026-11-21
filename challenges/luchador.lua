
SMODS.Challenge { --Luchador
    key = 'luchador',
    loc_txt = {
        name = 'Critical Hit'
    },
    rules = {
        custom = {
            {id = 'luchador'},
            {id = 'black_stake'},
            {id = 'critical_hit_1'},
            {id = 'critical_hit_2'},
        },
    },
    restrictions = {
        banned_cards = {
            {id = 'j_luchador'},
            {id = 'j_chicot'}
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.final_scoring_step and (hand_chips*mult)/G.GAME.blind.chips >= to_big(1) then
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.GAME.blind:disable()
            end
        end
    end
}

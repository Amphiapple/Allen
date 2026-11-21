SMODS.Challenge { --Vagabond
    key = 'vagabond',
    loc_txt = {
        name = 'Student Loans'
    },
    rules = {
        custom = {
            {id = 'vagabond'},
            {id = 'student_loans'},
        },
    },
    jokers = {
        {id = 'j_allen_loan_shark'},
    },
    vouchers = {
        {id = 'v_tarot_merchant'},
        {id = 'v_tarot_tycoon'},
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.end_of_round and context.beat_boss and G.GAME.round_resets.ante >= G.GAME.win_ante and G.GAME.dollars > -400000 and not context.individual and not context.repetition then
            G.STATE = G.STATES.GAME_OVER
            G:save_settings()
            G.FILE_HANDLER.force = true
            G.STATE_COMPLETE = false
        end
    end
}

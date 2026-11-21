local thirteen_cards = {
    --extra played hands cards
    {id = 'j_burglar'},
    {id = 'v_grabber'},
    {id = 'v_nacho_tong'},
    --extra hand size cards
    {id = 'j_juggler'},
    {id = 'j_troubadour'},
    {id = 'j_turtle_bean'},
    {id = 'v_paint_brush'},
    {id = 'v_palette'},
}

SMODS.Challenge { --Troubadour
    key = 'troubadour',
    loc_txt = {
        name = '13 Cards'
    },
    rules = {
        custom = {
            {id = 'troubadour'},
            {id = 'thirteen_cards'},
        },
        modifiers = {
            {id = 'hand_size', value = 13},
            {id = 'hands', value = 3},
            {id = 'discards', value = 0},
            {id = 'dollars', value = 13},
        }
    },
    restrictions = {
        banned_cards = thirteen_cards,
        banned_tags = {
            {id = 'tag_juggle'},
        },
        banned_other = {
            {id = 'bl_water', type = 'blind'},
            {id = 'bl_needle', type = 'blind'},
            {id = 'bl_serpent', type = 'blind'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.drawing_cards and #G.hand.cards == 0 and
                not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end,
}

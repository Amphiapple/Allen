Allen.Challenge_stakes.c_allen_ride_the_bus = 8

SMODS.Challenge { --Ride The Bus
    key = 'ride_the_bus',
    loc_txt = {
        name = 'Minesweeper'
    },
    rules = {
        custom = {
            {id = 'ride_the_bus'},
            {id = 'abandoned_deck'},
            {id = 'gold_stake'},
            {id = 'minesweeper_1'},
            {id = 'minesweeper_2'},
        },
    },
    jokers = {
        {id = 'j_ride_the_bus', eternal = true}
    },
    deck = {
        type = 'Abandoned Deck',
        cards = {
            {s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='A',},
            {s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='A',},
            {s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='A',},
            {s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='A',},
        }
    },

    calculate = function(self, context)
        if context.before then
            local rank = pseudorandom_element({'J', 'Q', 'K'}, pseudoseed('minesweeper'))
            local suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('minesweeper'))
            local card_front = suit..'_'..rank
            SMODS.add_card({
                set = 'Playing Card',
                front = card_front,
                area = G.deck,
                skip_materialize = false,
                enhanced_poll = 1
            })
        elseif context.initial_scoring_step then
            local faces = false
            for k, v in ipairs(context.scoring_hand) do
                if v:is_face() then
                    faces = true
                end
            end
            if faces then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        G.STATE = G.STATES.GAME_OVER
                        G.STATE_COMPLETE = false
                        return true
                    end
                }))
            end
        end
    end
}

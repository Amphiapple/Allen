Allen.Challenge_stakes.c_allen_seeing_double = 3

SMODS.Challenge { --Seeing Dobule
    key = 'seeing_double',
    loc_txt = {
        name = 'Haunted Hands'
    },
    rules = {
        custom = {
            {id = 'seeing_double'},
            {id = 'green_stake'},
            {id = 'haunted_hands_1'},
            {id = 'haunted_hands_2'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    
    apply = function (self)
        G.GAME.seeing_double_hands = {
            ["Flush Five"] = false,
            ["Flush House"] = false,
            ["Five of a Kind"] = false,
            ["Straight Flush"] = false,
            ["Four of a Kind"] = false,
            ["Full House"] = false,
            ["Flush"] = false,
            ["Straight"] = false,
            ["Three of a Kind"] = false,
            ["Two Pair"] = false,
            ["Pair"] = false,
            ["High Card"] = false,
        }
    end,
    calculate = function(self, context)
        if context.before then
            if G.GAME.seeing_double_hands[context.scoring_name] then
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= self and not SMODS.is_eternal(G.jokers.cards[i], self) and not G.jokers.cards[i].getting_sliced then
                        destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
                    end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('seeing_double')) or nil

                if joker_to_destroy then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                end
            else
                G.GAME.seeing_double_hands[context.scoring_name] = true
            end
        elseif context.end_of_round and context.beat_boss and not context.individual and not context.repetition then
            G.GAME.seeing_double_hands = {
                ["Flush Five"] = false,
                ["Flush House"] = false,
                ["Five of a Kind"] = false,
                ["Straight Flush"] = false,
                ["Four of a Kind"] = false,
                ["Full House"] = false,
                ["Flush"] = false,
                ["Straight"] = false,
                ["Three of a Kind"] = false,
                ["Two Pair"] = false,
                ["Pair"] = false,
                ["High Card"] = false,
            }
        end
    end
}

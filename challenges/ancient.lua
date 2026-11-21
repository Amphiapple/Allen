Allen.Challenge_stakes.c_allen_ancient = 8

SMODS.Challenge { --Ancient Joker
    key = 'ancient',
    loc_txt = {
        name = 'Type Advantage'
    },
    rules = {
        custom = {
            {id = 'ancient'},
            {id = 'gold_stake'},
            {id = 'type_advantage_1'},
            {id = 'type_advantage_2'},
            {id = 'type_advantage_3'},
            {id = 'type_advantage_4'},
            {id = 'type_advantage_5'},
        },
    },
    jokers = {
        {id = 'j_ancient', eternal = true}
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.individual and context.cardarea == G.play then
            local suit = G.GAME.current_round.ancient_card.suit
            if suit == 'Spades' then
                if context.other_card:is_suit(suit) then
                    return {
                        chips = 25
                    }
                elseif context.other_card:is_suit('Hearts') then
                    return {
                        chips = -50
                    }
                end
            elseif suit == 'Hearts' then
                if context.other_card:is_suit(suit) then
                    return {
                        Xmult = 1.25
                    }
                elseif context.other_card:is_suit('Clubs') then
                    return {
                        Xmult = 0.75
                    }
                end
            elseif suit == 'Clubs' then
                if context.other_card:is_suit(suit) then
                    return {
                        mult = 3
                    }
                elseif context.other_card:is_suit('Diamonds') then
                    return {
                        mult = -7
                    }
                end
            elseif suit == 'Diamonds' then
                if context.other_card:is_suit(suit) then
                    return {
                        dollars = 1
                    }
                elseif context.other_card:is_suit('Spades') then
                    return {
                        dollars = -2
                    }
                end
            end
        end
    end,
}

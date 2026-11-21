SMODS.Challenge { --Popcorn
    key = 'popcorn',
    loc_txt = {
        name = 'Short Lived'
    },
    rules = {
        custom = {
            {id = 'popcorn'},
            {id = 'short_lived_1'},
            {id = 'short_lived_2'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.modify_shop_card and context.card.ability.set == 'Joker' then
            if not context.card.ability.perishable then
                context.card.ability.perishable = true
                context.card.ability.perish_tally = G.GAME.perishable_rounds
            end
        elseif context.modify_booster_card and context.card.ability.set == 'Joker' then
            if not context.card.ability.perishable then
                context.card.ability.perishable = true
                context.card.ability.perish_tally = G.GAME.perishable_rounds
            end
        elseif context.card_added and context.card.ability.set == 'Joker' then
            if not context.card.ability.perishable then
                context.card.ability.perishable = true
                context.card.ability.perish_tally = G.GAME.perishable_rounds
            end
        elseif context.end_of_round and not context.individual and not context.repetition then
            local first_joker = #G.jokers.cards >= 1 and G.jokers.cards[1]
            if first_joker and first_joker.ability.perishable and first_joker.ability.perish_tally > 0 then
                first_joker.ability.perish_tally = first_joker.ability.perish_tally - 2
            end
        end
    end,
}

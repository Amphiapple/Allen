Allen.Challenge_stakes.c_allen_credit_card = 8

SMODS.Challenge { --Credit Card
    key = 'credit_card',
    loc_txt = {
        name = 'Buy Now, Pay Later'
    },
    rules = {
        custom = {
            {id = 'credit_card'},
            {id = 'purple_stake'},
            {id = 'buy_now_pay_later_1'},
            {id = 'buy_now_pay_later_2'},
        },
    },
    restrictions = {
        banned_cards = {
            {id = 'j_campfire'}
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.modify_shop_card and context.card.ability.set == 'Joker' then
            context.card.ability.couponed = true
            recalc_all_costs()
        elseif context.end_of_round and context.beat_boss then
            for k, v in ipairs(G.jokers.cards) do
                v:set_rental(true)
                v:juice_up()
            end
        end
    end
}

Allen.Challenge_stakes.c_allen_trading_card = 4

SMODS.Challenge { --Trading Card
    key = 'trading',
    loc_txt = {
        name = 'Dishonest Woodcutter'
    },
    rules = {
        custom = {
            {id = 'trading'},
            {id = 'black_stake'},
            {id = 'no_shop_jokers'},
            {id = 'dishonest_woodcutter_1'},
            {id = 'dishonest_woodcutter_2'},
        },
    },
    jokers = {
        {id = 'j_credit_card'},
        {id = 'j_credit_card'},
        {id = 'j_credit_card'},
    },
    restrictions = {
        banned_cards = {
            {id = 'p_buffoon_normal_1', ids = {'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',}}
        },
        banned_tags = {
            {id = 'tag_uncommon'},
            {id = 'tag_rare'},
            {id = 'tag_negative'},
            {id = 'tag_foil'},
            {id = 'tag_holographic'},
            {id = 'tag_polychrome'},
            {id = 'tag_buffoon'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.selling_card and context.card.ability.set == 'Joker' and G.GAME.current_round.trade_available and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit then
            G.GAME.current_round.trade_available = false
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'trading')
                    card.extra_cost = -card.base_cost
                    card.sell_cost = 0
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
        elseif context.end_of_round and not context.individual and not context.repetition then
            G.GAME.current_round.trade_available = true
        end
    end
}

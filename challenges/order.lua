Allen.Challenge_stakes.c_allen_order = 6

SMODS.Challenge { --The Order
    key = 'order',
    loc_txt = {
        name = 'Hypothermia'
    },
    rules = {
        custom = {
            {id = 'order'},
            {id = 'purple_stake'},
            {id = 'hypothermia_1'},
            {id = 'hypothermia_2'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    Allen.add_drag_condition("order", function(card)
        if card.is and type(card.is) == "function" and card:is(Card) and card.ability and card.ability.set == "Joker"
                and G and G.GAME and G.GAME.blind and G.GAME.blind.in_blind
                and G.GAME.modifiers.hypothermia_1 then
            return true
        end
    end),
    calculate = function(self, context)
        if context.setting_blind then
            for k = #G.jokers.cards, 1, -1 do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.GAME.order_jokers and G.GAME.order_jokers[k] and G.jokers.cards[k] == G.GAME.order_jokers[k] then
                            G.jokers.cards[k]:set_debuff(true)
                            G.jokers.cards[k]:juice_up()
                        end
                        return true
                    end
                }))
            end
        elseif context.end_of_round and not context.individual and not context.repetition then
            G.GAME.order_jokers = G.GAME.order_jokers or {}
            for k, v in ipairs(G.jokers.cards) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if v.debuff then
                            v:set_debuff(false)
                            v:juice_up()
                        end
                        G.GAME.order_jokers[k] = v
                        return true
                    end
                }))
            end
        end
    end,
}

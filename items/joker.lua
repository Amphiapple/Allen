SMODS.Atlas {
    key = 'Joker',
    path = 'jokers.png',
    px = 71,
    py = 95,
}

SMODS.Joker { --Safecracking
    key = 'safe',
    name = 'The Safe',
	atlas = 'Joker',
	pos = { x = 14, y = 3 },
    rarity = 1,
	cost = 4,
    blueprint_compat = true,
    in_pool = function(self, args)
        return false
    end,
    config = {
        extra = { cracked = false, safe_hands = 4, current = 4, Xmult = 10 } --Variables: safe_hands = hands to crack, current = hands remaining, Xmult = Xmult after cracked
    },
    loc_vars = function(self, info_queue, card)
        local cracked = card.ability.extra.cracked
        return {
            key = cracked and 'j_allen_safe_cracked' or 'j_allen_safe',
            vars = {
                card.ability.extra.current,
                card.ability.extra.Xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not card.ability.extra.cracked and not context.blueprint then
            local hands = {}
            local lists = find_joker('To Do List')
            for k, v in ipairs(lists) do
                table.insert(hands, v.ability.to_do_poker_hand)
            end
            local match = false
            for k, v in ipairs(hands) do
                if context.scoring_name == v then
                    match = true
                    break
                end
            end
            if match then
                card.ability.extra.current = card.ability.extra.current - 1
                if card.ability.extra.current == 0 then
                    card.ability.extra.cracked = true
                    return {
                        message = "Cracked!",
                    }
                end
            end
		elseif context.joker_main and card.ability.extra.cracked then
            return {
                x_mult = card.ability.extra.Xmult
            }
        elseif context.end_of_round and context.beat_boss and card.ability.extra.cracked and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.cracked = false
            card.ability.extra.current = card.ability.extra.safe_hands
            return {
                message = localize('k_reset')
            }
        end
    end
}

SMODS.Joker { --Student Loans
    key = 'loan_shark',
    name = 'Loan Shark',
	atlas = 'Joker',
	pos = { x = 10, y = 4 },
    rarity = 3,
	cost = 8,
    blueprint_compat = false,
    in_pool = function(self, args)
        return false
    end,
    config = {
        extra = { bankrupt = 15 } --Variables: bankrupt = max amount of debt
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bankrupt } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.dollars < 0 and not card.getting_sliced and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value + G.GAME.dollars + (G.GAME.dollar_buffer or 0)
            card:set_cost()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.GAME.dollar_buffer = 0
                    return true
                end
            }))
            return {
                dollars = -(G.GAME.dollars + (G.GAME.dollar_buffer or 0)),
                func = function()
                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - G.GAME.dollars
                    return true
                end,
                colour = G.C.MONEY
            }
        end
    end
}

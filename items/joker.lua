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

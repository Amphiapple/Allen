Allen.Challenge_stakes.c_allen_perkeo = 8

SMODS.Challenge { --Perkeo
    key = 'perkeo',
    loc_txt = {
        name = 'Domain Expansion'
    },
    rules = {
        custom = {
            {id = 'perkeo'},
            {id = 'gold_stake'},
            {id = 'domain_expansion_1'},
            {id = 'domain_expansion_2'},
        },
        modifiers = {
            {id = 'joker_slots', value = 1},
        }
    },
    restrictions = {
        banned_cards = {
            {id = 'v_antimatter'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.end_of_round and context.beat_boss then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local pool = {}
                    for k, v in pairs(G.jokers.cards) do
                        if v.ability.set == 'Joker' and (not v.edition) then
                            table.insert(pool, v)
                        end
                    end
                    if next(pool) then
                        local eligible_card = pseudorandom_element(pool, pseudoseed('domain_expansion'))
                        eligible_card:set_edition('e_negative', true)
                        check_for_unlock({type = 'have_edition'})
                    end
                    return true
                end
            }))
        end
    end
}

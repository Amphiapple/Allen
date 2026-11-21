Allen.Challenge_stakes.c_allen_drunkard = 6

SMODS.Challenge { --Drunkard
    key = 'drunkard',
    loc_txt = {
        name = 'Alcoholism'
    },
    rules = {
        custom = {
            {id = 'drunkard'},
            {id = 'purple_stake'},
            {id = 'alcoholism'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.modify_shop_card and context.card.ability.set == 'Joker' then
            local pos = pseudorandom_element(G.P_CENTER_POOLS.Joker, pseudoseed('drunkard')).pos
            context.card.children.center:set_sprite_pos(pos)
            context.card.drunk = true
        elseif context.modify_booster_card and context.card.ability.set == 'Joker' then
            local pos = pseudorandom_element(G.P_CENTER_POOLS.Joker, pseudoseed('drunkard')).pos
            context.card.children.center:set_sprite_pos(pos)
            context.card.drunk = true
        elseif context.card_added and context.card.ability.set == 'Joker' and not context.card.drunk then
            local pos = pseudorandom_element(G.P_CENTER_POOLS.Joker, pseudoseed('drunkard')).pos
            context.card.children.center:set_sprite_pos(pos)
            context.card.drunk = true
        end
    end
}

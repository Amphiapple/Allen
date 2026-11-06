--Challenge id function
function get_challenge_stake(e)
    local key = G.CHALLENGES[e.config.id].id
    if key and Challenge_stakes[key] then
        return Challenge_stakes[key].stake
    end
    return 1
end

--Recalculate cost function
function recalc_all_costs()
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.0,
        func = (function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then
                    v:set_cost()
                end
            end
            return true
        end)
    }))
end

--Change hand UI color function
function Allen.get_poker_hand_color(handname)
    if G.GAME.modifiers.haunted_hands_1 and G.GAME.seeing_double_hands[handname] then
        return darken(G.C.BLIND_SIZE, 0.1)
    end
    return darken(G.C.JOKER_GREY, 0.1)
end

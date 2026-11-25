Allen.Challenge_stakes.c_allen_wee = 4

local function is_stronger_hand(name, last_name, hand, last_hand)
    local poker_hands = {
        "Flush Five",
        "Flush House",
        "Five of a Kind",
        "Straight Flush",
        "Four of a Kind",
        "Full House",
        "Flush",
        "Straight",
        "Three of a Kind",
        "Two Pair",
        "Pair",
        "High Card"
    }
    -- Returns true if poker hand is stronger than last poker hand
    if name == last_name then
        table.sort(hand, function (a, b) return a:get_nominal('suit') > b:get_nominal('suit') end )
        table.sort(last_hand, function (a, b) return a:get_nominal('suit') > b:get_nominal('suit') end )
        for k, v in ipairs(hand) do
            if v.base.id > last_hand[k].base.id then
                return true
            elseif v.base.id < last_hand[k].base.id then
                return false
            end
        end
        return false
    else
        for k, v in ipairs(poker_hands) do
            if v == name then
                return true
            elseif v == last_name then
                return false
            end
        end
    end
end

SMODS.Challenge { --Wee Joker
    key = 'wee',
    loc_txt = {
        name = 'Big 2'
    },
    rules = {
        custom = {
            {id = 'wee'},
            {id = 'black_stake'},
            {id = 'big_2_1'},
            {id = 'big_2_2'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.final_scoring_step then
            if G.GAME.wee_hand and G.GAME.wee_handname and not is_stronger_hand(context.scoring_name, G.GAME.wee_handname, context.scoring_hand, G.GAME.wee_hand) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("timpani", 1)
                        attention_text({
                            scale = 1.4,
                            text = "Not Big!",
                            hold = 1.4,
                            align = "cm",
                            offset = { x = 0, y = -2.7 },
                            major = G.play,
                        })
                        return true
                    end,
                }))
                return{
                    Xmult = 0
                }
            else
                G.GAME.wee_handname = context.scoring_name
                G.GAME.wee_hand = context.scoring_hand
            end
        elseif context.end_of_round and not context.individual and not context.repetition then
            G.GAME.wee_hand = nil
            G.GAME.wee_handname = nil
        end
    end
}

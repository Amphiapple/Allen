Allen.Challenge_stakes.c_allen_drivers_license = 8

SMODS.Challenge { --Driver's License
    key = 'drivers_license',
    loc_txt = {
        name = 'Traffic Jam'
    },
    rules = {
        custom = {
            {id = 'drivers_license'},
            {id = 'gold_stake'},
            {id = 'traffic_jam_1'},
            {id = 'traffic_jam_2'},
            {id = 'traffic_jam_3'},
            {id = 'traffic_jam_4'},
        },
    },
    deck = {
        type = 'Challenge Deck',
        cards = {
            {s='D',r='2',e='m_stone'},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',e='m_glass'},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},
            {s='C',r='2',},{s='C',r='3',e='m_lucky'},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',e='m_wild'},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},
            {s='H',r='2',},{s='H',r='3',},{s='H',r='4',e='m_gold'},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',e='m_mult'},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},
            {s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',e='m_steel'},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',e='m_bonus'},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},
        }
    },

    calculate = function(self, context)
        if context.final_scoring_step then
            local count = 0
            for k, v in ipairs(G.hand.cards) do
                if v.config.center ~= G.P_CENTERS.c_base then
                    count = count + 1
                end
            end
            local temp_Xmult
            local temp_sound
            local temp_text
            if count == 3 or count == 4 then
                temp_Xmult = 1.5
                temp_sound = "multhit2"
                temp_text = "Safe!"
            elseif count == 2 or count == 5 then
                temp_Xmult = 1
                temp_sound = "multhit1"
                temp_text = "Close!"
            else
                temp_Xmult = 0.5
                temp_sound = "timpani"
                temp_text = "Danger!"
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound(temp_sound, 1)
                    attention_text({
                        scale = 1.4,
                        text = temp_text,
                        color = G.C.MULT,
                        hold = 1.4,
                        align = "cm",
                        offset = { x = 0, y = -2.7 },
                        major = G.play,
                    })
                    return true
                end,
            }))
            return{
                Xmult = temp_Xmult
            }
        end
    end
}

Allen.Challenge_stakes.c_allen_seance = 6

SMODS.Challenge { --Seance
    key = 'seance',
    loc_txt = {
        name = 'Spiritual Energy'
    },
    rules = {
        custom = {
            {id = 'seance'},
            {id = 'purple_stake'},
            {id = 'spiritual_energy_1'},
            {id = 'spiritual_energy_2'},
            {id = 'spiritual_energy_3'},
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
    apply = function(self)
        G.GAME.seance_energy = 1
    end,
    calculate = function(self, context)
        if context.before and next(context.poker_hands['Straight Flush']) then
            local temp_energy = G.GAME.seance_energy
            if G.GAME.seance_energy < 1.5 then
                G.GAME.seance_energy = 1
            else
                G.GAME.seance_energy = G.GAME.seance_energy - 0.5
            end
            return {
                xblindsize = G.GAME.seance_energy / (temp_energy)
            }
        elseif context.end_of_round and not context.individual and not context.repetition then
            G.GAME.seance_energy = G.GAME.seance_energy + 0.2
        end
    end
}

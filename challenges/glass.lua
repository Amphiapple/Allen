Allen.Challenge_stakes.c_allen_glass = 8

local smash_4_cards = {
    {id = 'j_dna'},
    {id = 'c_justice'},
    {id = 'c_death'},
    {id = 'c_cryptid'},
}

SMODS.Challenge { --Glass Joker
    key = 'glass',
    loc_txt = {
        name = 'Smash 4'
    },
    rules = {
        custom = {
            {id = 'glass'},
            {id = 'gold_stake'},
        },
        modifiers = {
            {id = 'joker_slots', value = 4},
        },
    },
    jokers = {
        {id = 'j_glass', eternal = true},
    },
    restrictions = {
        banned_cards = smash_4_cards,
    },
    deck = {
        type = 'Challenge Deck',
        cards = {
            {s='D',r='2',},{s='D',r='3',},{s='D',r='4',e='m_glass'},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},
            {s='C',r='2',},{s='C',r='3',},{s='C',r='4',e='m_glass'},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},
            {s='H',r='2',},{s='H',r='3',},{s='H',r='4',e='m_glass'},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},
            {s='S',r='2',},{s='S',r='3',},{s='S',r='4',e='m_glass'},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},
        }
    },
}

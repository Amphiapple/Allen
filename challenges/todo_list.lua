Allen.Challenge_stakes.c_allen_todo_list = 6

SMODS.Challenge { --To Do List
    key = 'to_do_list',
    loc_txt = {
        name = 'Safecracking'
    },
    rules = {
        custom = {
            {id = 'todo_list'},
            {id = 'purple_stake'},
            {id = 'safecracking'}
        },
    },
    jokers = {
        {id = 'j_todo_list', eternal = true, edition = 'negative'},
        {id = 'j_allen_safe', eternal = true, edition = 'negative'}
    },
    deck = {
        type = 'Challenge Deck',
    },
}

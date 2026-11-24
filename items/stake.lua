SMODS.Atlas {
    key = 'Stake',
    path = 'stakes.png',
    px = 29,
    py = 29,
}

SMODS.Atlas {
    key = 'Sticker',
    path = 'stickers.png',
    px = 71,
    py = 95,
}

SMODS.Stake {
    key = 'gold_ante',
    name = 'Ante Gold Stake',
    atlas = 'Stake',
    pos = { x = 0, y = 0 },
    sticker_atlas = 'Sticker',
    sticker_pos = { x = 0, y = 0 },
    applied_stakes = { 'gold' },
    prefix_config = { applied_stakes = { mod = false } },
    colour = HEX("ffcc00"),
    shiny = true,

    modifiers = function()
        G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
        G.GAME.win_ante = G.GAME.win_ante + 2
        G.GAME.modifiers.gold_ante = true
    end
}

SMODS.Stake {
    key = 'gold_reroll',
    name = 'Reroll Gold Stake',
    atlas = 'Stake',
    pos = { x = 1, y = 0 },
    sticker_atlas = 'Sticker',
    sticker_pos = { x = 1, y = 0 },
    applied_stakes = { 'gold' },
    prefix_config = { applied_stakes = { mod = false } },
    colour = HEX("ffcc00"),
    shiny = true,

    modifiers = function()
        G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
        G.GAME.base_reroll_cost = G.GAME.base_reroll_cost + 2
        G.GAME.modifiers.gold_reroll = true
    end
}

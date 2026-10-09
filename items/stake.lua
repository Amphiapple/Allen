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
    key = 'gold2',
    name = 'Golder Staker',
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
        G.GAME.modifiers.gold2_stake = true
    end


}
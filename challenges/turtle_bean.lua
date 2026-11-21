Allen.Challenge_stakes.c_allen_turtle_bean = 4

local rent_is_due_cards = {
    --vouchers except paint brush
    {id = 'v_overstock_norm'},
    {id = 'v_overstock_plus'},
    {id = 'v_clearance_sale'},
    {id = 'v_liquidation'},
    {id = 'v_hone'},
    {id = 'v_glow_up'},
    {id = 'v_reroll_surplus'},
    {id = 'v_reroll_glut'},
    {id = 'v_crystal_ball'},
    {id = 'v_omen_globe'},
    {id = 'v_telescope'},
    {id = 'v_observatory'},
    {id = 'v_grabber'},
    {id = 'v_nacho_tong'},
    {id = 'v_wasteful'},
    {id = 'v_recyclomancy'},
    {id = 'v_tarot_merchant'},
    {id = 'v_tarot_tycoon'},
    {id = 'v_planet_merchant'},
    {id = 'v_planet_tycoon'},
    {id = 'v_seed_money'},
    {id = 'v_money_tree'},
    {id = 'v_blank'},
    {id = 'v_antimatter'},
    {id = 'v_magic_trick'},
    {id = 'v_illusion'},
    {id = 'v_hieroglyph'},
    {id = 'v_petroglyph'},
    {id = 'v_directors_cut'},
    {id = 'v_retcon'},
    {id = 'v_palette'},
}

SMODS.Challenge { --Turtle Bean
    key = 'turtle_bean',
    loc_txt = {
        name = 'Rent is Due'
    },
    rules = {
        custom = {
            {id = 'turtle_bean'},
            {id = 'black_stake'},
            {id = 'rent_is_due_1'},
            {id = 'rent_is_due_2'},
            {id = 'rent_is_due_3'},
        },
    },
    restrictions = {
        banned_cards = rent_is_due_cards,
        banned_tags = {
            {id = 'tag_voucher'}
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.end_of_round and context.beat_boss then
            G.hand:change_size(-1)
            G.hand.config.card_limit = G.hand.config.card_limit-1
        end
    end
}

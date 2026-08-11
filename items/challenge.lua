Challenge_stakes = {
    c_allen_static = {stake = 6},
    c_allen_buy_now_pay_later = {stake = 6},
    c_allen_rent_is_due = {stake = 4},
    c_allen_domain_expansion = {stake = 8},
    c_allen_minesweeper = {stake = 8},
    c_allen_inversion = {stake = 8},
    c_allen_blue_percent = {stake = 5},
}

local thirteen_cards = {
    --extra played hands cards
    {id = 'j_burglar'},
    {id = 'v_grabber'},
    {id = 'v_nacho_tong'},
    --extra hand size cards
    {id = 'j_juggler'},
    {id = 'j_troubadour'},
    {id = 'j_turtle_bean'},
    {id = 'v_paint_brush'},
    {id = 'v_palette'},
}

SMODS.Challenge {
    key = 'thirteen_cards',
    loc_txt = {
        name = '13 Cards'
    },
    rules = {
        custom = {
            {id = 'thirteen_cards'},
            {id = 'amphiapple'},
        },
        modifiers = {
            {id = 'hand_size', value = 13},
            {id = 'hands', value = 3},
            {id = 'discards', value = 0},
            {id = 'dollars', value = 13},
        }
    },
    restrictions = {
        banned_cards = thirteen_cards,
        banned_tags = {
            {id = 'tag_juggle'},
        },
        banned_other = {
            {id = 'bl_water', type = 'blind'},
            {id = 'bl_needle', type = 'blind'},
            {id = 'bl_serpent', type = 'blind'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
    calculate = function(self, context)
        if context.drawing_cards and #G.hand.cards == 0 and
                not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end,
}

local static_cards = {
    --upwards scaling cards
    {id = 'j_ceremonial'},
    {id = 'j_ride_the_bus'},
    {id = 'j_runner'},
    {id = 'j_constellation'},
    {id = 'j_green_joker'},
    {id = 'j_red_card'},
    {id = 'j_madness'},
    {id = 'j_square'},
    {id = 'j_vampire'},
    {id = 'j_hologram'},
    {id = 'j_rocket'},
    {id = 'j_obelisk'},
    {id = 'j_lucky_cat'},
    {id = 'j_flash'},
    {id = 'j_trousers'},
    {id = 'j_castle'},
    {id = 'j_glass'},
    {id = 'j_wee'},
    {id = 'j_caino'},
    {id = 'j_yorick'},
}

SMODS.Challenge {
    key = 'static',
    loc_txt = {
        name = 'Static'
    },
    rules = {
        custom = {
            {id = 'purple_stake'},
            {id = 'stevecraft28980'},
        },
    },
    restrictions = {
        banned_cards = static_cards,
    },
    deck = {
        type = 'Challenge Deck',
    },
}

SMODS.Challenge {
    key = 'buy_now_pay_later',
    loc_txt = {
        name = 'Buy Now, Pay Later'
    },
    rules = {
        custom = {
            {id = 'purple_stake'},
            {id = 'buy_now_pay_later'},
            {id = 'buy_now_pay_later_2'},
            {id = 'rat_queen'},
        },
    },
    restrictions = {
        banned_cards = {
            {id = 'j_campfire'}
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.modify_shop_card and context.card.ability.set == 'Joker' then
            context.card.ability.couponed = true
            recalc_all_costs()
        elseif context.end_of_round and context.beat_boss then
            for k, v in ipairs(G.jokers.cards) do
                v:set_rental(true)
                v:juice_up()
            end
        end
    end
}

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

SMODS.Challenge {
    key = 'rent_is_due',
    loc_txt = {
        name = 'Rent is Due'
    },
    rules = {
        custom = {
            {id = 'black_stake'},
            {id = 'rent_is_due'},
            {id = 'rent_is_due_2'},
            {id = 'rent_is_due_3'},
            {id = 'synfulness'},
        },
    },
    restrictions = {
        banned_cards = rent_is_due_cards,
        banned_tags = {
            {id = 'tag_voucher'}
        }
    },
    deck = {
        type = 'Yellow Deck',
    },

    calculate = function(self, context)
        if context.buying_card and context.card.ability.set == 'Voucher' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.used_jokers[context.card.config.center_key] = nil
                    G.GAME.used_vouchers[context.card.config.center_key] = nil
                    return true
                end
            }))
        elseif context.end_of_round and context.beat_boss then
            G.hand:change_size(-1)
            G.hand.config.card_limit = G.hand.config.card_limit-1
        end
    end
}

SMODS.Challenge {
    key = 'domain_expansion',
    loc_txt = {
        name = 'Domain Expansion'
    },
    rules = {
        custom = {
            {id = 'gold_stake'},
            {id = 'domain_expansion'},
            {id = 'mr_dell'},
        },
        modifiers = {
            {id = 'joker_slots', value = 1},
        }
    },
    restrictions = {
        banned_cards = {
            {id = 'v_antimatter'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    calculate = function(self, context)
        if context.end_of_round and context.beat_boss then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local pool = {}
                    for k, v in pairs(G.jokers.cards) do
                        if v.ability.set == 'Joker' and (not v.edition) then
                            table.insert(pool, v)
                        end
                    end
                    if next(pool) then
                        local eligible_card = pseudorandom_element(pool, pseudoseed('domain_expansion'))
                        eligible_card:set_edition('e_negative', true)
                        check_for_unlock({type = 'have_edition'})
                    end
                    return true
                end
            }))
        end
    end
}

SMODS.Challenge {
    key = 'minesweeper',
    loc_txt = {
        name = 'Minesweeper'
    },
    rules = {
        custom = {
            {id = 'gold_stake'},
            {id = 'abandoned_deck'},
            {id = 'minesweeper'},
            {id = 'minesweeper_2'},
            {id = 'synfulness'},
        },
    },
    jokers = {
        {id = 'j_ride_the_bus', eternal = true}
    },
    deck = {
        type = 'Abandoned Deck',
        cards = {
            {s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='A',},
            {s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='A',},
            {s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='A',},
            {s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='A',},
        }
    },

    calculate = function(self, context)
        if context.before then
            local rank = pseudorandom_element({'J', 'Q', 'K'}, pseudoseed('minesweeper'))
            local suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('minesweeper'))
            local card_front = suit..'_'..rank
            SMODS.add_card({
                set = 'Playing Card',
                front = card_front,
                area = G.deck,
                skip_materialize = false,
                enhanced_poll = 1
            })
        elseif context.initial_scoring_step then
            local faces = false
            for k, v in ipairs(context.scoring_hand) do
                if v:is_face() then
                    faces = true
                end
            end
            if faces then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        G.STATE = G.STATES.GAME_OVER
                        G.STATE_COMPLETE = false
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Challenge {
    key = 'inversion',
    loc_txt = {
        name = 'Inversion'
    },
    rules = {
        custom = {
            {id = 'gold_stake'},
            {id = 'amphiapple'},
        },
        modifiers = {
            {id = 'hands', value = 3},
            {id = 'discards', value = 4},
            {id = 'joker_slots', value = 2},
            {id = 'consumable_slots', value = 5},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },
}

SMODS.Challenge {
    key = 'mega_purple_stake',
    loc_txt = {
        name = 'Mega Purple Stake'
    },
    rules = {
        custom = {
            {id = 'mega_purple'},
            {id = 'amphiapple'},
        },
    },
    restrictions = {
        banned_other = {
            {id = 'bl_final_vessel', type = 'blind'},
        }
    },
    deck = {
        type = 'Challenge Deck',
    },

    apply = function(self)
        G.GAME.modifiers.scaling = 3
    end
}

local blue_percent_cards = {
    --all jokers that are not significantly blue
    {id = 'j_joker'},
    {id = 'j_greedy_joker'},
    {id = 'j_lusty_joker'},
    {id = 'j_wrathful_joker'},
    {id = 'j_zany'},
    {id = 'j_mad'},
    {id = 'j_crazy'},
    {id = 'j_droll'},
    {id = 'j_wily'},
    {id = 'j_clever'},
    {id = 'j_devious'},
    {id = 'j_crafty'},
    {id = 'j_half'},
    {id = 'j_stencil'},
    {id = 'j_four_fingers'},
    {id = 'j_mime'},
    {id = 'j_credit_card'},
    {id = 'j_ceremonial'},
    {id = 'j_banner'},
    {id = 'j_marble'},
    {id = 'j_loyalty_card'},
    {id = 'j_8_ball'},
    {id = 'j_misprint'},
    {id = 'j_dusk'},
    {id = 'j_raised_fist'},
    {id = 'j_chaos'},
    {id = 'j_steel_joker'},
    {id = 'j_scary_face'},
    {id = 'j_abstract'},
    {id = 'j_delayed_grat'},
    {id = 'j_hack'},
    {id = 'j_pareidolia'},
    {id = 'j_gros_michel'},
    {id = 'j_even_steven'},
    {id = 'j_scholar'},
    {id = 'j_business'},
    {id = 'j_ride_the_bus'},
    {id = 'j_space'},
    {id = 'j_egg'},
    {id = 'j_burglar'},
    {id = 'j_blackboard'},
    {id = 'j_runner'},
    {id = 'j_sixth_sense'},
    {id = 'j_hiker'},
    {id = 'j_faceless'},
    {id = 'j_green_joker'},
    {id = 'j_todo_list'},
    {id = 'j_cavendish'},
    {id = 'j_card_sharp'},
    {id = 'j_red_card'},
    {id = 'j_madness'},
    {id = 'j_square'},
    {id = 'j_riff_raff'},
    {id = 'j_vampire'},
    {id = 'j_shortcut'},
    {id = 'j_hologram'},
    {id = 'j_vagabond'},
    {id = 'j_baron'},
    {id = 'j_rocket'},
    {id = 'j_midas_mask'},
    {id = 'j_photograph'},
    {id = 'j_gift'},
    {id = 'j_turtle_bean'},
    {id = 'j_erosion'},
    {id = 'j_reserved_parking'},
    {id = 'j_mail'},
    {id = 'j_to_the_moon'},
    {id = 'j_hallucination'},
    {id = 'j_fortune_teller'},
    {id = 'j_juggler'},
    {id = 'j_drunkard'},
    {id = 'j_stone'},
    {id = 'j_golden'},
    {id = 'j_lucky_cat'},
    {id = 'j_baseball'},
    {id = 'j_bull'},
    {id = 'j_diet_cola'},
    {id = 'j_trading'},
    {id = 'j_flash'},
    {id = 'j_popcorn'},
    {id = 'j_ramen'},
    {id = 'j_smiley'},
    {id = 'j_campfire'},
    {id = 'j_ticket'},
    {id = 'j_mr_bones'},
    {id = 'j_acrobat'},
    {id = 'j_sock_and_buskin'},
    {id = 'j_swashbuckler'},
    {id = 'j_troubadour'},
    {id = 'j_certificate'},
    {id = 'j_throwback'},
    {id = 'j_hanging_chad'},
    {id = 'j_rough_gem'},
    {id = 'j_bloodstone'},
    {id = 'j_arrowhead'},
    {id = 'j_glass'},
    {id = 'j_ring_master'},
    {id = 'j_wee'},
    {id = 'j_merry_andy'},
    {id = 'j_oops'},
    {id = 'j_matador'},
    {id = 'j_hit_the_road'},
    {id = 'j_trio'},
    {id = 'j_family'},
    {id = 'j_order'},
    {id = 'j_tribe'},
    {id = 'j_stuntman'},
    {id = 'j_invisible'},
    {id = 'j_brainstorm'},
    {id = 'j_shoot_the_moon'},
    {id = 'j_drivers_license'},
    {id = 'j_cartomancer'},
    {id = 'j_burnt'},
    {id = 'j_bootstraps'},
    {id = 'j_caino'},
    {id = 'j_yorick'},
    {id = 'j_chicot'},
    {id = 'j_perkeo'},
    --vouchers
    {id = 'v_overstock_norm'},
    {id = 'v_overstock_plus'},
    {id = 'v_reroll_surplus'},
    {id = 'v_reroll_glut'},
    {id = 'v_crystal_ball'},
    {id = 'v_omen_globe'},
    {id = 'v_wasteful'},
    {id = 'v_recyclomancy'},
    {id = 'v_tarot_merchant'},
    {id = 'v_tarot_tycoon'},
    {id = 'v_blank'},
    {id = 'v_antimatter'},
    {id = 'v_hieroglyph'},
    {id = 'v_petroglyph'},
    {id = 'v_directors_cut'},
    {id = 'v_retcon'},
    --consumables
    {id = 'c_star'},
    {id = 'c_sun'},
    {id = 'c_world'},
}

SMODS.Challenge {
    key = 'blue_percent',
    loc_txt = {
        name = 'Blue%'
    },
    rules = {
        custom = {
            {id = 'blue_stake'},
            {id = 'blue_deck'},
            {id = 'blue_percent'},
            {id = 'blue_percent_2'},
        },
    },
    restrictions = {
        banned_cards = blue_percent_cards,
        banned_other = {
            {id = 'bl_club', type = 'blind'},
            {id = 'bl_final_acorn', type = 'blind'},
            {id = 'bl_final_leaf', type = 'blind'},
            {id = 'bl_final_vessel', type = 'blind'},
            {id = 'bl_final_heart', type = 'blind'},
        }
    },
    deck = {
        type = 'Blue Deck',
        cards = {
            {s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},
            {s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},
            {s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},
            {s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},
            {s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},
        }
    },

    calculate = function(self, context)
        if context.skip_blind and G.GAME.blind_on_deck == "Big" then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        elseif context.setting_blind and context.blind.name == "Big Blind" then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        elseif context.initial_scoring_step then
            for k, v in ipairs(context.full_hand) do
                if not (v:is_suit("Clubs") or
                        v.ability.effect == "Bonus Card" or
                        (v.edition and v.edition.foil) or
                        (v.seal and v.seal == "Blue")) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        func = function()
                            G.STATE = G.STATES.GAME_OVER
                            G.STATE_COMPLETE = false
                            return true
                        end
                    }))
                end
            end
        end
    end,
}

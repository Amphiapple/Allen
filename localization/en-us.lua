return {
    descriptions = {
        Blind = {
            bl_allen_luchador = {
                name = 'The Luchador',
                text = {
                    'Destroy a random',
                    'Joker when defeated',
                }
            },
        },
        Joker = {
            j_allen_safe = {
                name = 'The Safe',
                text = {
                    'Play {C:attention}#1#{} more hands',
                    'on {C:attention}To Do List{} to crack',
                },
            },
            j_allen_safe_cracked = {
                name = 'The Safe',
                text = {
                    '{X:mult,C:white}X#2#{} Mult',
                    'Resets when {C:attention}Boss{}',
                    'Blind{} is defeated'
                }
            },
        },
        Stake = {
            stake_allen_golder = {
                name = "Golder Staker",
                text = {
                    '{C:red}+1{} Discard',
                    'Winning Ante increased to Ante {C:attention}10{}',
                    '{s:0.8}Applies all previous Stakes{}'
                }
            }
        },
        Other = {
            allen_golder_sticker = {
                name = "Golder Sticker",
                text = {
                    'Used this Joker',
                    'to win on {C:attention}Golder',
                    '{C:attention}Stake{} difficulty',
                }
            },
        }
    },
    misc = {
        v_text = {
            --jokers
            ch_c_joker = {
                "{C:attention}Joker's{} challenge"
            },
            ch_c_half = {
                "{C:attention}Half Joker's{} challenge"
            },
            ch_c_credit_card = {
                "{C:attention}Credit Card's{} challenge"
            },
            ch_c_even_steven = {
                "{C:attention}Even Steven's{} challenge"
            },
            ch_c_odd_todd = {
                "{C:attention}Odd Todd's{} challenge"
            },
            ch_c_supernova = {
                "{C:attention}Supernova's{} challenge"
            },
            ch_c_ride_the_bus = {
                "{C:attention}Ride The Bus'{} challenge"
            },
            ch_c_ice_cream = {
                "{C:attention}Ice Cream's{} challenge"
            },
            ch_c_superposition = {
                "{C:attention}Superposition's{} challenge"
            },
            ch_c_to_do_list = {
                "{C:attention}To Do List's{} challenge"
            },
            ch_c_luchador = {
                "{C:attention}Luchador's{} challenge"
            },
            ch_c_turtle_bean = {
                "{C:attention}Turtle Bean's{} challenge"
            },
            ch_c_acrobat = {
                "{C:attention}Acrobat's{} challenge"
            },
            ch_c_troubadour = {
                "{C:attention}Troubadour's{} challenge"
            },
            ch_c_throwback = {
                "{C:attention}Throwback's{} challenge"
            },
            ch_c_blueprint = {
                "{C:attention}Blueprint's{} challenge"
            },
            ch_c_trio = {
                "{C:attention}Trio's{} challenge"
            },
            ch_c_wee = {
                "{C:attention}Wee Joker's{} challenge"
            },
            ch_c_drivers_license = {
                "{C:attention}Driver's License's{} challenge"
            },
            ch_c_perkeo = {
                "{C:attention}Perkeo's{} challenge"
            },

            --deck rules
            ch_c_blue_deck = {
                "Challenge is played on {C:blue}Blue Deck{}"
            },
            ch_c_abandoned_deck = {
                "Challenge is played on {C:attention}Abandoned Deck{}"
            },

            --stake rules
            ch_c_black_stake = {
                "Challenge is played on Black Stake"
            },
            ch_c_blue_stake = {
                "Challenge is played on {C:blue}Blue Stake{}"
            },
            ch_c_purple_stake = {
                "Challenge is played on {C:purple}Purple Stake{}"
            },
            ch_c_gold_stake = {
                "Challenge is played on {C:gold}Gold Stake{}"
            },

            --special challenge rules
            ch_c_the_snap_1 = {
                "Start with {C:red}-1{} card slot and"
            },
            ch_c_the_snap_2 = {
                "{C:red}-1{} booster slot available in the shop"
            },

            ch_c_buy_now_pay_later_1 = {
                "All {C:attention}Jokers{} are free, but become"
            },
            ch_c_buy_now_pay_later_2 = {
                "{C:attention,T:rental}rental{} when {C:attention}Boss Blind{} is defeated"
            },

            ch_c_even_parity = {
                "Score no chips if {C:red}Mult{} is not {C:attention}even{}"
            },

            ch_c_odd_parity = {
                "Score no chips if {C:blue}Chips{} is not {C:attention}odd{}"
            },

            ch_c_minesweeper_1 = {
                "Add a random {C:attention}face{} card to your deck each hand played"
            },
            ch_c_minesweeper_2 = {
                "Lose run when {C:attention,T:j_ride_the_bus}Ride the Bus{} resets"
            },

            ch_c_meltdown = {
                "Lose run when {C:attention,T:j_ice_cream}Ice Cream{} is eaten or removed"
            },

            ch_c_safecracking = {
                "{C:red}X5{C:attention} Boss Blind{} size"
            },

            ch_c_critical_hit_1 = {
                "All {C:attention}Boss Blinds{} are {C:attention}The Luchador{}"
            },
            ch_c_critical_hit_2 = {
                "Disable the current {C:attention}Boss Blind{} if score catches fire"
            },

            ch_c_rent_is_due_1 = {
                "All {C:attention}Vouchers{} are {C:attention,T:v_paint_brush}Paint Brush{}"
            },
            ch_c_rent_is_due_2 = {
                "{C:attention}Vouchers{} cost {C:money}$5{} more and {C:red}-1{}"
            },
            ch_c_rent_is_due_3 = {
                "hand size when {C:attention}Boss Blind{} is defeated"
            },

            ch_c_dishonest_woodcutter_1 = {
                "Create a free {C:attention}Joker{} the first time"
            },
            ch_c_dishonest_woodcutter_2 = {
                "you sell a {C:attention}Joker{} each round"
            },

            ch_c_last_stand = {
                "Score no chips except on {C:attention}final hand{} of round"
            },

            ch_c_thirteen_cards = {
                "After round begins, draw no cards"
            },

            ch_c_old_but_gold = {
                "Booster Packs cost {C:money}$1{} more each {C:attention}Ante{}"
            },

            ch_c_blue_percent_1 = {
                "Must play only {C:clubs}Clubs{}, {C:attention}Bonus{}, {C:attention}Wild{}, {C:dark_edition}Foil{}, and {C:blue}Blue Seal{} cards"
            },
            ch_c_blue_percent_2 = {
                "Must play every {C:attention}Small Blind{} and skip every {C:attention}Big Blind{}"
            },

            ch_c_wee_1 = {
                "Score no chips if {C:attention}poker hand{} is not stronger"
            },
            ch_c_wee_2 = {
                "than last scored {C:attention}poker hand{} in the round"
            },

            ch_c_traffic_jam_1 = {
                "Score is affected by {C:attention}Enhanced cards{} held in hand"
            },
            ch_c_traffic_jam_2 = {
                "{C:attention}3~4 Enhanced cards{}: {X:mult,C:white}X1.5{} Mult"
            },
            ch_c_traffic_jam_3 = {
                "{C:attention}2{} or {C:attention}5 Enhanced cards{}: {X:mult,C:white}X1{} Mult"
            },
            ch_c_traffic_jam_4 = {
                "{C:attention}0~1{} or {C:attention}6+ Enhanced cards{}: {X:mult,C:white}X0.5{} Mult"
            },

            ch_c_domain_expansion_1 = {
                "Add {C:dark_edition}Negative{} to a random {C:attention}Joker{}"
            },
            ch_c_domain_expansion_2 = {
                "when {C:attention}Boss Blind{} is defeated"
            },
            
            ch_c_million = {
                "Required score scales extremely fast for each {C:attention}Ante{}"
            },

            ch_c_no_negative = {
                "{C:dark_edition}Negative{C:attention} Jokers{} no longer appear"
            }
        },
    },
}

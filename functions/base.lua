--Challenge id function
function get_challenge_stake(e)
    local key = G.CHALLENGES[e.config.id].id
    if key and Challenge_stakes[key] then
        return Challenge_stakes[key].stake
    end
    return 1
end

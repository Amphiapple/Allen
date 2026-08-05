SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
})

local functions = {
    'base',
    'hook',
}

for k, v in ipairs(functions) do
    local success, error_msg = pcall(function()
        local init, error = SMODS.load_file("functions/" .. v .. ".lua")
        if not error then
            if init then
                init()
            end
            sendDebugMessage("Loaded module: " .. v)
        end
    end)
    if not success then
        sendErrorMessage("Error in module " .. v .. ": " .. error_msg)
    end
end

local items = {
    'challenge',
    'joker'
}

for k, v in ipairs(items) do
    local success, error_msg = pcall(function()
        local init, error = SMODS.load_file("items/" .. v .. ".lua")
        if not error then
            if init then
                init()
            end
            sendDebugMessage("Loaded module: " .. v)
        end
    end)
    if not success then
        sendErrorMessage("Error in module " .. v .. ": " .. error_msg)
    end
end
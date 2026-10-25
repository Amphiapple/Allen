Allen.drag_conditions = {}

-- Add condition for disabling dragging
--- @param k string
--- @param v any
function Allen.add_drag_condition(k, v)
    Allen.drag_conditions[k] = v
end

-- Prevent dragging if conditions are met
--- @param card any
function Allen.prevent_drag(card)
    for _, v in pairs(Allen.drag_conditions) do
        if v(card) == true then
            return true
        end
    end
    return false
end

local move_old = Moveable.drag
function Moveable.drag(self, offset)
    local card = self
    if card.is and type(card.is) == "function" and card:is(Card) and Allen.prevent_drag(card) then
        return
    end
    return move_old(self, offset)
end
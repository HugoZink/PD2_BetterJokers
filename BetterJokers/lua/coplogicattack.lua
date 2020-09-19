-- Allow cops to still turn even if they're not allowed to move
local coplogicattack_checkshouldturn_orig = CopLogicAttack.chk_should_turn
function CopLogicAttack.chk_should_turn(data, my_data)
    if not data.unit:brain() or not data.unit:brain().is_holding then
        return coplogicattack_checkshouldturn_orig(data, my_data)
    end

	return not my_data.turning and not my_data.has_old_action and not data.unit:movement():chk_action_forbidden("turn") and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised
end

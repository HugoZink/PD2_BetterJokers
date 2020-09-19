dofile(ModPath .. "core.lua")

Hooks:PostHook(GroupAIStateBase, "convert_hostage_to_criminal", "betterjokers_converthostagetocriminal", function(self, unit, peer_unit)
    local player_unit = peer_unit or managers.player:player_unit()
	local unit_data = self._police[unit:key()]
    if unit_data and alive(player_unit) then
        local peer_id = player_unit:network() and player_unit:network():peer() and player_unit:network():peer():id()
        unit:base().joker_owner_peer_id = peer_id
        unit:brain().joker_owner_peer_id = peer_id
        BetterJokers:ApplyConvertedContour(unit)

        -- Set exclusive access ID
        local my_peer_id = LuaNetworking:LocalPeerID()
        if peer_id == my_peer_id and BetterJokers.settings.joker_exclusive_access then
            self._unit:base().exclusive_owner_peer_id = my_peer_id
        elseif peer_id ~= my_peer_id and BetterJokers.exclusiveAccessPeers[peer_id] then
            self._unit:base().exclusive_owner_peer_id = peer_id
        end
    end
    
    -- Mark this cop as a joker
    unit:base().is_convert = true
end)

-- Fix jokers despawning in heists like Beneath the Mountain
function ElementSpawnEnemyDummy:unspawn_all_units()
	for _, unit in ipairs(self._units) do
		if alive(unit) and not unit:base().is_convert and not unit:brain().is_convert and not (unit:brain()._logic_data and unit:brain()._logic_data.is_converted) then
			unit:brain():set_active(false)
			unit:base():set_slot(unit, 0)
		end
	end
end

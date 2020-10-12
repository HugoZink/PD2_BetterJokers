-- Fix jokers despawning in heists like Beneath the Mountain
function ElementSpawnEnemyDummy:unspawn_all_units()
	for _, unit in ipairs(self._units) do
		if alive(unit) and not unit:base().is_convert then
			unit:brain():set_active(false)
			unit:base():set_slot(unit, 0)
		end
	end
end

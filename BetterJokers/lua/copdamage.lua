dofile(ModPath .. "core.lua")

-- If a converted cop dies, unregister them from the converts list.
Hooks:PostHook(CopDamage, "_on_death", "BetterJokers_RemoveJokerOnDeath", function(self)
    if self._unit:base().is_convert and BetterJokers.converts then
        for i, unit in pairs(BetterJokers.converts) do
            if unit == self._unit then
                table.remove(BetterJokers.converts, i)
            end
        end
    end
end)

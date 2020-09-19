dofile(ModPath .. "core.lua")

-- On convert, register the unit as a joker
Hooks:PostHook(CopBrain, "convert_to_criminal", "betterjokers_registerjoker", function(self)
    self._unit:base().is_convert = true
    self.is_convert = true

    table.insert(BetterJokers.converts, self._unit)

    -- Give jokers the same access type as bots
    local chartweak = deep_clone(self._logic_data.char_tweak)
    chartweak.access = 'teamAI1'
    self._logic_data.char_tweak = chartweak
    self._logic_data.important = true

    self._unit:character_damage()._char_tweak = chartweak
    self._unit:movement()._tweak_data = chartweak
end)

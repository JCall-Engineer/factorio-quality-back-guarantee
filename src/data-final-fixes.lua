local quality_multipliers = { 1, 1.3, 1.6, 1.9, 2.5 }
local module_bases = { 1, 2, 2.5 }
local module_names = { "quality-module", "quality-module-2", "quality-module-3" }

--[[
In Factorio, quality is expressed as /10 instead of /100
This is due to the precision of type EventValue limited to two decimal places
And quality often works with half percents which would require a third digit when expressed as a raw decimal value
]]
local target_q3_legendary = settings.startup["target-q3-legendary-quality-percent"].value / 10

local normal_base = target_q3_legendary / (quality_multipliers[5] * module_bases[3])

for module_index, module_name in ipairs(module_names) do
	local module = data.raw["module"][module_name]
	if module then
		module.effect.quality = normal_base * module_bases[module_index]
	end
end

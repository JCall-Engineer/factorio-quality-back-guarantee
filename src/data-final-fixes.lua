local quality_multipliers = { 1, 1.3, 1.6, 1.9, 2.5 }
local module_bases = { 1, 2, 2.5 }
local module_names = { "quality-module", "quality-module-2", "quality-module-3" }
local target_q3_legendary = settings.startup["target-q3-legendary-quality"].value

local normal_base = target_q3_legendary / (quality_multipliers[5] * module_bases[3])

for module_index, module_name in ipairs(module_names) do
	local module = data.raw["module"][module_name]
	if module then
		module.effect.quality = normal_base * module_bases[module_index]
	end
end

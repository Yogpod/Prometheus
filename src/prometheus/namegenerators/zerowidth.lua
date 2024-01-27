-- namegenerators/zerowidth.lua
--
-- This Script provides a function for generation of zero width characters
local util = require("prometheus.util")

--format: Multiline
local zeroWidth = {'⁪',
	'⁫',
	'⁬',
	'⁭',
	'⁮',
	--'⁩',
	'⁯',
	'⁠',
	'⁡',
	'⁢',
	'⁢',
	'⁣',
	'⁤',
	--'⁦',
	--'⁧',
	--'⁨',
	'،',
	'​',
	'‌',
	--'‏',
	--'‎'
}

local function generateName(id, scope)
	local name = {}
	local d = id % #zeroWidth
	id = (id - d) / #zeroWidth
	table.insert(name, zeroWidth[d + 1])

	while id > 0 do
		local d = id % #zeroWidth
		id = (id - d) / #zeroWidth
		table.insert(name, zeroWidth[d + 1])
	end

	return table.concat(name, "_")
end

local function prepare(ast)
	util.shuffle(zeroWidth)
end

return {
	generateName = generateName,
	prepare = prepare
}
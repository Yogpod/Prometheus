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
	--'⁦',
	--'⁧',
	--'⁨',
	'،',
	'​',
	'‌',
	--'‏',
	--'‎'
}

local zeroWidthStart = {'⁢', '⁣', '⁤'}

local function generateName(id, scope)
	local name = ''
	local d = id % #zeroWidthStart
	id = (id - d) / #zeroWidthStart
	name = name .. zeroWidthStart[d + 1]

	while id > 0 do
		local d = id % #zeroWidth
		id = (id - d) / #zeroWidth
		name = name .. zeroWidth[d + 1]
	end

	return name
end

local function prepare(ast)
	util.shuffle(zeroWidth);
	util.shuffle(zeroWidthStart);
end

return {
	generateName = generateName,
	prepare = prepare
}
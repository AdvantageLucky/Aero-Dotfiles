-- Tooltip
---@return string
local function fortune()
	local f = io.popen("fortune")
	local tooltip = ""

	if f ~= nil then
		tooltip = f:read("*a")
		f:close()
	end

	return tooltip
end

require("cord").setup({
	editor = {
		tooltip = fortune(),
	},

	timestamp = {
		enabled = false,
	},
	display = {
		theme = "minecraft",
		flavor = "accent",
	},
	text = {
		workspace = "ᓚᘏᗢ",
	},
})

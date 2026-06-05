return {
	'vieitesss/miniharp.nvim',
	version = '*', -- latest stable release
	-- branch = 'main', -- latest nightly version
	opts = {
		autoload = true,
		autosave = true,
		show_on_autoload = false,
		-- notifications = true,
		ui = {
			position = 'center', -- `top-left`, `top-right`, `bottom-left`, `bottom-right`.
			show_hints = true,
			enter = true, -- Whether to enter the floating window or not
		},
	},
}

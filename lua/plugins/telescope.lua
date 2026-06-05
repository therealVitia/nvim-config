-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                color_devicons = true,
                path_displays = "smart",
                layout_config = {
					vertical = {
						width = 400,
					}
                }
            }
        })
    end
}

-- map variable for readability
local map = vim.keymap.set

-- Sourcing lua files
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source file" })
map("n", "<leader>x", ":.lua<CR>", { silent = true, desc = "Source line" })
map("v", "<leader>x", ":lua<CR>", { silent = true, desc = "Source selected line" })

-- Quick save & quit
map("n", "<leader>w", ":wa<CR>", { silent = true, desc = "Write" })
map("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })

-- Buffer management
map("n", "<Tab>", ":bn<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-Tab>", ":bp<CR>", { silent = true, desc = "Previous buffer" })

-- Window management
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
--
-- Window resize
map("n", "<C-Up>", ":resize +2<CR>", { silent = true, desc = "Resize Upward" })
map("n", "<C-Down>", ":resize -2<CR>", { silent = true, desc = "Resize Downward" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Resize Leftward" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Resize Rightward" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })

-- Creating splits
map("n", "<leader>sv", ":vsplit<CR>", { silent = true, desc = "Create vertical split" })
map("n", "<leader>sh", ":split<CR>", { silent = true, desc = "Create horizontal split" })

-- Moving lines in visual line mode
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected line up" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected line down" })

-- Qol
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Esc removes search highlighting" }) -- removes search highlighting
map("n", "n", "nzzzv", { desc = "Center the window when navigating search" }) -- navigating search centers the window
map("n", "N", "Nzzzv", { desc = "Center the window when navigating search" })
map("i", "<C-BS>", "<C-w>", { desc = "Deletes current word in insert mode" })

-- Quick fix list navigation
map("n", "<leader>j", ":cnext<CR>", { silent = true, desc = "Next item" })
map("n", "<leader>k", ":cprev<CR>", { silent = true, desc = "Previous item" })

-- Showing diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show floating diagnostics for current line" })

-- Remap esc-esc to quit terminal mode
map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Quit terminal mode" })

-- Neogen mapping
map('n', '<leader>nf', ":lua require('neogen').generate()<CR>", {
	silent = true,
	noremap = true,
	desc = "Generate brief comment for a function"
})

-- TodoTelescope mapping
map('n', '<leader>fgc', ":TodoTelescope<CR>", {
	silent = true,
	noremap = true,
	desc = "Search for TODO comments in project"
})

-- Persistence mapping
map("n", "<leader>ps", function ()
	require("persistence").load()
end, { desc = "Load the session of the cwd" }
)
map("n", "<leader>pS", function ()
	require("persistence").select()
end, { desc = "Select a session to load" }
)
map("n", "<leader>pl", function ()
	require("persistence").load({ last = true })
end, { desc = "Load the last session" }
)
map("n", "<leader>pd", function ()
	require("persistence").stop()
end, { desc = "Stop persistence" }
)

-- Harpoon mapping
local miniharp = require('miniharp')
map('n', '<leader>m', miniharp.toggle_file, { desc = 'miniharp: toggle file mark' })
map('n', '<C-n>', miniharp.next, { desc = 'miniharp: next file mark' })
map('n', '<C-p>', miniharp.prev, { desc = 'miniharp: prev file mark' })
map('n', '<leader>l', miniharp.show_list, { desc = 'miniharp: toggle marks list' })
map('n', '<leader>L', miniharp.enter_list, { desc = 'miniharp: enter marks list' })

map('n', '<leader>1', function ()
	miniharp.go_to(1)
end, { desc = 'miniharp: go to mark 1' }
)
map('n', '<leader>2', function ()
	miniharp.go_to(2)
end, { desc = 'miniharp: go to mark 2' }
)
map('n', '<leader>3', function ()
	miniharp.go_to(3)
end, { desc = 'miniharp: go to mark 3' }
)
map('n', '<leader>4', function ()
	miniharp.go_to(4)
end, { desc = 'miniharp: go to mark 4' }
)

-- Compiler mapping
map('n', '<leader>cm', "<cmd>CompilerOpen<CR>", { noremap = true, silent = true })
map('n', '<leader>cr', "<cmd>CompilerStop<CR>" .. "<cmd>CompilerRedo<CR>", { noremap = true, silent = true })
map('n', '<leader>cc', "<cmd>CompilerToggleResults<CR>", { noremap = true, silent = true })

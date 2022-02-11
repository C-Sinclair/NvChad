local map = require("core.utils").map

-- keymappings
map("n", "<C-p>", [[ :Telescope git_files<CR>" ]])
map("n", "<C-f>", [[ :Telescope live_grep<CR>]])
map("n", "<C-b>", [[ :Telescope buffers<CR> ]])
map("n", "<C-t><C-t>", [[ :Telescope resume<CR> ]])
map("n", "<C-g>d", [[ :lua require('harpoon.mark').add_file()<CR> ]])
map("n", "<C-g><C-g>", [[ :lua require('harpoon.ui').toggle_quick_menu()<CR> ]])

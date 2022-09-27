local map = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode, 
        key, 
        result,
        {noremap = true, silent = true}
    )
end

map("n", "<leader>ol", "<CMD>SessionLoad<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")

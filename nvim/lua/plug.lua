local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
    execute "packadd packer.nvim"
end

vim.cmd("packadd packer.nvim")

local packer = require "packer"
local util = require "packer.util"

packer.init({
    package_root = util.join_paths(fn.stdpath("data"), "site", "pack")
})

packer.startup(function()
    local use = use
    
    use "glepnir/dashboard-nvim"

    use "nvim-lua/telescope.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "jremmen/vim-ripgrep"
    use { "nvim-telescope/telescope-file-browser.nvim",
        require("telescope").setup {
            extensions = {
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true,
                },
            },
        },
    }
    require("telescope").load_extension "file_browser"
    
    use "nvim-treesitter/nvim-treesitter"
    
    use "tjdevries/colorbuddy.nvim"
    use "bkegley/gloombuddy"

end)


local fn = vim.fn
-- Automatically install packer if it does not exist
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reloads neovim when plugins.lua change
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return packer.startup(function (use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- Colorschemes
    use 'Shatur/neovim-ayu'
    use 'folke/tokyonight.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use 'rakr/vim-one'
    use 'EdenEast/nightfox.nvim'
    use 'rose-pine/neovim'
    use 'catppuccin/nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- use 'jose-elias-alvarez/null-ls.nvim'
  --
  ---- DAP
    use 'mfussenegger/nvim-dap'

    -- Respecting Editor Config
    use 'gpanders/editorconfig.nvim'

    -- Telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
      require = {{ 'nvim-lua/plenary.nvim' }}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'kyazdani42/nvim-web-devicons'

    -- TreeSitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Auto pairs
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'machakann/vim-sandwich'

    -- Commentary
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Gitsign
    use { 'lewis6991/gitsigns.nvim'}

    -- Nvim-tree
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }}

    -- Lualine
    use {'nvim-lualine/lualine.nvim',   requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

    -- Impatient
    use 'lewis6991/impatient.nvim'

    -- Blankline
    use "lukas-reineke/indent-blankline.nvim"

    use 'norcalli/nvim-colorizer.lua'
    use 'mrshmllow/document-color.nvim'

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    use 'vim-test/vim-test'

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

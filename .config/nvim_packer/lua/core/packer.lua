vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    -- Telescope (Fuzzy Finder)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
    -- One Dark Theme
    --	use 'navarasu/onedark.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Treesitter (better Syntax Highlighting)
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

    -- Command Line view at the bottom
    use('nvim-lualine/lualine.nvim')

	use('tpope/vim-fugitive')
	use('github/copilot.vim')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
            -- LSP support
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {'honza/vim-snippets'}
		}
	}

    -- Better comments
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

    use 'alexghergh/nvim-tmux-navigation'
    use 'FabijanZulj/blame.nvim'

    use "lukas-reineke/indent-blankline.nvim"

    use "nvim-tree/nvim-web-devicons"

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

end)

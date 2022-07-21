call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
call plug#end()

lua << EOF
	require'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true,
		}
	}
EOF

let g:nvcode_termcolors=256

syntax on
colorscheme lifehold

set nocompatible

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
if has('nvim-0.7')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
else
  Plug 'sheerun/vim-polyglot'
endif
call plug#end()

if has('nvim-0.7')
lua << EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    }
  }
EOF
endif

set t_Co=256 " 256 colors
let g:nvcode_termcolors=256

syntax on
colorscheme lifehold

set encoding=utf-8
set tabstop=8
set shiftwidth=8
set magic

set ruler
set cc=80
set nowrap
set autoindent

set number
set scrolloff=3
set sidescroll=3

set ignorecase
set smartcase

" Force write before changing buffer
set nohidden

set incsearch
set showmatch
set hlsearch

set mouse=a

set fo+=t
set fo-=l

" FZF config

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'relative': v:true, 'yoffset': 1.0, 'border': 'none' } }

nnoremap <C-p> :FZF<cr>

" EditorConfig config

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
autocmd BufEnter * :EditorConfigReload " Fixes a bug when using neovim

" Default file indentation

autocmd FileType c setlocal noet ts=8 sw=8 tw=80
autocmd FileType h setlocal noet ts=8 sw=8 tw=80
autocmd FileType cpp setlocal noet ts=8 sw=8 tw=80
autocmd FileType go setlocal noet ts=4 sw=4
autocmd FileType sh setlocal noet ts=4 sw=4
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType xml setlocal et ts=2 sw=2
autocmd FileType css setlocal et ts=2 sw=2
autocmd FileType scss setlocal et ts=2 sw=2
autocmd FileType markdown setlocal et ts=2 sw=2 tw=80
autocmd BufRead,BufNewFile *.js setlocal et ts=2 sw=2
autocmd FileType json setlocal et ts=2 sw=2
autocmd FileType toml setlocal et ts=2 sw=2
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType meson setlocal et ts=2 sw=2
autocmd FileType typescript setlocal et ts=2 sw=2
autocmd FileType python setlocal et ts=4 sw=4 tw=79
autocmd FileType java setlocal et ts=4 sw=4 tw=100
autocmd FileType cs setlocal et ts=4 sw=4 tw=100
autocmd FileType tex setlocal et ts=4 sw=4 tw=80
autocmd FileType text setlocal tw=80
autocmd BufNewFile,BufRead * if expand('%:t') == 'APKBUILD' | set ft=sh | endif
autocmd BufNewFile,BufRead * if expand('%:t') == 'PKGBUILD' | set ft=sh | endif

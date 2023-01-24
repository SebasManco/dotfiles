" General configurations 
" ------------------------------------------------------------------------------------------------
set number 
set relativenumber 
set mouse=a
set showmatch
set hlsearch 
set autoindent 
set nocompatible
set colorcolumn=97
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
        
syntax enable 
filetype plugin indent on 


" Plugins
" ------------------------------------------------------------------------------------------------
call plug#begin()

Plug 'lervag/vimtex'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'SirVer/ultisnips'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/zen-mode.nvim'
Plug 'preservim/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let g:vimtex_view_method = 'sioyek'
let g:vimtex_compiler_engine = 'lualatex'
"let g:vimtex_quickfix_mode = 0
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" Snippets
" ------------------------------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

lua << EOF
require'lspconfig'.texlab.setup{}
EOF

lua << EOF 
require'lspconfig'.clangd.setup{}
EOF 

lua << END
require'lualine'.setup{
	options = {
        theme = "catppuccin"
        -- ... the rest of your lualine config
    }
}
END
lua << EOF
  require'zen-mode'.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF 
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
EOF 


inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" shortcuts
" -----------------------------------------------------------------------------------------------
let mapleader=","
let maplocalleader = ","
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

inoremap ,, <Esc>
nnoremap <leader>z :ZenMode<CR> 

nnoremap <leader>nn :NERDTree<CR>
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


nnoremap <leader>b :Buffers<CR>

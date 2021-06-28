call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

Plug 'neomake/neomake'

let g:neomake_python_enabled_makers = ['pylint']


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-jedi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
let g:callirline_theme='badwolf'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'sbdchd/neoformat'
let g:shfmt_opt="-ci"
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 1000

Plug 'mcchrish/nnn.vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-fugitive'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'altercation/vim-colors-solarized'

call plug#end()

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call neomake#configure#automake('nrwi', 500)
let g:vim_markdown_folding_disabled = 1

syntax enable
set background=dark
colorscheme solarized


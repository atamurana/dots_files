call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale' "Linting
Plug 'ntpeters/vim-better-whitespace' "Trailing whitespace

"Interface
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dyng/ctrlsf.vim' "Search as sublime
Plug 'Yggdroot/indentLine' "vim indent guides
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

"Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

"Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

call plug#end()

syntax on

set number
set expandtab
set shiftwidth=2
set tabstop=2
set hlsearch
set incsearch
set encoding=utf-8
set vb
set list
set listchars+=space:. "show spaces as dots
set hidden
set noswapfile " disabling swap files
let g:plug_window = 'enew'

" Key Mappings
let g:mapleader=','

" Indenting
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv


"" NORDTree keys
map <C-n> :NERDTreeToggle<CR>
inoremap df <ESC>

"" Multiply cursor keys
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"" Easymotion map
map <Leader> <Plug>(easymotion-prefix)


" Color Schemes

if (has("termguicolors"))
  set termguicolors
endif

 colorscheme onedark

" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Vertical cursor in Inseart mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Linting settings
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier', 'prettier-eslint'],
\   'ruby': [],
\}

let g:ale_linters = {
\   'ruby': [],
\}
""" Set this setting in vimrc if you want to fix files automatically on save.
let g:ale_fix_on_save = 1

" Better whitespaces settings
let g:strip_whitespace_on_save=1

" CtrlSF settings
nnoremap <Leader>a :CtrlSF<space>
let g:ctrlsf_ignore_dir = ['public']

"" Ack setting
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" indentLine settings
let g:indentLine_color_gui = '#4B5163'
let g:indentLine_char = '┆'

" fzf settings
let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_OPTS='--reverse'
map <C-f> :Files<CR>
map <C-p> :Buffers<CR>
map <C-h> :History<CR>
let g:fzf_colors =
\ { 'hl':      ['fg', 'Keyword'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'PreProc'],
  \ 'info':    ['fg', 'Function'],
  \ 'prompt':  ['fg', 'Keyword'],
  \ 'pointer': ['fg', 'Keyword'],
  \ 'marker':  ['fg', 'Label'],
  \ 'spinner': ['fg', 'Function'],
  \ 'header':  ['fg', 'String'] }




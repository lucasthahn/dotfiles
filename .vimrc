:set nocompatible
:filetype off

:set rtp+=~/.vim/bundle/Vundle.vim
:call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/sh.vim'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'

Plugin 'rking/ag.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'whatyouhide/vim-gotham'

:call vundle#end()

set directory=~/tmp//,.,/var/tmp//,/tmp//

:syntax enable
:syn sync fromstart
:set ls=2
:filetype plugin indent on
":set cindent
:set smartindent
:set number
:set bg=dark
:nmap <siletn> <C-N> :silent noh<CR>
:set ignorecase
:set smartcase
:set incsearch
:set showmode
:set showcmd
:set backspace=indent,start,eol

autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" Plugin 'nathanaelkane/vim-indent-guides'
" Indenting guide "
"let g:indent_guides_auto_colors=1
""hi IndentGuidesOdd ctermbg=black
""hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_auto_colors=1
let g:indent_guides_color_change_percent=10
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

"Bundle 'Valloric/YouCompleteMe'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

:set noexpandtab
:set tabstop=8
:set shiftwidth=2

" PYTHON SHIT
" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set tabstop=4
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab

au BufRead,BufNewFile Makefile* set noexpandtab

au BufRead,BufNewFile *.jl set tabstop=3
au BufRead,BufNewFile *.jl set shiftwidth=3

set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<,space:@

" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: 79
" C: 79
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.h,*.hpp set textwidth=79


" BUNDLE VIM-GO "
" disable annoying shift-K for :GoDoc<cr>
let g:go_doc_keywordprg_enabled = 0

"TAGS STUFF"
":set tags=./tags;/,*/tags,../tags,~/code/tags,/usr/src/tags,/usr/include/tags
:set tags=./tags;/

"Toggle at word boundary
:set lbr

" let g:xml_syntax_folding=1
" au FileType xml setlocal foldmethod=syntax
" :set foldmethod=syntax
":set foldmethod=indent
" :set foldenable

" highlights
:nnoremap <S-y> :set hls<CR>:exec "let @/='\\<".expand("<cword>")."\\>'"<CR>
:nnoremap <S-u> :nohls<CR>

" Zenburn color configurations
":set background=dark
try
   ":colorscheme badwolf
   :colorscheme seoul256
   ":colorscheme zenburn
   ":colorscheme radicalgoodspeed
   ":colorscheme solarized
   ":colorscheme ironman
   ":colorscheme gotham
catch
endtry

:set background=dark
:highlight Normal ctermbg=none
:highlight NonText ctermbg=none
:set t_Co=256

if (exists('+colorcolumn'))
   set colorcolumn=80
   highlight ColorColumn ctermbg=black
endif

" Setup auto-completing curly brackets
":inoremap {      {}<Left>
":inoremap {<CR>  {<CR>}<Esc>O
":inoremap {{     {
":inoremap {}     {}

" Setup auto-completing parentheses
":inoremap (      ()<Left>
":inoremap (<CR>  (<CR>)<Esc>O
":inoremap ((     (
":inoremap ()     ()

"" Setup auto-completing quotes
":inoremap "      ""<Left>
":inoremap "<CR>  "<CR>"<Esc>O
":inoremap ""     "

" persistent undo history
if has('persistent_undo')
    set undofile " Save undo's after file closes
    set undodir=~/.vim/undo " where to save undo histories
    set undolevels=100 " How many undos
    set undoreload=1000 " number of lines to save for undo
endif


:map <F6> :setlocal spell! spelllang=en_us<cr>

" SPLITS
:map <Tab> <C-w>w
:map - <C-W><
:map + <C-W>>

" TABS
":map <S-Right> :tabn<CR>
":map <S-Left> :tabp<CR>
:map <S-l> :tabn<CR>
:map <S-h> :tabp<CR>

" MOVEMENT
:map <C-l> $
:map <C-h> ^
:map <C-j> <C-e>
:map <C-k> <C-y>
:map <S-j> 10j
:map <S-k> 10k

:imap jj <Esc>
:map <Space> :wall<CR>

"filetype plugin indent on
set ofu=syntaxcomplete#Complete
let mapleader = ","
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Latex Suite plugin stuff
":filetype plugin on
":set grepprg=grep\ -nH\ $*
":let g:tex_flavor='latex'

" Setup auto-completing for C-style commen
":inoremap /*    /*  */<Left><Left><Left>
":inoremap /**   /**<CR><Left>*/<Esc>O<Left>* @brief

" Screen integration
"
"let &titlestring = "[" . expand("%:t") . "]"
"if &term == "screen" || &term == "screen-bce"
"  set t_ts=^[k
"  set t_fs=^[\
"  set title
"endif

"nmap <leader>l :set list!<CR>¬
"set list!¬
"" Use the same symbols as TextMate for tabstops and EOLs¬
"set listchars=tab:▸\ ,eol:¬¬
""Invisible character colors¬
"highlight NonText guifg=#4a4a59¬
"highlight SpecialKey guifg=#4a4a59¬


map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>


"  Instellingen {{{ 
set nocompatible
filetype plugin indent on
silent
syntax on

set number relativenumber
set path+=**
set wildmode=longest,list,full
set shell=bash
set encoding=UTF-8
set cursorline
set showmatch	" Lijn Brackets
set linebreak 
set ignorecase
set smartcase
set clipboard+=unnamedplus
set tabstop=4
set noruler
set shiftwidth=4
set foldenable
set noshowmode
set noshowcmd
set foldmethod=marker
set foldmarker={{{,}}}
set softtabstop=4
set spelllang=nl,en_us
set shortmess=a
set shortmess+=F
set splitright
set cmdheight=2
set laststatus=0
set fillchars+=eob:\

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
"}}}

" Kleuren {{{
highlight Normal ctermbg=NONE
highlight Comment cterm=italic
highlight Cursorline ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Grey
highlight LineNr ctermfg=White ctermbg=Black 
highlight SpellBad ctermbg=Red ctermfg=White
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE ctermbg=NONE
highlight SpellLocal cterm=Underline ctermbg=NONE
"}}}

" Automatisch Vim-Plug installeren {{{ 
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path
autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
"}}}


" Keybinds {{{
nmap q <Nop>
nmap Q <Nop>
let mapleader=";"
map <leader>x ddp
map <leader>s :setlocal spell!<CR>
map <leader>t :vnew term://bash<CR>
map <leader>tt :vnew term://powershell<CR>

nnoremap<leader><C-n> :set spelllang=nl<CR>
nnoremap<leader><C-e> :set spelllang=en_us<CR>

noremap <C-s> :source $MYVIMRC<CR>
noremap <C-e> :NERDTreeVCS<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <silent> <leader><C-l> :vertical resize +3<CR>
noremap <silent> <leader><C-h> :vertical resize -3<CR>

"}}}

" Bestandextensie Regels {{{

"	Markdown
"au BufNewFile,BufRead *.md set Goyo 120
au BufNewFile,BufRead *.md set spell
au BufNewFile,BufRead *.md set spelllang=nl
"}}}

" Plugins via Vim-Plug {{{
call plug#begin("$HOME/.config/nvim/plugged")
	" General
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/vim-emoji'
	Plug 'preservim/nerdtree'


	"" Dev 
	
	" WWW
	Plug 'ap/vim-css-color'
	Plug 'mattn/emmet-vim'

	" PYTHON
	Plug 'vim-python/python-syntax'

	" BASH
	Plug 'kovetskiy/sxhkd-vim'

	"" TXT

	" Markdown
	Plug 'junegunn/goyo.vim'
	Plug 'vimwiki/vimwiki'

	" UI & UX
	Plug 'arcticicestudio/nord-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()
colorscheme nord
"}}}

" AirLine for Vim {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
"}}}

" VimWiki Configuratie {{{
let g:vimwiki_list = [{'path': '~/Documenten/Notities',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" }}}

" NERDTree {{{
function! StartUp()
    if 0 == argc()
        NERDTree ~/
    endif
endfunction

autocmd VimEnter * call StartUp()
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
" }}}

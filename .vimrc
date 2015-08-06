"
"   Use VIM
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"
"   Vundle Settings
"
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""
""   Plugins
""
"" Display 
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine' 
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline' 
"" Git
Plugin 'airblade/vim-gitgutter'
"" Syntax
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
"" System
Plugin 'scrooloose/nerdtree'
Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'
"" Coding
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'adragomir/javacomplete'
Plugin 'kchmck/vim-coffee-script'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" airblade/vim-gitgutter
let g:gitgutter_sign_column_always = 1 

" kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ar'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" pangloss/vim-javascript
let javascript_enable_domhtmlcss=1
let b:javascript_fold=1
let g:javascript_conceal_function   = "ƒ"

" edkolev/tmuxline.vim

" bling/vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Yggdroot/indentLine | Vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" scrooloose/nerdtree
nmap <leader>d :NERDTreeToggle<CR>

" adragomir/javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java map <leader>b :call javacomplete#GoToDefinition()<CR>

"
"   My settings
"

""
""  Display
""
colorscheme mustang

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50 	" keep 50 lines of command line history
set ruler 		" show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch 	" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
" set mouse=a

syntax enable

set nu              " ln
set tabstop=4       " tbs
set shiftwidth=4    " npi
set expandtab       " npi2

" Auto hightlight word under cursor
au FileType bash,sh,zsh,python,javascript,html autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
hi Incsearch ctermfg=166
hi Incsearch ctermbg=15

" Powerline
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_dividers_override = [[0xe0b0], [0xe0b1], [0xe0b2], [0xe0b3]]
" let g:Powerline_symbols_override = {
"   \ 'BRANCH': [0xe238],
"   \ 'RO'    : [0xe0a2],
"   \ 'FT'    : [0xe1f6],
"   \ 'LINE'  : [0xe0a1],
"   \ }


""
""  Mappings
""
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

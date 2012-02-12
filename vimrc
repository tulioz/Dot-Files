set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'Command-T'
Bundle 'Headlights'
Bundle 'delimitMate.vim'
Bundle 'closetag.vim'
Bundle 'pyflakes.vim'
Bundle 'The-NERD-Commenter'
Bundle 'SuperTab-continued.'
let g:SuperTabDefaultCompletionType = "context"

Bundle 'fugitive.vim'
Bundle 'Tagbar'
Bundle 'surround.vim'
Bundle 'Mustang2'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.

" change mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
" ev to edit, sv to source
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set modelines=0     "prevent security exploits
set hidden          "open a new file with :e and just hide the old buffer
set nowrap          "don't wrap lines
set tabstop=4       "a tab is four spaces
set shiftwidth=4    "number of spaces to use for autoindenting
set softtabstop=4
set expandtab       "expand tabs to spaces
set backspace=indent,eol,start "allow backspacking over everything in insert mode
set autoindent      "always set autoindent
set copyindent      "copy the previos indentation on autoindenting
set number          "always show line numbers
set shiftround      "multiple of shiftwidth when indenting with '<' and '>'
set showmatch       "show matching parenthesis
set ignorecase      "ignore case when searching
set smartcase       "ignore case if search pattern is all lowercase,
                    "case sensitive otherwise
set smarttab        "insert tabs on the start of a line according to
                    "shiftwidth not tabstop
set hlsearch        "highlight search terms
set incsearch       "show search matches as you type
set guioptions-=T   " No toolbar
set encoding=utf-8
set scrolloff=3     " start scrolling before cursor hits end
set showmode
set showcmd
set cursorline
set ttyfast
set ruler
set laststatus=2
set undofile

set history=1000    "remember more commands and search history
set undolevels=1000 "use many levels of undo
set title           " change terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep

set completeopt=menuone,longest,preview

set wildmenu                                    " Better file name completion
set wildmode=list:longest,full
set wildignore=*.bak,*.class
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

syntax on " switch syntax highlight on

if &t_Co >= 256 || has("gui_running")
  "colorscheme mustang
  colorscheme Mustang
  "colorscheme lucius
endif

set list
set listchars=tab:>·,trail:·,extends:#,nbsp:·

" autocmd filetype python set expandtab

" autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

" set mouse=a

nnoremap ; :

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader><space> :noh<cr>

" change current file to be opened as 'sudo' and write the file
cmap w!! %!sudo tee > /dev/null %

" Use sane regex
nnoremap / /\v
vnoremap / /\v
set gdefault

nnoremap <tab> %
vnoremap <tab> %

set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

inoremap <up> <nop>
inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" move a line of text using ALT+[jk], indent with ALT+[hl]
nnoremap <A-k> :m-2<CR>==
nnoremap <A-j> :m+<CR>==
nnoremap <A-h> <<
nnoremap <A-l> >>
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
inoremap <A-h> <Esc><<`]a
inoremap <A-l> <Esc>>>`]a
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-h> <gv
vnoremap <A-l> >gv

au FocusLost * :wa " save when vim loses focus

au VimResized * :wincmd = "resize splits when window resized

inoremap jj <ESC>

noremap <leader>w <C-w>v<C-w>l

if has('gui_running')
    set guifont=Inconsolata:h13
endif

" Specific settings for file types
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set softtabstop=2
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim


"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ line:%l\/%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
" Smart status line code from: http://www.reddit.com/r/vim/comments/gexi6/a_smarter_statusline_code_in_comments/
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
" End smart status line code

function! MakeExecutable()
  silent !chmod a+x %
endfunction

" on save, make file executable if has shebang line with '/bin/'
au BufWritePost * if getline(1) =~ "^#!/bin/" | :call MakeExecutable() | endif

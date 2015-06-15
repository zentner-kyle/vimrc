"" Behaviors
  set nocompatible
  set hidden
  set autowrite
  set number
  set title
  syntax on
"" Plugins
  call plug#begin('~/.vim/plugged')
    " Causes problems with reloads.
    "Plug 'ardagnir/vimbed'
    Plug 'chrisbra/recover.vim'
    Plug 'ervandew/supertab'
    Plug 'godlygeek/csapprox'
    Plug 'godlygeek/tabular'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    Plug 'kien/ctrlp.vim'
    Plug 'ludovicchabant/vim-lawrencium'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'rking/ag.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/a.vim'
    Plug 'wincent/command-t'
  call plug#end()

"" Program/Plugin Configuration
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:agprg="ag --vimgrep"

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
  let g:SuperTabLongestEnhanced = 1
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  let g:CommandTMaxHeight = 10

"" Indentation
  filetype plugin indent on
  set expandtab
  set backspace=indent,eol,start
  set tabstop=8
  set softtabstop=2
  set shiftwidth=2

"" Searching
  set ignorecase
  set smartcase
  set hlsearch

"" Completion
  set completeopt=menuone,longest
  set omnifunc=syntaxcomplete#Complete

"" Folding
  set foldmethod=indent
  set foldnestmax=1

"" Remaps
  map ; <plug>NERDCommenterToggle
  nmap , .`[<down>
  nmap m .`[n
  nmap . .`[
  nmap H <C-o>
  nmap L <C-i>
  nmap M @m`[n
  nmap <Space> za

  " Use CTRL-S for saving, also in Insert mode
    noremap <C-S> :update<CR>
    vnoremap <C-S> <C-C>:update<CR>
    inoremap <C-S> <C-O>:update<CR>
  " Fix escape in visual mode.
    vnoremap  

"" Commands
  nnoremap <Leader><Leader> :<up><CR>
  nnoremap <silent> <Leader>V :exec 'tabdo windo source $MYVIMRC' <bar> exec 'tabdo windo filetype detect' <bar> echo 'vimrc reloaded'<CR>
  map <C-n> :NERDTreeToggle<CR>

"" Gui Configuration
  set guioptions-=Tl
  set guifont=Inconsolata\ Medium\ 10

"" Colorscheme
  " Since most terms 256 colors
  set t_Co=256

  " Force background transparency
  let g:CSApprox_hook_post = 
        \ ['hi Normal ctermbg=NONE',
        \ 'hi NonText ctermbg=NONE',
        \ 'hi LineNr ctermbg=NONE',        
        \ 'hi LineNr ctermbg=NONE',        
        \ ]


  colorscheme blakely

"" Clipboard remaps
  "set clipboard=unnamed,unnamedplus
  "noremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  "noremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
  nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
  nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
  xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
  vnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  vnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'

  nnoremap <expr> d (v:register ==# '"' ? '"+' : '') . 'd'
  nnoremap <expr> dd (v:register ==# '"' ? '"+' : '') . 'dd'
  nnoremap <expr> D (v:register ==# '"' ? '"+' : '') . 'D'
  xnoremap <expr> d (v:register ==# '"' ? '"+' : '') . 'd'
  xnoremap <expr> D (v:register ==# '"' ? '"+' : '') . 'D'
  vnoremap <expr> d (v:register ==# '"' ? '"+' : '') . 'd'
  vnoremap <expr> D (v:register ==# '"' ? '"+' : '') . 'D'

  nnoremap <expr> x (v:register ==# '"' ? '"+' : '') . 'x'
  xnoremap <expr> x (v:register ==# '"' ? '"+' : '') . 'x'
  vnoremap <expr> x (v:register ==# '"' ? '"+' : '') . 'x'

  noremap <expr> p (v:register ==# '"' ? '"+' : '') . 'p'
  noremap <expr> P (v:register ==# '"' ? '"+' : '') . 'P'

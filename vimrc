"" Behaviors
  set nocompatible
  set hidden
  set autowrite
  set number
  set title
  syntax on

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

"" Leader Commands
  nnoremap <Leader><Leader> :<up><CR>
  nnoremap <silent> <Leader>V :exec 'tabdo windo source $MYVIMRC' <bar> exec 'tabdo windo filetype detect' <bar> echo 'vimrc reloaded'<CR>

"" Gui Configuration
  set guioptions-=Tl
  set guifont=Inconsolata\ Medium\ 10

"" Colorscheme
  " Since most terms 256 colors
  set t_Co=256

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

"" Behaviors
  set nocompatible
  set hidden
  set autowrite
  set number
  set title
  syntax on
  set history=1000
  set undolevels=1000
  set noerrorbells
  set nobackup
  set noswapfile
  set nowrap
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

"" Plugins
  call plug#begin('~/.vim/plugged')
    " Causes problems with reloads.
    "Plug 'ardagnir/vimbed'
    Plug 'airblade/vim-gitgutter'
    Plug 'chrisbra/recover.vim'
    Plug 'ervandew/supertab'
    Plug 'godlygeek/csapprox'
    Plug 'godlygeek/tabular'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    Plug 'kien/ctrlp.vim'
    Plug 'ludovicchabant/vim-lawrencium'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'phildawes/racer'
    Plug 'rking/ag.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'sgeb/vim-diff-fold'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/unite.vim'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/a.vim'
    Plug 'wincent/command-t'
    " Colorschemes:
    Plug 'vim-scripts/pyte'
    Plug 'vim-scripts/summerfruit.vim'
    Plug 'vim-scripts/oceanlight'
    Plug 'vim-scripts/oceandeep'
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
  let g:bookmark_save_per_working_dir = 0
  let g:bookmark_auto_save = 1
  let g:syntastic_cpp_checkers = ['cpplint', 'clang_check']

"" Indentation
  filetype plugin indent on
  set expandtab
  set backspace=indent,eol,start
  set autoindent
  set copyindent
  set tabstop=8
  set softtabstop=2
  set shiftwidth=2
  set shiftround

"" Searching
  set ignorecase
  set smartcase
  set hlsearch
  set incsearch

"" Completion
  set completeopt=menuone,longest
  set complete-=i
  set omnifunc=syntaxcomplete#Complete

"" Folding
  "set foldmethod=indent
  "set foldnestmax=1

"" Remaps
  map ; <plug>NERDCommenterToggle
  nmap , .`[<down>
  nmap m .`[n
  nmap . .`[
  nmap H <C-o>
  nmap L <C-i>
  nmap M @m`[n

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
  cmap w!! w !sudo tee % >/dev/null
  nmap <Leader>u :Unite buffer vim_bookmarks file<CR>
  nmap <Leader>o :FZF<CR>

"" Unite
  let g:unite_source_history_yank_enable = 1
  "call unite#filters#matcher_default#use(['matcher_fuzzy'])
  "nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
  "nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
  "nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
  "nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
  "nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
  "nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    nmap <buffer> <ESC>   <Plug>(unite_exit)
  endfunction

"" Gui Configuration
  set guioptions-=Tl
  "set guifont=Inconsolata\ Medium\ 10

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
  "let &colorcolumn="80,".join(range(120,999),",")
  let &colorcolumn="80,100,120"

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

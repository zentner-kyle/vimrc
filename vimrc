"" Behaviors
  set nocompatible
  set hidden
  set autowrite
  set number
  set title
  set wrap
  syntax on
  set history=1000
  set undolevels=1000
  set noerrorbells
  set nobackup
  set noswapfile
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

"" Plugins
  call plug#begin('~/.vim/plugged')
    " Status:
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'neomake/neomake'
    Plug 'scrooloose/syntastic'
    " Versioning:
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'ludovicchabant/vim-lawrencium'
    Plug 'sgeb/vim-diff-fold'
    " Navigation:
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    Plug 'junegunn/fzf.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'scrooloose/nerdtree'
    Plug 'mhinz/vim-grepper'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/denite.nvim'
    " Tools:
    Plug 'godlygeek/tabular'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'scrooloose/nerdcommenter'
    Plug 'chrisbra/recover.vim'
    Plug 'tmhedberg/matchit'
    Plug 'vim-scripts/a.vim'
    " Completion:
    "Plug 'Valloric/YouCompleteMe'
    Plug 'ajh17/VimCompletesMe'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Elixir:
    Plug 'slashmili/alchemist.vim'
    Plug 'elixir-lang/vim-elixir'
    Plug 'mattreduce/vim-mix'
    Plug 'avdgaag/vim-phoenix'
    " Reason:
    Plug 'reasonml/vim-reason-loader'
    " Rust:
    Plug 'racer-rust/vim-racer'
    Plug 'rust-lang/rust.vim'
    " Colorschemes:
    Plug 'vim-scripts/pyte'
    Plug 'vim-scripts/mayansmoke'
    Plug 'vim-scripts/summerfruit.vim'
    Plug 'vim-scripts/oceanlight'
    Plug 'vim-scripts/oceandeep'
    Plug 'mhartington/oceanic-next'
    Plug 'rakr/vim-one'
    Plug 'morhetz/gruvbox'
  call plug#end()
"" Program/Plugin Configuration
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ag_prg="ag --vimgrep"

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

  if executable("rg")
      " Use ripgrep over Grep
      set grepprg=rg\ --vimgrep\ --no-heading
      set grepformat=%f:%l:%c:%m,%f:%l:%m
      let g:ag_prg = 'rg --vimgrep --no-heading'

      " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'rg --color never %s -l -g ""'
  endif

  let g:grepper               = {}
  let g:grepper.tools         = ['rg', 'git', 'ag', 'grep']

  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  let g:CommandTMaxHeight = 10
  let g:bookmark_save_per_working_dir = 0
  let g:bookmark_auto_save = 1
  let g:syntastic_cpp_checkers = ['cpplint', 'clang_check']
  "let g:syntastic_rust_checkers = ['rustc']
  "let g:neocomplete#enable_at_startup = 1
  let g:deoplete#enable_at_startup = 1
  let g:rustfmt_autosave = 1
  let g:racer_cmd = "~/.cargo/bin/racer"
  let g:racer_experimental_completer = 1
  call neomake#configure#automake('nw', 750)
  let g:neomake_tex_enabled_makers = ['pdflatex']

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
  nnoremap <leader>g :Grepper -cword -noprompt<cr>
  nnoremap <leader>G :Grepper<cr>
  cmap w!! w !sudo tee % >/dev/null
  nmap <Leader>o :Files<CR>
  nmap <Leader>p :Buffers<CR>

"" Denite
  nnoremap <leader>t :<C-u>Denite file_rec<cr>
  nnoremap <leader>f :<C-u>Denite file<cr>
  nnoremap <leader>r :<C-u>Denite file_mru<cr>
  nnoremap <leader>e :<C-u>Denite buffer<cr>
  " Custom mappings for the denite buffer
  call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
  call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
  call denite#custom#map(
            \ 'insert',
            \ '<C-n>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
  call denite#custom#map(
            \ 'insert',
            \ '<C-p>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
                  \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

"" Gui Configuration
  set guioptions-=Tl
  "set guifont=Inconsolata\ Medium\ 10

"" Colorscheme
  set termguicolors

  " Force background transparency
  "let g:CSApprox_hook_post =
        "\ ['hi Normal ctermbg=NONE',
        "\ 'hi NonText ctermbg=NONE',
        "\ 'hi LineNr ctermbg=NONE',
        "\ 'hi LineNr ctermbg=NONE',
        "\ ]
  let g:CSApprox_hook_post = []
  let &colorcolumn="100,120"

  set background=dark

  colorscheme OceanicNext
  let g:airline_theme='oceanicnext'

"" Airline
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.whitespace = 'Ξ'

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

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

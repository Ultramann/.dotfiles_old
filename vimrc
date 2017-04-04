call pathogen#infect()
call pathogen#helptags()
"Since pathogen is installed - see installation part of:
    "http://mirnazim.org/writings/vim-plugins-i-use/
"All I need to do to install a vim plugin is use the command (while in .dotfiles/vim)
    "git submodule add (the github url of the vim plugin) bundle/[repo_name]
        "ex: git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive
    "git submodule init && git submodule update
"BOOM! Installed.

let mapleader="\<Space>"

"General settings
    "Stop writing stuff 
    set nobackup
    set nowritebackup
    set noswapfile
    "Line numbers
    set number
    set numberwidth=6
    set relativenumber
    "Searching
    set smartcase
    set ignorecase
    set hlsearch
    set incsearch
    "Indenting
    set autoindent
    set smarttab
    set expandtab
    "Bottom
    set wildmenu
    set scrolloff=5
    set noruler
    set laststatus=2
    set statusline=%<\ %f\ %m%y%=%-35.(Line:\ %l\ of\ %L,\ Col:\ %c%V\ (%P)%)
    "Misc
    set linebreak
    set splitbelow
    set cursorline
    set hidden
    set spelllang=en_us
    set backspace=indent,eol,start

"Colors
syntax on
colorscheme caryColors

"Filetype settings
filetype on
filetype plugin indent on
autocmd FileType python,text,html,vim
    \ setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType haskell,cabal,yaml,sh,sql,tex,markdown
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Plugin settings
    "Buftabline 
    let g:buftabline_indicators=1

    "Syntatic
    let g:syntastic_enable_signs=0
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
    let g:syntastic_python_checkers=['pyflakes']
    let g:syntastic_haskell_checkers=['hlint']

"Mappings
    "No arrow keys
    nnoremap   <up>   <nop>
    nnoremap  <down>  <nop>
    nnoremap  <left>  <nop>
    nnoremap  <right> <nop>
    inoremap   <up>   <nop>
    inoremap  <down>  <nop>
    inoremap  <left>  <nop>
    inoremap  <right> <nop>
    nnoremap     j     gj
    nnoremap     k     gk

    "Line number style swapping
    nnoremap <silent> <leader>ns :set relativenumber!<CR>

    "Spell checking
    nnoremap <silent> <leader>sc :set spell!<CR>
    nnoremap <silent> <leader>ss z=
    nnoremap <silent> <leader>sa 1z=

    "Buffers
    nnoremap <silent> <leader>k :bnext<CR>
    nnoremap <silent> <leader>l :blast<CR>
    nnoremap <silent> <leader>j :bprevious<CR>
    nnoremap <silent> <leader>h :bfirst<CR>
    nnoremap <silent> <leader>x :bdelete<CR>

    "Swaps
    nnoremap    v    <C-V>
    nnoremap  <C-V>    v
    nnoremap    '      `
    nnoremap    `      '

    "Splits
    nnoremap <leader>s= :resize +5<CR>
    nnoremap <leader>s- :resize -5<CR>

    "Productivity
    inoremap    jj    <ESC>
    vnoremap    vj    <ESC>
    nnoremap    ga    ggVG
    vnoremap <leader>s :sort<CR>
    nnoremap <leader>Q :wqa<CR>
    nnoremap <leader>fq :q!<CR>
    nnoremap <leader>Fq :qa!<CR>
    nnoremap <leader>rp :! python %<CR>
    nnoremap <leader>rh :! stack runghc %<CR>
    nnoremap <leader>rt :! pdflatex -shell-escape %<CR>
    nnoremap <leader>u <C-r>
    nnoremap <leader>o :noh<CR>
    nnoremap <leader>tw :call TrimWhitespace()<CR>
    nnoremap <leader>c :call ToggleCursorLines()<CR>

    "Clipboard
    nnoremap <leader>y :<C-u>exec 'normal ' . v:count1 . '"+yy'<CR>
    vnoremap <leader>y "+y
    nnoremap <leader>p :<C-u>exec 'normal ' . v:count1 . '"+p'<CR>
    nnoremap <leader>P :<C-u>exec 'normal ' . v:count1 . '"+P'<CR>
    vnoremap <leader>p "+p
    nnoremap <leader>d :<C-u>exec 'normal ' . v:count1 . '"+dd'<CR>
    vnoremap <leader>d "+d

    "Fugitive
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>ga :Gwrite<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gp :Git push<CR>

    "NERDTree
    nnoremap <leader>nt :NERDTreeToggle<CR>

    "Functions
    fun! TrimWhitespace()
        let l:save_cursor = getpos('.')
        %s/\s\+$//e
        call setpos('.', l:save_cursor)
    endfun

    fun! ToggleCursorLines()
        if &cursorline && &cursorcolumn
            hi  clear CursorLine
            set nocursorcolumn
        else
            hi  CursorLine   ctermbg=236
            set cursorline
            set cursorcolumn
        endif
    endfun

    "Abbreviations
    ab ra ->
    ab la <-

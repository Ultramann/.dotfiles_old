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
    set gdefault
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
    "Finding
    set path=**
    set wildignore+=.git
    "Misc
    set linebreak
    set splitbelow
    set cursorline
    set hidden
    set visualbell
    set nocompatible
    set spelllang=en_us
    set backspace=indent,eol,start

"Colors
syntax enable
colorscheme bossColors

"Filetype settings
filetype on
filetype plugin indent on
autocmd FileType python,text,html,vim
    \ setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType haskell,cabal,yaml,sh,sql,tex,markdown
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Plugin settings
    "Syntatic
    let g:syntastic_enable_signs=0
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
    let g:syntastic_python_checkers=['pyflakes']
    let g:syntastic_haskell_checkers=['hlint']

    "Netrw
    let g:netrw_banner=0
    let g:netrw_liststyle=3

"Mappings
    "Productivity
    inoremap    jj    <ESC>
    vnoremap    vj    <ESC>
    nnoremap    ga    ggVG
    vnoremap    //    y/<C-R>"<CR>
    nnoremap <leader>Q :q!<CR>
    nnoremap <leader>f :find 
    nnoremap <leader>e :edit 
    nnoremap <leader>u <C-r>
    nnoremap <leader>v V`]
    nnoremap <leader>b :ls<CR>:b<Space>
    nnoremap <silent> <leader>t :Explore<CR>
    nnoremap <silent> <leader>o :noh<CR>
    nnoremap <silent> <leader>w :call TrimWhitespace()<CR>
    nnoremap <silent> <leader>c :call ToggleCursorLines()<CR>
    nnoremap <silent> <leader>n :set relativenumber!<CR>

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
    nnoremap <silent> <leader>s= :resize +5<CR>
    nnoremap <silent> <leader>s- :resize -5<CR>

    "Runners
    nnoremap <silent> <leader>rp :! python %<CR>
    nnoremap <silent> <leader>rh :! stack runghc %<CR>
    nnoremap <silent> <leader>rt :! pdflatex -shell-escape %<CR>

    "Clipboard
    nnoremap <silent> <leader>y :<C-u>exec 'normal ' . v:count1 . '"+yy'<CR>
    vnoremap <silent> <leader>y "+y
    nnoremap <silent> <leader>p :<C-u>exec 'normal ' . v:count1 . '"+p'<CR>
    nnoremap <silent> <leader>P :<C-u>exec 'normal ' . v:count1 . '"+P'<CR>
    vnoremap <silent> <leader>p "+p
    nnoremap <silent> <leader>d :<C-u>exec 'normal ' . v:count1 . '"+dd'<CR>
    vnoremap <silent> <leader>d "+d

    "Fugitive
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>ga :Gwrite<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gp :Git push<CR>

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

"Other
    "Commands
    command -nargs=1 Vsb call VerticalSplitBuffer(<f-args>)

    "Abbreviations
    iabbrev ra ->
    iabbrev la <-

    "Functions
    function! VerticalSplitBuffer(buffer)
        execute 'vert sb' a:buffer 
    endfunction

    function! TrimWhitespace()
        let l:save_cursor = getpos('.')
        %s/\s\+$//e
        call setpos('.', l:save_cursor)
    endfunction

    function! ToggleCursorLines()
        if &cursorline && &cursorcolumn
            hi  clear CursorLine
            set nocursorcolumn
        else
            hi  CursorLine   ctermbg=236
            set cursorline
            set cursorcolumn
        endif
    endfunction

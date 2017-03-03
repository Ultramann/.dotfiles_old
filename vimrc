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

"General Settings
set nobackup
set nowritebackup
set noswapfile
set scrolloff=4
set autoindent
set smarttab
set expandtab
set number
set numberwidth=5
set lbr
set ignorecase
set splitbelow
set cursorline
set smartcase
set hlsearch
set incsearch
set hidden
set wildmenu
set showcmd
set backspace=indent,eol,start
filetype plugin indent on
filetype on
syntax on
colorscheme caryColors

"Filetype Specific Settings
autocmd FileType python,text,markdown,html setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType haskell,cabal,yaml,sh,sql,tex setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Plugin settings
    "Buftabline 
    let g:buftabline_indicators=1

    "Syntatic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

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
    nnoremap <leader>ns :set relativenumber!<CR>

    "Spell check
    nnoremap <leader>sc :set spell spelllang=en_us<CR>
    nnoremap <leader>so :set nospell<CR>

    "Buffers
    nnoremap <leader>k :bnext<CR>
    nnoremap <leader>l :blast<CR>
    nnoremap <leader>j :bprevious<CR>
    nnoremap <leader>h :bfirst<CR>
    nnoremap <leader>x :bdelete<CR>
    nnoremap <leader>e :edit<Space>

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
    vnoremap <leader>s :sort<CR>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>W :wa<CR>
    nnoremap <leader>q :wq<CR>
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

    "Fugitive
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>ga :Gwrite<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gp :Git push<CR>

    "NERDTree
    nnoremap <leader>nt :NERDTreeToggle<CR>
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    "Clipboard
    nnoremap <leader>y :<C-u>exec 'normal ' . v:count1 . '"+yy'<CR>
    vnoremap <leader>y "+y
    nnoremap <leader>p :<C-u>exec 'normal ' . v:count1 . '"+p'<CR>
    nnoremap <leader>P :<C-u>exec 'normal ' . v:count1 . '"+P'<CR>
    vnoremap <leader>p "+p
    nnoremap <leader>d :<C-u>exec 'normal ' . v:count1 . '"+dd'<CR>
    vnoremap <leader>d "+d

"Bottom bar settings
set noruler
set laststatus=2
set statusline=%<\ %f\ %m%y%=%-35.(Line:\ %l\ of\ %L,\ Col:\ %c%V\ (%P)%)

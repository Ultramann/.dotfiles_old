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
set nu
set lbr
set ignorecase
set splitbelow
set cursorline
set smartcase
set hlsearch
set incsearch
set hidden
set wildmenu
set backspace=indent,eol,start
filetype plugin indent on
filetype on
syntax on

"Filetype Specific Settings
autocmd FileType python,text,markdown,html setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType haskell,cabal,yaml,sh,sql,tex setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Color settings
hi NonText      ctermfg=31
hi Statement    ctermfg=160
hi Special      ctermfg=35
hi PreProc      ctermfg=125
hi Identifier   ctermfg=6
hi Constant     ctermfg=127
hi Comment      ctermfg=27
hi ErrorMsg     ctermfg=161 ctermbg=none
hi Error        term=reverse cterm=underline ctermfg=15 ctermbg=9
hi Type         ctermfg=6
hi MatchParen   term=reverse cterm=bold ctermfg=160 ctermbg=81
hi Menu         ctermbg=none
hi SignColumn   cterm=none ctermfg=31 ctermbg=195
hi Visual       term=reverse ctermfg=7 ctermbg=8
hi VertSplit    term=reverse ctermfg=75
hi Folded       cterm=bold,underline ctermfg=31 ctermbg=none
hi FoldColumn   ctermfg=31 ctermbg=none
hi DiffChange   ctermbg=none

hi clear WildMenu
hi WildMenu     term=reverse ctermfg=31
hi StatusLine   cterm=reverse ctermfg=31

hi clear CursorLineNr
hi LineNr       ctermfg=31
hi CursorLine   cterm=none
hi CursorLineNr cterm=reverse ctermfg=31

hi clear Search
hi clear IncSearch
hi Search       term=reverse cterm=bold,underline ctermfg=190
hi IncSearch    term=reverse cterm=bold ctermfg=190

hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad     cterm=underline ctermfg=166
hi SpellCap     cterm=underline ctermfg=81
hi SpellRare    cterm=underline ctermfg=225
hi SpellLocal   cterm=underline ctermfg=14

hi clear TabLine
hi clear TabLineFill
hi TabLine      cterm=reverse ctermfg=31
hi TabLineSel   cterm=bold ctermfg=31
hi TabLineFill  term=reverse cterm=reverse ctermfg=31

hi clear Pmenu
hi clear PmenuSel
hi Pmenu        cterm=reverse ctermfg=8
hi PmenuSel     cterm=bold,reverse ctermfg=31

"plugin settings
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
    nnoremap <leader>sr= :resize +5<CR>
    nnoremap <leader>sr- :resize -5<CR>
    nnoremap <leader>sj <C-w>j
    nnoremap <leader>sk <C-w>k

    "Productivity
    inoremap    jj    <ESC>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>W :wa<CR>
    nnoremap <leader>q :wq<CR>
    nnoremap <leader>Q :wqa<CR>
    nnoremap <leader>fq :q!<CR>
    nnoremap <leader>Fq :qa!<CR>
    nnoremap <leader>rp :! ipython %<CR>
    nnoremap <leader>ct :! pdflatex -shell-escape %<CR>
    nnoremap <leader>u <C-r>
    nnoremap <leader>o :noh<CR>

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
    nnoremap <leader>n :NERDTreeToggle<CR>
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    "Clipboard
    nnoremap <leader>y :<C-u>exec 'normal ' . v:count1 . '"+yy'<CR>
    vnoremap <leader>y "+y
    nnoremap <leader>p :<C-u>exec 'normal ' . v:count1 . '"+p'<CR>
    vnoremap <leader>p "+p
    nnoremap <leader>d :<C-u>exec 'normal ' . v:count1 . '"+dd'<CR>
    vnoremap <leader>d "+d

"Bottom bar settings
set noruler
set laststatus=2
set statusline=%<\ %f\ %m%y%=%-35.(Line:\ %l\ of\ %L,\ Col:\ %c%V\ (%P)%)

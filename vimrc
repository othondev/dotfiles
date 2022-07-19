""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                     General
"                                                               Configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType * syntax sync fromstart
set autoread
set backupdir=/tmp//
set cursorline
set directory=/tmp//
set expandtab
set hidden
set ignorecase
set incsearch
set nohlsearch
set nobackup
set noerrorbells
set noswapfile nowrap
set number relativenumber
set redrawtime=10000
set shortmess+=c
set smartindent smartcase
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set undodir=/tmp//
set undofile
set updatetime=300
set scrolloff=8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                     General
"                                                                     Mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-c> <ESC>
let mapleader = " "
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <leader>Y "+Y
nnoremap <leader>P "+P
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>x :bd <CR>
nnoremap <silent> <leader>X :w <bar> %bd <bar> e# <bar> bd# <CR>
noremap <leader>y "+y
nnoremap <silent> <Leader>+ :vertical resize +30<CR>
nnoremap <silent> <Leader>- :vertical resize -30<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                     Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'github/copilot.vim'
Plug 'jparise/vim-graphql'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdtree'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                     Plugins
"                                                               Configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function LoadCustomConfig(pluginName)

  if a:pluginName == 'undotree'
    nnoremap <leader>u :UndotreeShow <CR>
  endif

  if a:pluginName == 'vim-airline'
    let g:airline#extensions#tabline#buffers_label = 'B'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#show_splits = 0
    let g:airline#extensions#tabline#show_tab_nr = 0
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#show_tab_count = 0
    let g:airline#extensions#tabline#tabs_label = 'T'
    let g:airline#extensions#branch#format = 2
    let g:airline_section_z = airline#section#create(['windowswap'])
    let g:airline_theme = 'onedark'
  endif

  if a:pluginName == 'nerdtree'
    let NERDTreeQuitOnOpen=1
    let g:netrw_banner = 0
    let g:netrw_browse_split = 2
    let g:netrw_winsize = 25

    nnoremap <leader>pv :NERDTreeToggle <CR>
  endif

  if a:pluginName == 'blamer'
    let g:blamer_enabled = 1
    let g:blamer_delay = 500
  endif

  if a:pluginName == 'coc'
    autocmd CursorHold * silent call CocActionAsync('highlight')
    command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gy <Plug>(coc-type-definition)
    vnoremap <leader>aa :CocAction <CR>
    nmap <leader>aa :CocAction <CR>
    nnoremap <leader>af :CocFix <CR>
    nmap <leader>rn <Plug>(coc-rename)
    nmap <leader>qf  <Plug>(coc-fix-current)
    nnoremap <silent> K :call ShowDocumentation()<CR>
    nnoremap <leader>ap :Prettier <CR> :wa<CR>
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
  endif

  if a:pluginName == 'telescope'
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>? <cmd>Telescope help_tags<cr>
    nmap <silent> <C-P> <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>
  endif

  if a:pluginName == 'vim-fugitive'
    nnoremap <leader>gl :GcLog <CR>
    nnoremap <leader>gs :G <CR>
  endif

  if a:pluginName == 'fzf'
    nnoremap <Leader>pf :Files<CR>
  endif

  if a:pluginName == 'vim-startify'
    let g:startify_custom_header = systemlist('gh issue list')
  endif

endfunction

for [name, spec] in items(g:plugs)
  let pluginName = split(name, '\.')[0]
  call LoadCustomConfig(pluginName)
endfor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                     Custom
"                                                                     Commands
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Wa :wa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                     Snippet
"                                                                       Codes
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>2 oconsole.log()<ESC>F(a
nnoremap <leader>3 :e $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   Appearance
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
colorscheme gruvbox

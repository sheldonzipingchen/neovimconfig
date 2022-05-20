set nocompatible
set showmatch
set ignorecase
set mouse=v
set mouse=a
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
filetype plugin indent on
filetype plugin on
syntax on
set clipboard=unnamedplus
set cursorline
set ttyfast
set noswapfile
set backupdir=~/.cache/vim

call plug#begin()
    " Apperance
    " Plug 'dracula/vim'
    Plug 'sainnhe/sonokai'
    " Plug 'vim-airline/vim-airline'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'elvessousa/sobrio'

    " Utilities
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'preservim/tagbar'
    
    " Completion / linters / formatters
    Plug 'plasticboy/vim-markdown'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    
    " Git
    Plug 'airblade/vim-gitgutter'

call plug#end()

au BufRead,BufNewFile *.go set expandtab
au BufNewFile,BufRead *.py set expandtab
au BufRead,BufNewFile *.js, *.html, *.css
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2

" ========================================================
" 键盘映射设置
" ========================================================
let mapleader=";"

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" 修改光标上下键一次移动一个屏幕行
nnoremap <Up>       gk
inoremap <Up>       <C-O>gk
nnoremap <Down>     gj
inoremap <Down>     <C-O>gj

" 切换窗口的键映射
nnoremap <C-Tab>    <C-W>w
inoremap <C-Tab>    <C-O><C-W>w
nnoremap <C-S-Tab>  <C-W>W
inoremap <C-S-Tab>  <C-O><C-W>W


" color schemes
if (has("termguicolors"))
    set termguicolors
endif
syntax enable

let g:sonokai_style='andromeda'
let g:sonokai_enable_italic=1

" colorscheme dracula
colorscheme sonokai

let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'

" airline
" let g:airline_theme='sobrio'
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1

" File browser
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.git', '\~$']

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeRefreshRoot<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" ========================================================
" golang 配置
" ========================================================
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command='goimports'
let g:go_autodetect_gopath=1
let g:go_list_type='quickfix'

let g:go_version_warning=1
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_methods=1
let g:go_highlight_generate_tags=1

let g:godef_split=2

" Disable math tex conceal feature
let g:tex_conceal=''
let g:vim_markdown_math=1

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal=0
let g:vim_markdown_fenced_languages=['tsx=typescriptreact']

" ========================================================
" ctrlp 配置
" ========================================================
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ========================================================
" tagbar 配置
" ========================================================
nmap <leader>t  :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

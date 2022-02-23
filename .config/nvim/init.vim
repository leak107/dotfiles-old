call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
" Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'machakann/vim-sandwich'
Plug 'vim-test/vim-test'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'

" Plug 'StanAngeloff/php.vim'
" Plug 'aeke/vim-php-cs-fixer'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'stephpy/vim-php-cs-fixer'
Plug 'editorconfig/editorconfig-vim'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog  = '/usr/bin/python'
set guifont=FiraCode\ Nerd\ Font\ 11
set encoding=utf-8
let mapleader = ','				"The default leader is \ but , is better
let g:auto_save = 1				"Enable auto save on vim
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc"

"---Edit init.vim---"
nmap <Leader>ev :tabedit ~/.config/nvim/init.vim<cr>
nmap <Leader>es :Files ~/.vim/plugged/vim-snippets/<cr>
nmap <Leader>ee :UltiSnipsEdit<cr>

"---Emmet abbrv hotkey---"
" let g:user_emmet_leader_key= '<c-y>'
" if has('nvim') || has('termguicolors')
    set termguicolors
" endif

syntax on
set t_Co=256
set cursorline

let ayucolor="dark"

colorscheme ayu
" colorscheme onehalfdark
" colorscheme purify
" colorscheme challenger_deep
" hi Normal guibg=#252834 ctermbg=234

autocmd FileType php set iskeyword+=$
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et
autocmd FileType vue setlocal ts=2 sts=2 sw=2 et
autocmd FileType html setlocal ts=2 sts=2 sw=2 et
autocmd FileType css setlocal ts=2 sts=2 sw=2 et

" filetype on
filetype plugin indent on

set background=dark
set updatetime=100
set signcolumn=yes
set hidden
set backspace=indent,eol,start
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set guioptions-=l 
set guioptions-=L
set guioptions-=r
set guioptions-=R
set nohlsearch					"No highlight search
set incsearch					"Increment hightlight searc
set noshowmode
set laststatus=2
set noswapfile
set autowriteall
set relativenumber
set foldmethod=manual

"---NerdTreeConfig---"
let NERDTreeShowHidden = 1		"Let NerdTree see hidden files
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

"---Mapping FZF---"
nnoremap <Leader>f :Files<cr>

"---Mapping for split screen---"
set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>td :tabclose<cr>
nnoremap H gT<cr>
nnoremap L gt<cr>
nnoremap v. :vertical resize+5<cr>
nnoremap v, :vertical resize-5<cr>
nnoremap h. :resize +5<cr>
nnoremap h, :resize -5<cr>


"---Vim Test---"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-l> :TestLast<CR>
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

let test#neovim#term_position = "topleft"
let test#neovim#term_position = "vert"
let test#neovim#term_position = "vert botright 100"
let test#php#phpunit#executable = 'php artisan test'
let test#preserve_screen = 1
let test#strategy ={
	\ 'nearest': 'neovim',
	\ 'file': 'neovim',
	\}

"---BuffKill---"
nmap <C-c> :BD<cr>
" nmap <C-n> :BF<cr>
" nmap <C-p> :BB<cr>

"---Mapping toggle for NerdTree---"
nnoremap <C-t> :NERDTreeToggle<cr>

"---Mapping for coc-vim---"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader> gc :call coc#float#close_all()<cr>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> 
			\ pumvisible() ? "\<C-n>" :
			\ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"---Auto Command---"
augroup autosourcing
	au!
	autocmd BufWritePost $MYVIMRC ++nested source $MYVIMRC
augroup END

"---Sorting by length---"
vmap <Leader>su :sort u<cr>

"---Git Signify--"
let g:signify_line_highlight = 1
inoremap <Leader>h :SignifyToggleHighlight<CR>
nnoremap <Leader>h :SignifyToggleHighlight<CR>
vnoremap <Leader>h :SignifyToggleHighlight<CR>
""


"---Git Gutter--"
let g:gitgutter_sign_column_always = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled=1

"---PHP CS Fixer---"
let g:php_cs_fixer_rules = "@PSR2" 

" PHP documenter script bound to Control-P
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"

autocmd FileType php inoremap <C-p> <ESC>:call pdv#DocumentWithSnip()<CR>
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
autocmd FileType php vnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

" PHP 

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php noremap <Leader>ic :PhpactorImportClass<CR>
autocmd FileType php noremap <Leader>ec :PhpactorClassExpand<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"---Lightline setup---"
let g:lightline = {
  \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'relativepath', 'modified'] ],
	  \   'right': [ [ 'lineinfo' ],
	  \            [ 'percent' ],
	  \            [ 'time', 'fileformat', 'fileencoding', 'filetype' ] ]
	  \ },
      \ 'component_function': {
      \   'time': 'TIME',
      \ },
      \ }

function! TIME()
	return strftime("%R")
endfunction

"---Refresh---"
au FocusGained,BufEnter * :checktime

"---Goyo---"
nmap <C-g> :Goyo<cr>
let g:goyo_width = 150

nmap <Leader>a		:!php artisan 
nmap <Leader>arl	:!php artisan route:list --columns=method,uri,action,name<cr>
nmap <Leader>ami	:!php artisan migrate<cr>
nmap <Leader>amf	:!php artisan migrate:fresh<cr>
nmap <Leader>adb	:!php artisan db:seed<cr>
nmap <Leader>at		:!php artisan test<cr>

"---Markdown---"
let g:mkdp_browser = 'chromium'


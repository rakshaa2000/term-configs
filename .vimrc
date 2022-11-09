syntax on
filetype indent on
set tabstop=4
set nu
set softtabstop=4
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=5
set foldlevel=0
set foldmethod=indent
set encoding=utf-8
set scrolloff=30
set pastetoggle=<F3>

"  Leader
let mapleader = ","
let g:mapleader = ","

map <leader>w :w!<cr>
map <leader>q :q<cr>
nnoremap * *N

" Fast saving
nmap <leader>w :w!<cr>

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <space> za

" Smart way to move between windows
map fj <C-W>j
map fk <C-W>k
map fh <C-W>h
map fl <C-W>l

" move between vimgrep results
nmap fn :cn <CR>
nmap fp :cp <CR>

" work on tabs
map tn :tabnew <CR>
map tl :tabnext <CR>
map th :tabprev <CR>
map tx :tabclose <CR>

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'valloric/youcompleteme'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'reedes/vim-lexical'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'will133/vim-dirdiff'
Plugin 'chriskempson/base16-vim'
Plugin 'chiedo/vim-case-convert'
call vundle#end()
filetype plugin indent on

let g:solarized_termcolors=512
set background=dark
set t_Co=256
colorscheme PaperColor

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Create default mappings
let g:NERDCreateDefaultMappings = 1
"let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

nmap <F8> :TagbarToggle<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = '\v[\/](build*|halon-test|tools|chassis_sim)|(\.(git))$'
" custom_ignore are ignored if custom user command is used. So disable
"if executable('ag')
"    set grepprg=ag\ --nogroup\ --nocolor
"    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

augroup lexical
	autocmd!
	autocmd FileType modula2,markdown,mkd call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spell = 1

" Autosave
let g:auto_save = 1                " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save while in insert mode

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Bullets.vim
let g:bullets_enabled_file_types = [
	\ 'markdown',
	\ 'modula2',
	\ 'text',
	\ 'gitcommit',
	\ 'scratch'
	\]

	" vim-indent-guide
	let g:indent_guides_enable_on_vim_startup = 1

" JS-beautify
" change when required
let s:opt_indent_char="\t"
map <C-f> :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html,markdown vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" yankring
nnoremap <silent> <F11> :YRShow<CR>

" powerline symbols
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline_theme='atomic'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors

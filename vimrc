packadd! vim-master
colorscheme dracula
set nocompatible              " be iMproved, required

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/python/ycm/tests/testdata/.ycm_extra_conf.py"

nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
nnoremap <C-x> :!./%:r.out

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'git://git.wincent.com/command-t.git'
	Plugin 'file:///home/gmarik/path/to/plugin'
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	
	Plugin 'tomasr/molokai'
	Plugin 'bling/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'	
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	Plugin 'scrooloose/syntastic'
	
	Plugin 'xolox/vim-misc'
	Plugin 'xolox/vim-easytags'
	Plugin 'majutsushi/tagbar'
	
	Plugin 'kien/ctrlp.vim'
	Plugin 'vim-scripts/a.vim'
	
	Plugin 'airblade/vim-gitgutter'
	
	Plugin 'Raimondi/delimitMate'
call vundle#end()            
filetype plugin indent on    
set backspace=indent,eol,start
set ruler


syntax on
set mouse=a

set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_console_startup = 1
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
nmap <silent> <leader>b :TagbarToggle<CR>
autocmd BufEnter * nested :call tagbar#autoopen(0)  

hi clear SignColumn

let g:airline#extensions#hunks#non_zero_only = 1

let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

"set foldmethod=indent
set foldlevel=1
set foldclose=all

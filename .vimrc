""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" (c)2014,2015 Chris J Arges <christopherarges@gmail.com>

" highlight text in columns over 80 wide
"set textwidth=80
set colorcolumn=80
hi ColorColumn guibg=#000000 ctermbg=0

set laststatus=2	" always keep status bar
set encoding=utf8	" us utf
set autoread		" read if file is modified externally

" setup indenting
"filetype indent on
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
"set autoindent	" automatically indent

set hlsearch	" highlight searches
set showmatch	" show matching brackets for .2s

set background=dark	" best with dark terminals
syntax enable		" always do syntax highlighting

" spelling
setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

set modeline

" special keys
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>

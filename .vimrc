""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" (c)2014,2015 Chris J Arges <christopherarges@gmail.com>

" highlight text in columns over 80 wide
set colorcolumn=80
hi ColorColumn guibg=#000000 ctermbg=0

set laststatus=2	" always keep status bar
set encoding=utf8	" us utf
set autoread		" read if file is modified externally

" setup indenting
set tabstop=8
set noexpandtab

set hlsearch	" highlight searches
set showmatch	" show matching brackets for .2s

set background=dark	" best with dark terminals
syntax enable		" always do syntax highlighting

" extra whitespace highlighting
highlight default ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" spelling
setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline,bold
hi clear SpellCap
hi SpellCap cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellLocal
hi SpellLocal cterm=underline

set modeline

" special keys
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>

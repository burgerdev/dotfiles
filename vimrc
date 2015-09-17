set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" enable tab completion
" set wildmode=longest,list,full
" set wildmenu

syntax on

" highlight line parts over 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

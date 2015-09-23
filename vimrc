set autoindent
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
filetype on
filetype plugin indent on

" highlight line parts over 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

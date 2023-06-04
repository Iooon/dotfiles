"""""""""""""""""""""""""""""""""""""""""""""""""
"                     Setup                     "
"                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""
" Change LEADER character to comma
let mapleader = ","
filetype plugin on



 """""""""""""""""""""""""""""""""""""""""""""""""
 "                   Displaying                  "
 "                                               "
 """""""""""""""""""""""""""""""""""""""""""""""""
"  Set font and size
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

"  Automatic dark themed syntax for the file
set background=dark
syntax on
colorscheme gruvbox

" Enable hybrid line numbers
set number relativenumber

" Toggle between line number modes
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Highlight unwanted characters
highlight WrongCharMark ctermbg=red guibg=red
autocmd BufEnter *
    \ match WrongCharMark /\s\+$\|\t/ " (trailing whitespaces or tabs)



""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Search                     "
"                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable search highlighting
set hlsearch

" Ignore case when searching
set ignorecase

" Incremental search that shows partial matches
set incsearch

" Automatically switch to case-sensitive when search contains uppercase
" letter
set smartcase



""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Indent                     "
"                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab



"""""""""""""""""""""""""""""""""""""""""""""""""
"                Key Bindings                   "
"                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""
" Keys for wrapping text in quotes and other stuff
nmap <leader>s' ciw'<C-r>"'<esc>
nmap <leader>s" ciw"<C-r>""<esc>
nmap <leader>s{ ciw{<C-r>"}<esc>
nmap <leader>s( ciw(<C-r>")<esc>
nmap <leader>s[ ciw[<C-r>"]<esc>

" Center the screen when switch search results
nmap n nzz
nmap N Nzz

" Navigate windows better
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Compilation
nnoremap <C-c> :!cd /home/jonas/Desktop/workspace/GZA/buildHybrid && make -j6<Enter>




""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Other                     "
"                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically source vimrc on save
augroup reload_vimrc
    autocmd!
        autocmd BufWritePost vimrc source ~/.vimrc
            " autocmd BufWritePost vimrc AirlineRefresh
            augroup END

" Remember last cursor position
set viminfo='20,\"500   " Keep a .viminfo file
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \   if line("'\"") > 0 && line ("'\"") <= line("$") |
    \       exe "normal g'\"" |
    \   endif |
    \ endif

" No sound when reaching the end
set noerrorbells

" Restore cursor position on buffer navigation
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Use system clipboard
if has('win32')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" Backspace over indentation, line breaks and insertion start
set backspace=indent,eol,start

" Disable swap files
set noswapfile

" Allow unsafed buffer swap
set hidden

" Enable spellchecking
set spell

" Increase undo limit
set history=500

" When split do it on the right side/below
set splitright
set splitbelow


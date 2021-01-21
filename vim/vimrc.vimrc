" --- TIPS ---
" Reload Vimrc File:  :so %
"                     :source %
"                     :source ~/.vimrc
"
" Set Color Column:   :set cc=80
"                     :set colorcolumn=80
" To Change Color:    :highlight ColorColumn ctermbg=0 guibg=lightgrey
" For More Columns:   :let &colorcolumn="80,".join(range(120,200),",")
"
" Move By Screen Line: gj, gk
"
" Tabs:               :tabe[dit] <file>
"                     :tabp    :tabn
"                     gt       gT

" Windows:            ctrl-w +
"                               ctrl-w        switch
"                               ctrl-[hjkl]   switch
"                               c             close current
"                               n             new
"                               ctrl-[HJKL]   move current
"                               ctrl-[<>-+]   resize

" Terminal:           :term                   open new terminal window
"                     ctrl-w +
"                              ctrl-c         close
"                              :              enter command

" Fzf:                :FZF PATH               start find file from path
"                                             defaults to pwd
"                     <enter>     current window
"                     ctrl-t      tab
"                     ctrl-x      split
"                     ctrl-v      vsplit

" To View History:    :changes    list line change history
"                     g;    g,    goto older/newer changed line


" --- Things to look into ---
" AUTOMATIC WORD WRAPING
" 'wm' = word margin
" 'tw' = textwidth
" 'fo' = formatoptions
"
" MAPPING
" :help :map-modes

" --- Must Haves ---
set nocompatible
filetype indent plugin on
syntax on


" --- Automatic Installation Vim-Plug ---
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" --- Vim-Plug Packages ---
call plug#begin('~/.vim/plugged')
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'wakatime/vim-wakatime'
    " Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()


" --- Themes ---
colorscheme default
let g:airline_powerline_fonts = 0  " This is the default
set background=light  " morhtz/gruvbox theme


" --- netrw Settings ---
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30


" --- enable fzf ---
" See https://github.com/junegunn/fzf/blob/master/README-VIM.md
set rtp+=/usr/local/opt/fzf


" --- About Trailing Space ---
"      https://stackoverflow.com/questions/32588604/vim-airline-what-is-trailing1
"      Use  :AirlineToggleWhitespace  to toggle trailing space warnings
"      Use  :set invlist  to toggle
set list          " Display unprintable characters f12 - switches
set listchars=tab:▹\ ,trail:◦,extends:»,precedes:« " Unprintable chars mapping


" --- About Line Numbers ---
set number
set relativenumber
set cursorline                            " Highlight current line
highlight clear CursorLine                " Disables the underline
highlight CursorLine ctermbg=black        " cursor line color  (for dark theme)
highlight CursorLine ctermbg=lightgray    " cursor line color
highlight CursorLineNR ctermbg=lightBlue  " cursor line line number color
highlight MatchParen cterm=underline,bold ctermbg=none ctermfg=green   " matching paren color

" Only highlight line in current file
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END


map <Enter> o<ESC>          " enter -> insert new line
map <S-Enter> O<ESC>        " shift enter -> insert above

"                           " Discard x
nnoremap x "_x

map Y y$                            " Make Y behave like D, C
nnoremap <C-L> :nohl<CR><C-L>       " Redraw screen also set no highlight


" --- Add ^k, ^j Behavior ---
nnoremap <C-K> 3kzz
nnoremap <C-J> 3jzz


" --- Change ^w +/- Behavior ---
nnoremap <silent> <C-W>+ :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <C-W>- :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <silent> <C-W>> :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
nnoremap <silent> <C-W>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

" --- Remap Scroll Wheel Speed ---
" so it is not as fast as the default
nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>


" --- Use persistent history ---
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile


" --- Restore Cursor ---
" See  :h restore-cursor
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif


" --- ShowChanges ---
" See  :h :DiffOrig  . This is also in |vimrc.example.vim|
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" --- Always show 5 lines when scrolling ---
set scrolloff=5


" --- Some Settings Found On Internet ---
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
"------------------------------------------------------------

set wildmenu
set showcmd
"set hlsearch
set laststatus=2
set confirm
set mouse=a             " Enable mouse support
set backspace=indent,eol,start

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" --- Search ---
set incsearch           " Incremental search
set ignorecase          " Docase insensitive ...
set smartcase           " ... unless there is one capital letter

" --- Bell ---
set visualbell          " Use visual bell...
set t_vb=               " ...actually, don't beep or flash
                        " Remove t_vb to make it flash


" --- Indent ---
set autoindent

" Use soft indent
set shiftwidth=4
set softtabstop=4
set expandtab

" Use hard indent
"set shiftwidth=4
"set tabstop=4

" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>

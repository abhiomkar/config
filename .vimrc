syntax on
syn on
set number
set ai
set shiftwidth=4
set tabstop=4

set laststatus=2                       " Always show status line
set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=%{GitBranch()}\ [%o]\ %l,%c%V\/%L\ \ %P
										" Better status line

set hlsearch "Highlight search things

" Restore cursor position to where it was before 
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \ let JumpCursorOnEdit_foo = line("'\"") |
            \ let b:doopenfold = 1 |
            \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \ let b:doopenfold = 2 |
            \ endif |
            \ exe JumpCursorOnEdit_foo |
            \ endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \ exe "normal zv" |
            \ if(b:doopenfold > 1) |
            \ exe "+".1 |
            \ endif |
            \ unlet b:doopenfold |
            \ endif 
augroup END 

"}}}

filetype on " Automatially detect file types
filetype plugin on

" Mapping Keyboard Shortcuts
map <C-S-k> dd
imap <C-S-k> dd
map <C-S-o> :NERDTreeToggle<CR>
map <C-S-z> :ConqueTermTab zsh<CR>
map <C-a> <S-^>
map <C-e> <S-$>
nnoremap <silent> <C-S-n> :set number!<CR>
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Vim / MacVim Theme
colorscheme mustang
set background=dark

" Omni Completion - Press C-x C-o
filetype plugin on
set ofu=syntaxcomplete#Complete

set guifont=Menlo\ Regular:h12 

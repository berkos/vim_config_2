
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'slim-template/vim-slim'
Bundle 'mileszs/ack.vim'
Bundle 'https://github.com/berkos/vim-haml.git'
Bundle 'Yggdroot/indentLine'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jiangmiao/auto-pairs'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-dispatch'
Bundle 'vim-airline/vim-airline'
Bundle 'powerline/powerline'

call vundle#end()            " required
filetype plugin indent on    " required



" ----------- My Stuff  ------
"
nnoremap œ :tabprevious<CR>
nnoremap ∑ :tabnext<CR>
nnoremap † :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
" copy like normal
vnoremap <C-c> :w !pbcopy<CR><CR>

set splitright
set relativenumber
set nu


map  ,t  <C-p>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapPreview='gt'
let NERDTreeShowHidden=1
let g:indentLine_color_term = 239
let g:ctrlp_max_files=0




set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8


set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on


let g:neocomplete#enable_at_startup = 1

let laststatus=2


colorscheme sunburst
set background=dark


syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set backspace=2 " make backspace work like most other apps

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END


"let g:vroom_map_keys = 0
"let g:vroom_use_dispatch = 1
let g:vroom_use_zeus = 1
let g:vroom_ignore_color_flag = 1
"let g:vroom_use_vimshell = 1
let g:vroom_rspec_version="3.x"

map <Leader>c :call vroom#RunTestFile()<CR>
map <Leader>s :call vroom#RunNearestTest()<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \r to jump to related file
map <leader>E :Explore .<cr> " \E to open file explorer in root
map <leader>e :Explore<cr> " \e to open file explorer in current dir

"let g:airline_powerline_fonts=1
set laststatus=2

set cursorline
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*


" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
" """"""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.



" viminfo stores the the state of your previous editing session
" set viminfo+=n~/.vim/viminfo
"
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
	:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1



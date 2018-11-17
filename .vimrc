" ============================================
" Vim Configuration
" author: gil.cukierman@gmail.com
" ============================================

" ============================================
" Plugin Management (vim-plug)
" ============================================

" Install vim-plug if it is not there already. Bootstrapping!
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start installing plugins. We use .vim/bundle for backwards compatibility
" because we used to use pathogen and its just easier to not move things
" around on machines that already use the bundle directory.
call plug#begin('~/.vim/bundle')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/Conque-GDB'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Initialize plugin system
call plug#end()

" ============================================
" Editor Options
" ============================================
" Already set by vim-plug but kept here for clarity
syntax on
syntax enable
filetype plugin indent on   

let mapleader=","
set number "line numbers

set mouse=a "scrolling
set background=dark


set clipboard=unnamedplus

set ts=4
set expandtab
set shiftwidth=2
set smartindent
set cursorline
set wildmenu
set showmatch

" Spell Checking
set spelllang=en
set spell

"search tweaking
set incsearch
set hlsearch

" easy navigation between splits with the alt key
" mapped for the option key on mac
nmap ˙ <C-w><Left> 
nmap ¬ <C-w><Right> 
nmap ˚ <C-w><Up> 
nmap ∆ <C-w><Down>
nmap √ <C-w>v
nmap ß <C-w>s

" ============================================
" Tagbar 
" ============================================
set tags+=.git/tags;~
" map ctrl-t to tagbar toggle
map <C-t> :TagbarOpen j<CR>

" ============================================
" Silver Searcher 
" ============================================
" Map grep to ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ 

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

" ============================================
" Auto-Formatting
" ============================================
map <C-K> :Autoformat<cr>
imap <C-K> <c-o>:Autoformat<cr>

" Shortcut to remove trailing whitespace in a file
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" ============================================
" FZF
" ============================================
" add fzf
set rtp+=~/.fzf
" some key bindings for fzf
" search current buffer
map <C-F> :BLines<CR>
" search for file in directory
map <C-P> :Files<CR>

" For netrw
set nocp
filetype plugin on

set backspace=indent,eol,start
set ruler

" ============================================
" Linting and Completion
" ============================================
" Syntastic Checkers
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_enable_yaml_checker = 1
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint']

" Autoclose YCM Preview Window
let g:ycm_autoclose_preview_window_after_completion=1

" autocomplete settings
set completeopt+=menuone


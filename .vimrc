set number
let mapleader = ","
syntax on
set relativenumber
set shell=/usr/bin/zsh
set noswapfile
set nocompatible
set expandtab
set tabstop=2 shiftwidth=2
set smarttab
set autoindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set cursorline
set laststatus=2
set wildmenu
setlocal formatprg=mix\ format\ -
filetype plugin indent on
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin for applying . repeat command to plugin map
Plug 'tpope/vim-repeat'
" Plugin leveraging cs[x][y] where x surrounding is replaced by y
Plug 'tpope/vim-surround'
" Plugin allowing commenting any zone with cm[text object]
Plug 'tpope/vim-commentary'
" Plug with sensible defaults
Plug 'tpope/vim-sensible'
" Plug with :Git command added to vim
Plug 'tpope/vim-fugitive'
" Plug to make netrw usable
Plug 'tpope/vim-vinegar'
" Plug for allowing :DB to submit DB Commands from vim
Plug 'tpope/vim-dadbod'
" Plug for <C-A> on dates
Plug 'tpope/vim-speeddating'
" Plug for common aliases [os, ]os =os :set spell/nospell/invspell
Plug 'tpope/vim-unimpaired'
" Adding to the vim status line
Plug 'vim-airline/vim-airline'
" [count]["x]gr{motion} replace motion with content of register x
Plug 'inkarkat/vim-ReplaceWithRegister'
" Plug  gzi' will titlecase inside of single quotes, gzap will titlecase a paragraph, etc.
Plug 'christoomey/vim-titlecase'
" Plug to show a gutter with changes for git
Plug 'airblade/vim-gitgutter'
" Plug for theming Vim using Base16 themes
Plug 'chriskempson/base16-vim'
" Plug for elixir syntac higligthing and pragma closure
Plug 'elixir-editors/vim-elixir'
" " Plug for automatically adding end after def, do, etc.
Plug 'tpope/endwise'
" Plug for pairing files based on their extensions
Plug 'tpope/vim-projectionist'
" Plug for code completion
Plug 'dense-analysis/ale'
" Using:TestFile, TestNearest to access/run test
Plug 'vim-test/vim-test'
call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" base16 theme setting
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
let colorscheme="base16-phd"
" map \+ et \- to resize windows
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Elixir formatting
let g:ale_fixers = { 'elixir': ['mix_format'] }
let g:ale_elixir_elixir_ls_release='/home/faudibert/elixir-ls/release'
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {}
let g:ale_linters = {'elixir': ['elixir-ls']}
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
let g:ale_list_vertical = 1
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
" ALE should have a nice border
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
" mapping Ctrl-J & Ctrl-K to navigate errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

noremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>

"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" testing strategy to use neoterm
let test#strategy = "neoterm"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" mapping for projectionist
map <leader>za :A<CR>
map <leader>zv :AV<CR>

" netrw settings
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>
function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <Leader><TAB> mu

  nmap <buffer> ff %:w<CR>:buffer #<CR>
  nmap <buffer> fe R
  nmap <buffer> fc mc
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm
  nmap <buffer> fX mtmm
  nmap <buffer> f; mx

  nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
  nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
  nmap <buffer> fd mtfq

  nmap <buffer> bb mb
  nmap <buffer> bd mB
  nmap <buffer> bl gb

  nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> rm -r<CR>
    normal mu
    normal mf

    try
      normal mx
    catch
      echo "Canceled"
    endtry

    cunmap <buffer> <CR>
  endif
endfunction

" " Make 81st column stand out
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" Represent spaces with wiggle characters
exec "set listchars=tab:\uBB\uBB,trail:\UB7,nbsp:~"
set list
" Make ; to be the new :
nnoremap  ;  :
nnoremap  :  ;
" However, in Git commit messages, let’s make it 72 characters
" autocmd FileType gitcommit set textwidth=72
" autocmd FileType gitcommit set colorcolumn=73

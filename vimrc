set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"*********************************
"* Plugin install packages       
"*********************************

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Yggdroot/indentLine'
Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'
Plugin 'editorconfig/editorconfig-vim'

"** syntax check **
"Plugin 'Syntastic'

"** search **
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-scripts/grep.vim'

"** code snippets **
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

"** Python **
"Plugin 'davidhalter/jedi-vim'
"Plugin 'tell-k/vim-autopep8'

"if executable('ctags')
"  Plugin 'xolox/vim-misc'
"  Plugin 'xolox/vim-easytags'          " Requirement: vim-misc
"  Plugin 'majutsushi/tagbar'           " Requirement: ctags
"endif

call vundle#end()


"*********************************
"* Plugin settings       
"*********************************

"*** vim-fugitive settings ***
" If you know in more details, :help fugitive.
" On status window,
" 'shift + i' --> $ git add -p
" '>' --> show diff, '<' --> remove diff. $ git diff
nmap <silent><leader>gs :G <CR>
nmap <silent><leader>gd :Gdiff <CR>
nmap <silent><leader>ga :Git add %:p<CR><CR>
nmap <silent><leader>gps :Gpush <CR>
nmap <silent><leader>gpl :Gpull <CR>
nmap <silent><leader>gl :Glog <CR>
nmap <silent><leader>gst :Git stash <CR>
nmap <silent><leader>gstp :Git stash pop<CR>

"*** vim-gitgutter settings ***
let g:gitgutter_max_signs=9999

"*** polyglot settings ***
let g:polyglot_disabled = ['python']  " Default highlight on python is better
let python_highlight_all = 1

"*** indentLine settings ***
" references: https://github.com/Yggdroot/indentLine/blob/master/doc/indentLine.txt
"let g:indentLine_enabled = 0
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_fileTypeInclude = ['c', 'cpp', 'python', 'sh', 'html', 'css', 'javascript', 'xml']
let g:indentLine_fileTypeExclude = ['vim', 'markdown', 'text']  " Default is [].
nmap <silent><Leader>i :IndentLinesToggle<CR>

"*** NERDTree settings ***
map <silent><F1> :NERDTreeToggle<cr>
let NERDTreeWinSize=20
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode = 2
" Automatic to open & close NERDTree (Not recommended)
"autocmd vimenter * NERDTree  " Open NERDTree when vim enters.
"autocmd VimEnter * wincmd p  " Put cursor on vim window.
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close NERDTree when vim window exits.

" Set pwd to current folder to be useful with NERDTree.
if has("autocmd")
  autocmd vimenter * silent! lcd %:p:h
endif

"*** vim-airline settings ***
let g:airline#extensions#tabline#enabled = 1 " Buffer list on top
let g:airline#extensions#tabline#fnamemod = ':t'

"*** Neocomplcache settings ***
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 2
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 5 
let g:neocomplcache_min_keyword_length = 5
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" To ignore tags file cache
let g:neocomplcache_tags_caching_limit_file_size = 0

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>close_popup_and_complete()<CR>
function! s:close_popup_and_complete()
  " To prevent new line after typing enter key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

"*** colorscheme settings ***
set t_Co=256
set t_ut=""  " disable VIM's background color erase(bce) options -> This problem happens in tmux

hi Comment ctermfg=LightBlue

let colorscheme_bundle=expand('~/.vim/bundle/vim-colorschemes/colors/molokai.vim')
if filereadable(colorscheme_bundle)
  colorscheme molokai
  "colorscheme gruvbox
endif

"*** grep.vim settings ***
nnoremap <silent> <F4> :Rgrep<CR>
let Grep_Default_Options = '-rnw'
"let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"*** ctrlp.vim settings ***
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1

"*** Syntastic settings ***
" Recommended settings (conflict with vim-airline)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Customized settings
" let g:syntastic_mode="passive"
let g:syntastic_loc_list_height = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
nnoremap <silent><F5> :w<CR>
nnoremap <silent><F6> :SyntasticCheck<CR>
nnoremap <silent><F7> :SyntasticToggleMode<CR> 

" Python
let g:syntastic_python_checkers = ['python', 'flake8']

"*** UltiSnips settings ***
let g:UltiSnipsExpandTrigger = "<leader>e"
let g:UltiSnipsJumpForwardTrigger = "<leader>f"
let g:UltiSnipsJumpBackwardTrigger = "<leader>b"
let g:UltiSnipsEditSplit = "vertical"


"*** autopep8 settings ***
let g:autopep8_max_line_length=79
let g:autopep8_indent_size=4
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore="E901,E128"

"*** jedi-vim settings ***
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_command = "<leader>d"
let g:jedi#documentation_command = "D"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:jedi#popup_on_dot = 0   " If 1, show too many functions.. 

noremap <buffer> <F8> :call Autopep8()<CR>

"*** vim-easytag settings ***
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_dynamic_files = 1  " If no tags for current project, load global tags at first.

"*** tagbar settings ***
" references: https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt
nmap <silent><F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:tagbar_map_help = "<leader>h"

" ctags
"set tags=
" Go to the definition
map <F9> <C-]>
" Go back to the code
map <F10> <C-t>


"*********************************
"* Vim settings       
"*********************************

filetype plugin indent on
syntax on

set shiftwidth=2 " automatically shift
set softtabstop=2
set tabstop=2
set expandtab " use space instead of tap
set title

" Python settings
if has("autocmd")
  au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set expandtab
    \ | set autoindent
    \ | set smartindent
    \ | set fileformat=unix
    \ | set cinwords=if,elif,else,for,while,try,except,finally,def,class
    \ | set nocindent
    \ | set showmatch
    \ | set ruler
endif

let python_highlight_all = 1 

fun! Toggle_cc()
  if &cc == ''
    set cc=80
  else
    set cc=
  endif
endfun
nnoremap <silent><leader>l :call Toggle_cc()<CR>

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

"set paste " DEPRECATE -> affect other vim plugin settings
set number
" line number toggle
nmap <F3> :set number!<CR>

" No backup and swap file
set nowritebackup
set noswapfile

set encoding=utf-8
" set fileencodings=utf-8

" Enable mouse scroll without cursor positioning
" while copy & paste using mouse are allowed in only insert mode.
" references: http://vimdoc.sourceforge.net/htmldoc/options.html
" The mouse can be enabled for different modes:
"     n   Normal mode
"     v   Visual mode
"     i   Insert mode
"     c   Command-line mode
"     h   all previous modes when editing a help file
"     a   all previous modes
"     r   for |hit-enter| and |more-prompt| prompt
set mouse=nvch
"set mouse=a
set ttymouse=xterm2  " Use mouse in tmux

" To remove preview window default option from completeopt.
set completeopt-=preview

" Remember last cursor poisition
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" retab
if has("autocmd")
  autocmd BufRead * silent! :retab
endif

" Abbreviations that igores capital command typo
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Auto-complete brackets
imap ( ()<Esc>i
imap { {}<Esc>i
imap [ []<Esc>i

"*** Customized key mappings ***
" To trim white space. 't' denotes 'trim'
nmap <leader>t :%s/\s\+$//e <CR>

" To remove hightlight
nmap t :nohl <CR>

" To move cursor at the center of window
nmap c z. <CR>

" Buffer
nmap bn :bn <CR>
nmap bp :bp <CR>

" Search
nmap s *

" Move the split window by Tab.
nmap <TAB> <C-w><C-w>
" Change the width of vs window. (Plus / Minus)
nmap <silent><leader>vp :vertical resize +5<CR>
nmap <silent><leader>vm :vertical resize -5<CR>
" Change the height of sp window. (Plus / Minus)
nmap <silent><leader>sp <C-w>+
nmap <silent><leader>sm <C-w>-

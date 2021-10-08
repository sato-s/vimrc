""""""""""""""""""""""""""""""
""" Plug-ins
""""""""""""""""""""""""""""""
call plug#begin()
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'sainnhe/edge'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'danro/rename.vim'
Plug 'kien/ctrlp.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'iurifq/ctrlp-rails.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'ap/vim-buftabline'
call plug#end()
""""""""""""""""""""""""""""""
""" Core setting
""""""""""""""""""""""""""""""
"" filetype
au BufRead,BufNewFile *.jb setfiletype ruby
au FocusGained,BufEnter * :checktime
set mmp=5000
set encoding=utf-8
set t_Co=256
set fileformats=unix,dos,mac
set modifiable
syntax enable
filetype plugin indent on
set backspace=indent,eol,start
set autoread
set wildmenu
set wildmode=longest:full,full
set nu
set numberwidth=4
set ruler
set nobackup
set nowb
set noswapfile
set nowrap
set lbr
set wrap
set tw=500
set wildignore=*.o,*~,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.class,*.tar
set wildignore+=*/target/*,*/venv/*,,*/.git/*,cscope.out
set wildignore+=*/vendor/*,*/node_modules/*,*/build/*
set so=7
set sidescrolloff=16
set sidescroll=1
set statusline=%F%m%r%h%w\%=%{tagbar#currenttag('[%s]','')}\[Pos=%v,%l]\[Len=%L]
set laststatus=2
augroup autogroup1
  au!
  autocmd BufEnter * :syntax sync fromstart
  autocmd BufWinEnter * if line2byte(line("$") + 1) > 150000 | syntax clear | endif
  autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
  autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail,md,txt,markdown let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
" More strong sytax highlightning
""" Special characters
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮,space:·
""" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
""" Tab
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
""" Cursor line
set cursorline
" Block style cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
""" GUI/OS
set clipboard=unnamed,unnamedplus
""" Folding
set foldmethod=syntax
set foldlevel=20 " Always fold manually. don't fold at file opening
noremap mf za
noremap msnake :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>

""" Special character
inoremap ^^c ✓
inoremap ^^s ★
inoremap ^^m 🌑
inoremap ^^left ←
inoremap ^^right →
inoremap ^^up ↑
inoremap ^^down ↓

""""""""""""""""""""""""""""""
""" Plug-inn
""""""""""""""""""""""""""""""
""" pathogen
execute pathogen#infect()
call pathogen#helptags()
""" CtrlP
let g:ctrlp_map = 'Nop'
nnoremap ss :<C-u>CtrlPBuffer<CR>
nnoremap sa :<C-u>CtrlP<CR>
nnoremap sl :<C-u>CtrlPMRUFiles<CR>
nnoremap srm :<C-u>CtrlPModels<CR>
nnoremap src :<C-u>CtrlPControllers<CR>
nnoremap srv :<C-u>CtrlPViews<CR>
nnoremap srs :<C-u>CtrlPSpecs<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap st :<C-u>CtrlPTag<CR>
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction
""" FlyGREP
nnoremap sg :FlyGrep<CR>
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<C-a>'],
  \ 'PrtDeleteEnt()':       ['<C-l>'],
  \ }
""" Ag
noremap sf :Ag <C-R>=expand("<cword>")<CR><CR>
""" nerd tree
map sn :NERDTreeToggle<CR>
map sc :NERDTreeFind<CR>
let g:NERDTreeMapJumpNextSibling = '' " Ctrl j/k conflict with nerdtree. so disable them
""" markdown
"let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
""" gitgutter
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn ctermbg=Black
highlight SignColumn guibg=Black
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
noremap mgt :GitGutterSignsToggle<CR>
noremap mgh :GitGutterLineHighlightsToggle<CR>
noremap mgr :GitGutterAll<CR>
nnoremap sb :Gblame<CR>
nnoremap sgd :Gdiff<CR>
let g:gitgutter_sign_added = '▶'
let g:gitgutter_sign_modified = '⮂'
let g:gitgutter_sign_removed = '◀'
""" tagbar
noremap st :TagbarToggle<CR>
""" memolist
let g:memolist_path = "~/workspace/memo"
nnoremap mmn :MemoNew<CR>
nnoremap mml :MemoList<CR>
nnoremap mmg :MemoGrep<CR>
""" vimwiki
let g:vimwiki_list = [{'path': '~/workspace/memo','syntax': 'markdown', 'ext': '.md'}]
nnoremap mww :normal <leader>ww<CR>
nnoremap mwt :normal <leader>wt<CR>
nnoremap mws :normal <leader>ws<CR>
nnoremap mwr :normal <leader>wr<CR>
""" indent-guide
nmap mti <leader>ig
""" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
""" jedi
let g:jedi#goto_command = "spg"
let g:jedi#goto_assignments_command = "spa"
let g:jedi#goto_definitions_command = "spd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "spu"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "spr"
""" vim-javascript
set conceallevel=1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⨞"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_super                = "𝐒"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "λ"
let g:javascript_conceal_underscore_arrow_function = "λ"

""""""""""""""""""""""""""""""
""" Platform Dependent
""""""""""""""""""""""""""""""

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    """ GUI/OS
    set clipboard=unnamed,unnamedplus
    set guifont=Consolas:h11:cANSI
    noremap mtp :set paste!<CR>
  endif
endif

""""""""""""""""""""""""""""""
""" Shortcuts
""""""""""""""""""""""""""""""
" CTRL-C to ESC
nnoremap <C-c> <esc>
inoremap <C-c> <esc>
vnoremap <C-c> <esc>
onoremap <C-c> <esc>
" Emacs like shortcut on command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

nmap <C-k> :bnext<CR><C-l>
nmap <C-j> :bprevious<CR><C-l>
nmap gO o<ESC>k
nmap n nzz
nmap N Nzz
omap <C-[> <C-o>
nmap ]v :cn<CR>
nmap [v :cp<CR>
nmap <C-[> <C-o> 
noremap mth :noh<CR>
noremap mtl :set list!<CR>
noremap mtw :set wrap!<CR>
noremap mtn :set nu!<CR>
noremap mtp :set paste!<CR>
noremap mtt :set expandtab!<CR>
noremap mts :set spell!<CR>
noremap mtc :set cursorline!<CR>
noremap mx :sh<CR>
noremap mb :bd<CR>
noremap md :cd %:p:h<CR>
noremap s <Nop>
map Y y$
vnoremap * "zy:let @/ = @z<CR>n
""" Encoding
noremap mes :e ++enc=shift_jis<CR>
noremap meu :e ++enc=utf-8<CR>
noremap mee :e ++enc=enc-jp<CR>
""" Comment out
noremap <silent> mcc :TComment<CR>
noremap <silent> mcu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
""" Panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
nmap <space> <C-w>
noremap <space><space> <C-w><C-w>
""" BufOnly
noremap mB :BufOnly<CR>

""""""""""""""""""""""""""""""
""" gvim
""""""""""""""""""""""""""""""
""" Stop entering japanese input when switch mode
set iminsert=0
set imsearch=-1
""" Disable menu bar
set guioptions-=T
set guioptions-=m

""""""""""""""""""""""""""""""
""" Cygwin clipboard support
""""""""""""""""""""""""""""""

function! Putclip(type, ...) range
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  if a:type == 'n'
    silent exe a:firstline . "," . a:lastline . "y"
  elseif a:type == 'c'
    silent exe a:1 . "," . a:2 . "y"
  else
    silent exe "normal! `<" . a:type . "`>y"
  endif
  
  "call system('putclip', @@)  " if you're using an old Cygwin
  "call system('clip.exe', @@) " if you're using Bash on Windows
  
  "As of Cygwin 1.7.13, the /dev/clipboard device was added to provide
  "access to the native Windows clipboard. It provides the added benefit
  "of supporting utf-8 characters which putclip currently does not. Based
  "on a tip from John Beckett, use the following:
  call writefile(split(@@,"\n"), '/dev/clipboard')
  
  let &selection = sel_save
  let @@ = reg_save
endfunction

vnoremap <silent> my :call Putclip(visualmode(), 1)<CR>
nnoremap <silent> my :call Putclip('n', 1)<CR>

function! Getclip()
  let reg_save = @@
  "let @@ = system('getclip')
  "Much like Putclip(), using the /dev/clipboard device to access to the
  "native Windows clipboard for Cygwin 1.7.13 and above. It provides the
  "added benefit of supporting utf-8 characters which getclip currently does
  "not. Based again on a tip from John Beckett, use the following:
  let @@ = join(readfile('/dev/clipboard'), "\n")
  setlocal paste
  exe 'normal p'
  setlocal nopaste
  let @@ = reg_save
endfunction

nnoremap <silent> mp :call Getclip()<CR>

""""""""""""""""""""""""""""""
""" mksession when exit 
""""""""""""""""""""""""""""""
" function! MakeSession()
"   let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
"   if (filewritable(b:sessiondir) != 2)
"     exe 'silent !mkdir -p ' b:sessiondir
"     redraw!
"   endif
"   let b:filename = b:sessiondir . '/session.vim'
"   exe "mksession! " . b:filename
" endfunction
" 
" function! LoadSession()
"   let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
"   let b:sessionfile = b:sessiondir . "/session.vim"
"   if (filereadable(b:sessionfile))
"     exe 'source ' b:sessionfile
"   else
"     echo "No session loaded."
"   endif
" endfunction
" au VimEnter * nested :call LoadSession()
" au VimLeave * :call MakeSession()

""""""""""""""""""""""""""""""
""" cscope
""""""""""""""""""""""""""""""
"
" To use other than .c
"   find . -name '*.rb' > cscope.files
"
if has("cscope")

  """"""""""""" Standard cscope/vim boilerplate

  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag

  " check cscope for definition of a symbol before checking ctags: set to 1
  " if you want the reverse search order.
  set csto=0

  " add any cscope database in current directory
  if filereadable("cscope.out")
      cs add cscope.out  
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif

  " show msg when any other cscope db added
  set cscopeverbose  


  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


  " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
  " makes the vim window split horizontally, with search result displayed in
  " the new window.
  "
  " (Note: earlier versions of vim may not have the :scs command, but it
  " can be simulated roughly via:
  "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

  nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
  nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


  " Hitting CTRL-space *twice* before the search type does a vertical 
  " split instead of a horizontal one (vim 6 and up only)
  "
  " (Note: you may wish to put a 'set splitright' in your .vimrc
  " if you prefer the new window on the right instead of the left

  nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
  nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif


""" Color Scheme
set background=dark
colorscheme afterglow
" colorscheme molokai
" hi Normal ctermfg=7*
" hi Normal ctermbg=7*

highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline
" highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterAdd    guifg=#009900 ctermfg=15 ctermbg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=15 ctermbg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=15 ctermbg=1

highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline
" to display property with guake
" https://github.com/neovim/neovim/issues/3455
set guicursor=
" don' show ~ on brank lines
" highlight EndOfBuffer ctermfg=255 ctermbg=255

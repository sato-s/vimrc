""""""""""""""""""""""""""""""
""" Core setting
""""""""""""""""""""""""""""""
set encoding=utf-8
set t_Co=256
set fileformats=unix,dos,mac
set modifiable
syntax enable
filetype plugin indent on
set backspace=indent,eol,start
set autoread
set wildmenu
set nu
set ruler
set nobackup 
set nowb 
set noswapfile
set nowrap
set lbr
set wrap
set tw=500
set wildignore=*.o,*~,*.pyc
set so=7
set sidescrolloff=16
set sidescroll=1
""" Color Scheme
set background=dark
colorscheme hybrid
""" Special characters
set list
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
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
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
""" GUI/OS
set clipboard=unnamed,unnamedplus

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
nnoremap sr :<C-u>CtrlPMRUFiles<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap st :<C-u>CtrlPTag<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz
""" nerd tree
map <silent> <C-n> :NERDTreeFocus<CR>
""" markdown
let g:vim_markdown_folding_disabled = 1
""" gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
noremap mgn <Plug>GitGutterNextHunk
noremap ngp <Plug>GitGutterPrevHunk
noremap mgt :GitGutterSignsToggle<CR>
""" tagbar
nmap <C-m> :TagbarToggle<CR>
""" memolist
let g:memolist_path = "~/workspace/memo"
nnoremap mmn :MemoNew<CR>
nnoremap mml :MemoList<CR>
nnoremap mmg :MemoGrep<CR>

""""""""""""""""""""""""""""""
""" Shortcuts
""""""""""""""""""""""""""""""
nmap <C-j> :bnext<CR>
nmap <C-k> :bprevious<CR>
nmap gO o<ESC>k
nmap n nzz
nmap N Nzz
omap <C-[> <C-o>
nmap ]m :cn<CR>
nmap [m :cp<CR>
nmap <C-[> <C-o> 
noremap mth :noh<CR>
noremap mtl :set list!<CR>
noremap mtw :set wrap!<CR>
noremap mtn :set nu!<CR>
noremap mtp :set paste!<CR>
noremap mtt :set expandtab!<CR>
noremap mts :set spell!<CR>
noremap mx :sh<CR>
noremap mb :bd<CR>
""" Encoding
noremap mes :e ++enc=shift_jis<CR>
noremap meu :e ++enc=utf-8<CR>
noremap mee :e ++enc=enc-jp<CR>
""" Comment out
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> mcc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> mcu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

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
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

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

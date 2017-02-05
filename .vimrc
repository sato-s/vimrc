""""""""""""""""""""""""""""""
""" Core setting
""""""""""""""""""""""""""""""
set encoding=utf-8
set t_Co=256                        " force vim to use 256 colors
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
set wrap "Wrap lines
set tw=500
set wildignore=*.o,*~,*.pyc
set so=7
set sidescrolloff=16
set sidescroll=1
""" ColorScheme
"colorscheme summerfruit256
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
""" Cursorline
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
""" nerd tree
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '_'
map <silent> <C-n> :NERDTreeFocus<CR>
""" markdown
let g:vim_markdown_folding_disabled = 1
""" airline
let g:airline#extensions#tabline#enabled = 1
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
noremap mh :noh<CR>
noremap ml :set list!<CR>
noremap mw :set wrap!<CR>
noremap mn :set nu!<CR>
noremap mp :set paste!<CR>
noremap mt :set expandtab!<CR>
noremap ms :set spell!<CR>
noremap mx :sh<CR>
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


  """"""""""""" key map timeouts
  "
  " By default Vim will only wait 1 second for each keystroke in a mapping.
  " You may find that too short with the above typemaps.  If so, you should
  " either turn off mapping timeouts via 'notimeout'.
  "
  "set notimeout 
  "
  " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
  " with your own personal favorite value (in milliseconds):
  "
  "set timeoutlen=4000
  "
  " Either way, since mapping timeout settings by default also set the
  " timeouts for multicharacter 'keys codes' (like <F1>), you should also
  " set ttimeout and ttimeoutlen: otherwise, you will experience strange
  " delays as vim waits for a keystroke after you hit ESC (it will be
  " waiting to see if the ESC is actually part of a key code like <F1>).
  "
  "set ttimeout 
  "
  " personally, I find a tenth of a second to work well for key code
  " timeouts. If you experience problems and have a slow terminal or network
  " connection, set it higher.  If you don't set ttimeoutlen, the value for
  " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
  "
  "set ttimeoutlen=100

endif

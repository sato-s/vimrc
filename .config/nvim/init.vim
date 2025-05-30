""""""""""""""""""""""""""""""
""" Plug-ins
""""""""""""""""""""""""""""""
call plug#begin()
Plug 'github/copilot.vim'
Plug 'hashivim/vim-terraform'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'eugen0329/vim-esearch'
Plug 'google/vim-jsonnet'
Plug 'tsandall/vim-rego'
" Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'sato-s/telescope-rails.nvim'
Plug 'k0kubun/vim-open-github'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Valloric/MatchTagAlways'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'ruanyl/vim-gh-line'
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim'
Plug 'dag/vim-fish'
Plug 'danro/rename.vim'
Plug 'davidhalter/jedi-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'mechatroner/rainbow_csv'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovimhaskell/haskell-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rking/ag.vim'
Plug 'sainnhe/edge'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Tagbar'
Plug 'vimwiki/vimwiki'
Plug 'hsanson/vim-openapi'
""" ColorScheme
Plug 'danilo-augusto/vim-afterglow'
Plug 'sickill/vim-monokai'
Plug 'sato-s/summerfruit256.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()
""""""""""""""""""""""""""""""
""" Core setting
""""""""""""""""""""""""""""""
"" filetype
lang en_US.UTF-8
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
set wildignore+=*/target/*,*/venv/*,*/.git/*,cscope.out
set wildignore+=*/vendor/*,*/node_modules/*,*/build/*
set so=7
set sidescrolloff=16
set sidescroll=1
set statusline=%F%m%r%h%w\%=%{tagbar#currenttag('[%s]','')}\[Pos=%v,%l]\[Len=%L]
set laststatus=2
augroup autogroup1
  au!
  autocmd BufEnter * :syntax sync fromstart
  " autocmd BufWinEnter * if line2byte(line("$") + 1) > 150000 | syntax clear | endif
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
""" Special character
inoremap ^^c ✓
inoremap ^^s ★
inoremap ^^m 🌑
inoremap ^^left ←
inoremap ^^right →
inoremap ^^up ↑
inoremap ^^down ↓
""" Paging
noremap <C-d> 5j
noremap <C-u> 5k

""""""""""""""""""""""""""""""
""" pluginn
""""""""""""""""""""""""""""""
""" solargraph
if executable('solargraph')
  " gem install solargraph
  au User lsp_setup call lsp#register_server({
    \ 'name': 'solargraph',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
    \ 'whitelist': ['ruby'],
    \ })
endif

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
""" Telescope
nnoremap sa <cmd>Telescope find_files<cr>
nnoremap sr <cmd>Telescope registers<cr>
nnoremap ss <cmd>Telescope buffers<cr>
nnoremap sg <cmd>Telescope live_grep<cr>
nnoremap sl <cmd>Telescope oldfiles<cr>
nnoremap srs :Telescope rails specs<CR>
nnoremap src :Telescope rails controllers<CR>
nnoremap srm :Telescope rails models<CR>
nnoremap srv :Telescope rails views<CR>
lua << EOF
local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

require('telescope').setup{
  defaults = {
    initial_mode = "insert",
    mappings = {
      i = {
       ['<CR>'] = select_one_or_multi,
      },
    },

  },
  pickers = {
    find_files = {
      layout_strategy='vertical'
    },
    buffers = {
      layout_strategy='vertical'
    },
    live_grep = {
      layout_strategy='vertical'
    },
    oldfiles = {
      layout_strategy='vertical'
    },
    layout_config = {
      prompt_position = "top"
    }
  }
}
require("registers").setup({})
EOF
""" Ag
noremap sf :Ag <C-R>=expand("<cword>")<CR><CR>
""" File Explorer
nnoremap sn <cmd>CHADopen<cr>
"-- map sn :NERDTreeToggle<CR>
"-- map sc :NERDTreeFind<CR>
"-- let g:NERDTreeMapJumpNextSibling = '' " Ctrl j/k conflict with nerdtree. so disable them
""" bufferline
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
nnoremap <silent>    <C-k> <Cmd>BufferLineCycleNext<CR>
nnoremap <silent>    <C-j> <Cmd>BufferLineCyclePrev<CR>
nnoremap <silent>m1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent>m2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent>m3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent>m4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent>m5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent>m6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent>m7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent>m8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent>m9 <Cmd>BufferLineGoToBuffer 9<CR>

nnoremap <silent>    mb <Cmd>bd<CR>
nnoremap <silent>    mk <Cmd>BufferLineCloseRight<CR>
nnoremap <silent>    mu <Cmd>BufferLineCloseLeft<CR>
nnoremap <silent>    mp <Cmd>BufferLineTogglePin<CR>


""" gitgutter
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn ctermbg=Black
highlight SignColumn guibg=Black
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
noremap mgt :GitGutterSignsToggle<CR>
noremap mgh :GitGutterLineHighlightsToggle<CR>
noremap mgr :GitGutterAll<CR>
nnoremap sb :Git blame<CR>
nnoremap sgd :Gdiff<CR>
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
""" markdown
"let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
""" tagbar
noremap st :TagbarToggle<CR>
""" vimwiki
let g:vimwiki_list = [{'path': '~/work/memo','syntax': 'markdown', 'ext': '.md'}]
nnoremap mww :normal <leader>ww<CR>
nnoremap mwt :normal <leader>wt<CR>
nnoremap mws :normal <leader>ws<CR>
nnoremap mwr :normal <leader>wr<CR>
""" gh-line
" Copy link to a clipboard instead of opening a browser
"let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
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
" Macro
noremap mm qq
noremap mq :'<,'>normal @q<CR>
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
noremap md :cd %:p:h<CR>
noremap s <Nop>
map Y y$
vnoremap * "zy:let @/ = @z<CR>n
" a to 2i
xnoremap a" 2i"
xnoremap a' 2i'
xnoremap a` 2i`
onoremap a" 2i"
onoremap a' 2i'
onoremap a` 2i`
""" Commands
command FN let @+ = expand("%")
command FA let @+ = expand('%:p')
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

""" Color Scheme
set termguicolors
" let ayucolor="light"
" let ayucolor="mirage"
" let ayucolor="dark"
let g:afterglow_inherit_background=1
let g:afterglow_italic_comments=1
colorscheme afterglow

highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      COC-vim-coc                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"
" " Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction)
nmap <leader>a  <Plug>(coc-codeaction)
nnoremap sp <Plug>(coc-fix-current)

nnoremap <leader>e <Plug>(coc-codeaction)

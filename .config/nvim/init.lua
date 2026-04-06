------------------------------
-- Packages (using vim.pack)
------------------------------
vim.pack.add({
  'https://github.com/github/copilot.vim',
  'https://github.com/hashivim/vim-terraform',
  'https://github.com/tversteeg/registers.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/eugen0329/vim-esearch',
  'https://github.com/google/vim-jsonnet',
  'https://github.com/danilamihailov/beacon.nvim',
  'https://github.com/ahalbert/vim-gbq-syntax',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-symbols.nvim',
  'https://github.com/sato-s/telescope-rails.nvim',
  'https://github.com/k0kubun/vim-open-github',
  'https://github.com/MaxMEllon/vim-jsx-pretty',
  'https://github.com/Valloric/MatchTagAlways',
  'https://github.com/airblade/vim-gitgutter',
  'https://github.com/ap/vim-css-color',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/ruanyl/vim-gh-line',
  'https://github.com/tsandall/vim-rego',
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/dag/vim-fish',
  'https://github.com/danro/rename.vim',
  'https://github.com/davidhalter/jedi-vim',
  'https://github.com/elixir-editors/vim-elixir',
  'https://github.com/fatih/vim-go',
  'https://github.com/leafgarland/typescript-vim',
  'https://github.com/mechatroner/rainbow_csv',
  'https://github.com/nathanaelkane/vim-indent-guides',
  'https://github.com/neovimhaskell/haskell-vim',
  'https://github.com/ntpeters/vim-better-whitespace',
  'https://github.com/pangloss/vim-javascript',
  'https://github.com/plasticboy/vim-markdown',
  'https://github.com/neoclide/coc.nvim',
  'https://github.com/rking/ag.vim',
  'https://github.com/sainnhe/edge',
  'https://github.com/preservim/nerdtree',
  'https://github.com/tmux-plugins/vim-tmux-focus-events',
  'https://github.com/tomtom/tcomment_vim',
  'https://github.com/tpope/vim-abolish',
  'https://github.com/tpope/vim-bundler',
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-rails',
  'https://github.com/tpope/vim-rbenv',
  'https://github.com/tpope/vim-surround',
  'https://github.com/vim-ruby/vim-ruby',
  'https://github.com/vim-scripts/Tagbar',
  'https://github.com/vimwiki/vimwiki',
  'https://github.com/hsanson/vim-openapi',
  -- ColorScheme
  'https://github.com/danilo-augusto/vim-afterglow',
  'https://github.com/sickill/vim-monokai',
  'https://github.com/sato-s/summerfruit256.vim',
  'https://github.com/ayu-theme/ayu-vim',
})

-- Post-install hooks
-- Treesitter update
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local ts_update = vim.fn.stdpath('data') .. '/pack/packages/start/nvim-treesitter/.ts_updated'
    if vim.fn.filereadable(ts_update) == 0 then
      vim.cmd('TSUpdate')
      vim.fn.writefile({}, ts_update)
    end
  end,
})

------------------------------
-- Core setting
------------------------------
-- Language
vim.cmd('lang en_US.UTF-8')

-- Filetype
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.jb',
  command = 'setfiletype ruby'
})

vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter'}, {
  command = 'checktime'
})

vim.opt.mmp = 5000
vim.opt.encoding = 'utf-8'
vim.opt.termguicolors = true
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.modifiable = true
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.opt.backspace = 'indent,eol,start'
vim.opt.autoread = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.ruler = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 500
vim.opt.wildignore = '*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip,*.gz,*.class,*.tar,*/target/*,*/venv/*,*/.git/*,cscope.out,*/vendor/*,*/node_modules/*,*/build/*'
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 16
vim.opt.sidescroll = 1
vim.opt.statusline = '%F%m%r%h%w\\%=%{tagbar#currenttag(\"[%s]\",\"\")}\\[Pos=%v,%l]\\[Len=%L]'
vim.opt.laststatus = 2

-- Autocommands
local autogroup1 = vim.api.nvim_create_augroup('autogroup1', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  group = autogroup1,
  command = 'syntax sync fromstart'
})

vim.api.nvim_create_autocmd('InsertEnter', {
  group = autogroup1,
  command = 'highlight CursorLine guibg=#000050 guifg=fg'
})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = autogroup1,
  command = 'highlight CursorLine guibg=#004000 guifg=fg'
})

vim.api.nvim_create_autocmd('FileType', {
  group = autogroup1,
  pattern = {'c', 'cpp', 'java', 'scala'},
  callback = function()
    vim.b.comment_leader = '// '
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = autogroup1,
  pattern = {'sh', 'ruby', 'python'},
  callback = function()
    vim.b.comment_leader = '# '
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = autogroup1,
  pattern = {'conf', 'fstab'},
  callback = function()
    vim.b.comment_leader = '# '
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = autogroup1,
  pattern = 'tex',
  callback = function()
    vim.b.comment_leader = '% '
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = autogroup1,
  pattern = {'mail', 'md', 'txt', 'markdown'},
  callback = function()
    vim.b.comment_leader = '> '
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = autogroup1,
  pattern = 'vim',
  callback = function()
    vim.b.comment_leader = '" '
  end
})

-- Special characters
vim.opt.listchars = 'tab:▸ ,eol:↲,extends:❯,precedes:❮,space:·'

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Tab
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Cursor line
vim.opt.cursorline = true

-- Cursor style
vim.opt.guicursor = ''

-- Clipboard
vim.opt.clipboard = 'unnamed,unnamedplus'

-- Folding
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 20

------------------------------
-- Plugins
------------------------------
-- Beacon
require('beacon').setup()

-- LSP (nvim 0.11+ native config)
-- LSP keymappings on attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Keymappings for LSP (only if COC is not handling this buffer)
    if not vim.b[bufnr].coc_enabled then
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to declaration' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover documentation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code action' })
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = bufnr, desc = 'Format' })
    end
  end,
})

-- Regal (Rego language server)
vim.lsp.config('regal', {
  cmd = { 'regal', 'language-server' },
  filetypes = { 'rego' },
  root_dir = vim.fs.root(0, { '.git', 'go.mod' }),
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rego',
  callback = function(args)
    vim.lsp.enable('regal')
  end,
})

-- Solargraph (Ruby language server)
if vim.fn.executable('solargraph') == 1 then
  vim.lsp.config('solargraph', {
    cmd = { 'solargraph', 'stdio' },
    filetypes = { 'ruby' },
    root_dir = vim.fs.root(0, { 'Gemfile', '.git' }),
    settings = {
      solargraph = {
        diagnostics = true,
      },
    },
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'ruby',
    callback = function(args)
      vim.lsp.enable('solargraph')
    end,
  })
end

-- Telescope
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

-- Bufferline
require("bufferline").setup{}

-- NERDTree
vim.g.NERDTreeMapJumpNextSibling = ''

-- Gitgutter
vim.opt.updatetime = 100
vim.g.gitgutter_override_sign_column_highlight = 1
vim.g.gitgutter_sign_added = '█'
vim.g.gitgutter_sign_modified = '█'
vim.g.gitgutter_sign_removed = '█'

-- Markdown
vim.g.vim_markdown_conceal_code_blocks = 0

-- Vimwiki
vim.g.vimwiki_list = {{path = '~/work/memo', syntax = 'markdown', ext = '.md'}}
vim.g.vimwiki_key_mappings = { all_maps = 0 }

-- Haskell
vim.g.haskell_enable_quantification = 1
vim.g.haskell_enable_recursivedo = 1
vim.g.haskell_enable_arrowsyntax = 1
vim.g.haskell_enable_pattern_synonyms = 1
vim.g.haskell_enable_typeroles = 1
vim.g.haskell_enable_static_pointers = 1
vim.g.haskell_backpack = 1

-- Jedi
vim.g['jedi#goto_command'] = "spg"
vim.g['jedi#goto_assignments_command'] = "spa"
vim.g['jedi#goto_definitions_command'] = "spd"
vim.g['jedi#documentation_command'] = "K"
vim.g['jedi#usages_command'] = "spu"
vim.g['jedi#completions_command'] = "<C-Space>"
vim.g['jedi#rename_command'] = "spr"

-- JavaScript
vim.opt.conceallevel = 1
local javascript_folding = vim.api.nvim_create_augroup('javascript_folding', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = javascript_folding,
  pattern = 'javascript',
  command = 'setlocal foldmethod=syntax'
})

vim.g.javascript_conceal_function = "ƒ"
vim.g.javascript_conceal_null = "ø"
vim.g.javascript_conceal_this = "@"
vim.g.javascript_conceal_return = "⨞"
vim.g.javascript_conceal_undefined = "¿"
vim.g.javascript_conceal_NaN = "ℕ"
vim.g.javascript_conceal_super = "𝐒"
vim.g.javascript_conceal_arrow_function = "⇒"
vim.g.javascript_conceal_noarg_arrow_function = "λ"
vim.g.javascript_conceal_underscore_arrow_function = "λ"

-- Color Scheme
vim.g.afterglow_inherit_background = 1
vim.g.afterglow_italic_comments = 1
vim.cmd('colorscheme afterglow')

------------------------------
-- Key Mappings
------------------------------
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Special character inserts
keymap('i', '^^c', '✓', { noremap = true })
keymap('i', '^^s', '★', { noremap = true })
keymap('i', '^^m', '🌑', { noremap = true })
keymap('i', '^^left', '←', { noremap = true })
keymap('i', '^^right', '→', { noremap = true })
keymap('i', '^^up', '↑', { noremap = true })
keymap('i', '^^down', '↓', { noremap = true })

-- Paging
keymap('n', '<C-d>', '5j', { noremap = true })
keymap('n', '<C-u>', '5k', { noremap = true })

-- Folding
keymap('n', 'mf', 'za', { noremap = true })

-- Telescope
keymap('n', 'sa', '<cmd>Telescope find_files<cr>', opts)
keymap('n', 'sr', '<cmd>Telescope registers<cr>', opts)
keymap('n', 'ss', '<cmd>Telescope buffers<cr>', opts)
keymap('n', 'sg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', 'sl', '<cmd>Telescope oldfiles<cr>', opts)
keymap('n', 'srs', ':Telescope rails specs<CR>', { noremap = true })
keymap('n', 'src', ':Telescope rails controllers<CR>', { noremap = true })
keymap('n', 'srm', ':Telescope rails models<CR>', { noremap = true })
keymap('n', 'srv', ':Telescope rails views<CR>', { noremap = true })

-- Ag
keymap('n', 'sf', ':Ag <C-R>=expand("<cword>")<CR><CR>', { noremap = true })

-- NERDTree
keymap('n', 'sn', ':NERDTreeToggle<CR>', {})
keymap('n', 'sc', ':NERDTreeFind<CR>', {})

-- Bufferline
keymap('n', '<C-k>', '<Cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<C-j>', '<Cmd>BufferLineCyclePrev<CR>', opts)
keymap('n', 'm1', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
keymap('n', 'm2', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
keymap('n', 'm3', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
keymap('n', 'm4', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
keymap('n', 'm5', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
keymap('n', 'm6', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
keymap('n', 'm7', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
keymap('n', 'm8', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
keymap('n', 'm9', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
keymap('n', 'mb', '<Cmd>bd<CR>', opts)
keymap('n', 'mk', '<Cmd>BufferLineCloseRight<CR>', opts)
keymap('n', 'mu', '<Cmd>BufferLineCloseLeft<CR>', opts)
keymap('n', 'mp', '<Cmd>BufferLineTogglePin<CR>', opts)

-- Gitgutter
keymap('n', ']h', '<Plug>(GitGutterNextHunk)', {})
keymap('n', '[h', '<Plug>(GitGutterPrevHunk)', {})
keymap('n', 'mgt', ':GitGutterSignsToggle<CR>', { noremap = true })
keymap('n', 'mgh', ':GitGutterLineHighlightsToggle<CR>', { noremap = true })
keymap('n', 'mgr', ':GitGutterAll<CR>', { noremap = true })
keymap('n', 'sb', ':Git blame<CR>', { noremap = true })
keymap('n', 'sgd', ':Gdiff<CR>', { noremap = true })

-- Tagbar
keymap('n', 'st', ':TagbarToggle<CR>', { noremap = true })

-- Vimwiki
keymap('n', 'mwf', '<Plug>VimwikiFollowLink', { noremap = true })
keymap('n', 'mww', '<Plug>VimwikiIndex', { noremap = true })

-- Indent guide
keymap('n', 'mti', '<leader>ig', {})

-- Macro
keymap('n', 'mm', 'qq', { noremap = true })
keymap('n', 'mq', ":'<,'>normal @q<CR>", { noremap = true })

-- CTRL-C to ESC
keymap('n', '<C-c>', '<esc>', { noremap = true })
keymap('i', '<C-c>', '<esc>', { noremap = true })
keymap('v', '<C-c>', '<esc>', { noremap = true })
keymap('o', '<C-c>', '<esc>', { noremap = true })

-- Emacs like shortcuts on command line
keymap('c', '<C-A>', '<Home>', { noremap = true })
keymap('c', '<C-E>', '<End>', { noremap = true })
keymap('c', '<C-P>', '<Up>', { noremap = true })
keymap('c', '<C-N>', '<Down>', { noremap = true })
keymap('c', '<C-F>', '<Right>', { noremap = true })
keymap('c', '<C-B>', '<Left>', { noremap = true })

-- Navigation
keymap('n', 'gO', 'o<ESC>k', {})
keymap('n', 'n', 'nzz', {})
keymap('n', 'N', 'Nzz', {})
keymap('o', '<C-[>', '<C-o>', {})
keymap('n', ']v', ':cn<CR>', {})
keymap('n', '[v', ':cp<CR>', {})
keymap('n', '<C-[>', '<C-o>', {})

-- Toggle options
keymap('n', 'mth', ':noh<CR>', { noremap = true })
keymap('n', 'mtl', ':set list!<CR>', { noremap = true })
keymap('n', 'mtw', ':set wrap!<CR>', { noremap = true })
keymap('n', 'mtn', ':set nu!<CR>', { noremap = true })
keymap('n', 'mtp', ':set paste!<CR>', { noremap = true })
keymap('n', 'mtt', ':set expandtab!<CR>', { noremap = true })
keymap('n', 'mts', ':set spell!<CR>', { noremap = true })
keymap('n', 'mtc', ':set cursorline!<CR>', { noremap = true })

-- Misc
keymap('n', 'mx', ':sh<CR>', { noremap = true })
keymap('n', 'md', ':cd %:p:h<CR>', { noremap = true })
keymap('n', 's', '<Nop>', { noremap = true })
keymap('n', 'Y', 'y$', {})
keymap('v', '*', '"zy:let @/ = @z<CR>n', { noremap = true })

-- a to 2i
keymap('x', 'a"', '2i"', { noremap = true })
keymap('x', "a'", "2i'", { noremap = true })
keymap('x', 'a`', '2i`', { noremap = true })
keymap('o', 'a"', '2i"', { noremap = true })
keymap('o', "a'", "2i'", { noremap = true })
keymap('o', 'a`', '2i`', { noremap = true })

-- Encoding
keymap('n', 'mes', ':e ++enc=shift_jis<CR>', { noremap = true })
keymap('n', 'meu', ':e ++enc=utf-8<CR>', { noremap = true })
keymap('n', 'mee', ':e ++enc=enc-jp<CR>', { noremap = true })

-- Comment
keymap('n', 'mcc', ':TComment<CR>', { noremap = true, silent = true })

-- Panes
keymap('n', '<Right>', ':vertical resize +5<cr>', opts)
keymap('n', '<Left>', ':vertical resize -5<cr>', opts)
keymap('n', '<Up>', ':resize +5<cr>', opts)
keymap('n', '<Down>', ':resize -5<cr>', opts)
keymap('n', '<space>', '<C-w>', {})
keymap('n', '<space><space>', '<C-w><C-w>', { noremap = true })

------------------------------
-- Commands
------------------------------
vim.api.nvim_create_user_command('FN', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('FA', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end, {})

------------------------------
-- GUI settings
------------------------------
vim.opt.iminsert = 0
vim.opt.imsearch = -1
vim.opt.guioptions:remove('T')
vim.opt.guioptions:remove('m')

------------------------------
-- Cygwin clipboard support
------------------------------
function Putclip(type, ...)
  local sel_save = vim.o.selection
  vim.o.selection = "inclusive"
  local reg_save = vim.fn.getreg('@')

  if type == 'n' then
    vim.cmd('silent ' .. arg[1] .. ',' .. arg[2] .. 'y')
  elseif type == 'c' then
    vim.cmd('silent ' .. arg[1] .. ',' .. arg[2] .. 'y')
  else
    vim.cmd('silent normal! `<' .. type .. '`>y')
  end

  vim.fn.writefile(vim.split(vim.fn.getreg('@'), '\n'), '/dev/clipboard')

  vim.o.selection = sel_save
  vim.fn.setreg('@', reg_save)
end

keymap('v', 'my', ':call v:lua.Putclip(visualmode(), 1)<CR>', opts)
keymap('n', 'my', ':call v:lua.Putclip("n", 1)<CR>', opts)

function Getclip()
  local reg_save = vim.fn.getreg('@')
  vim.fn.setreg('@', table.concat(vim.fn.readfile('/dev/clipboard'), '\n'))
  vim.opt.paste = true
  vim.cmd('normal p')
  vim.opt.paste = false
  vim.fn.setreg('@', reg_save)
end

------------------------------
-- COC settings
------------------------------
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.shortmess:append('c')

-- Tab completion
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()',
  { expr = true, silent = true })
keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<C-h>"]], { expr = true })
keymap('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], { expr = true })

-- Trigger completion
keymap('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })

-- GoTo code navigation
keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Symbol renaming
keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Formatting
keymap('x', '<leader>f', '<Plug>(coc-format)', {})
keymap('n', '<leader>f', '<Plug>(coc-format)', {})

-- Code actions
keymap('x', '<leader>a', '<Plug>(coc-codeaction)', {})
keymap('n', '<leader>a', '<Plug>(coc-codeaction)', {})
keymap('n', 'sp', '<Plug>(coc-fix-current)', { noremap = true })
keymap('n', '<leader>e', '<Plug>(coc-codeaction)', { noremap = true })

-- COC autocommands
local mygroup = vim.api.nvim_create_augroup('mygroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = mygroup,
  pattern = {'typescript', 'json'},
  command = "setl formatexpr=CocAction('formatSelected')"
})

vim.api.nvim_create_autocmd('User', {
  group = mygroup,
  pattern = 'CocJumpPlaceholder',
  command = "call CocActionAsync('showSignatureHelp')"
})

------------------------------
-- Highlights
------------------------------
vim.cmd([[
highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline
highlight GitGutterAdd    guifg=#009900 ctermfg=15 ctermbg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=15 ctermbg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=15 ctermbg=1
highlight SignColumn ctermbg=Black
highlight SignColumn guibg=Black
]])

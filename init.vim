call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'morhetz/gruvbox' "https://github.com/morhetz/gruvbox
Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lsp'
" Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'karb94/neoscroll.nvim'
Plug 'slim-template/vim-slim' "https://github.com/slim-template/vim-slim
Plug 'tpope/vim-endwise' "https://github.com/tpope/vim-endwise
Plug 'tpope/vim-rails' "https://github.com/tpope/vim-rails
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'APZelos/blamer.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'tpope/vim-unimpaired' "https://github.com/tpope/vim-unimpaired
" Completion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
call plug#end()

set autoread
au CursorHold * checktime
set ruler
set nowrap
set splitright
set number
filetype plugin indent on
syntax enable
syntax on
set mouse=a
set tabstop=2
set shiftwidth=2
set autoindent
set wildmenu
set wildmode=longest,full,full
set incsearch
set relativenumber
set mousehide
set list
set listchars=trail:.
set listchars=tab:\|\
set updatetime=300
set redrawtime=10000
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guifont=Hack\ Nerd\ Font\ Mono:h18


" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_trail_length=0.8
let g:neovide_fullscreen=v:false
let g:neovide_cursor_vfx_mode = "torpedo"

let g:onedark_color_overrides = {
\ "background": {"gui": "#151515", "cterm": "235", "cterm16": "0" },
\ "white": {"gui": "#969CA8", "cterm": "235", "cterm16": "0" },
\ "green": {"gui": "#3EAB7A", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C275D8", "cterm": "170", "cterm16": "5" }
\}

" colorscheme nightfox
colorscheme onedark
" colorscheme tokyonight
let g:lightline = {'colorscheme': 'tokyonight'}
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='luna'
let g:airline_theme='onedark'
let g:onedark_termcolors=256

nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <leader>z :u<CR>
nmap <leader>Q :qa!<CR>
nmap <leader>q :bw<CR>

" nnoremap <leader>` :NERDTreeFind<CR>
nnoremap <expr> <leader>` g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>w :q<CR>
nnoremap <leader><Right> :bn<CR>
nnoremap <leader><Left> :bp<CR>

" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

let g:blamer_enabled = 1
let g:blamer_delay = 250
let g:blamer_show_in_insert_modes = 0
let g:blamer_show_in_visual_modes = 0

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

highlight SignifySignAdd                  ctermbg=green  guifg=#ffffff guibg=#98c379
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#be5046
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#ffffff guibg=#e5c07b

lua << EOF
require('neoscroll').setup({
    easing_function = "quadratic" -- Default easing function
    -- Set any other options as needed
})


local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}
-- Use the "circular" easing function
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100', nil}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100', nil}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
EOF

" lua << EOF
" require'lspconfig'.solargraph.setup{
" cmd = { "~/.rvm/gems/ruby-2.5.8/bin/solargraph", "--stdio" }
"   filetypes = { "ruby" }
"   root_dir = root_pattern("Gemfile", ".git")
"   settings = {
"     solargraph = {
"       diagnostics = true
"     }
"   }
" }
" EOF


lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
end
EOF
"
" lua << EOF
" vim.o.completeopt = "menuone,noselect"
"
" require'compe'.setup {
"   enabled = true;
"   autocomplete = true;
"   debug = false;
"   min_length = 1;
"   preselect = 'enable';
"   throttle_time = 80;
"   source_timeout = 200;
"   incomplete_delay = 400;
"   max_abbr_width = 100;
"   max_kind_width = 100;
"   max_menu_width = 100;
"   documentation = false;
"
"   source = {
"     path = true;
"     buffer = true;
"     calc = true;
"     vsnip = true;
"     nvim_lsp = true;
"     nvim_lua = true;
"     spell = true;
"     tags = true;
"     snippets_nvim = true;
"     treesitter = true;
"   };
" }
" local t = function(str)
"   return vim.api.nvim_replace_termcodes(str, true, true, true)
" end
"
" local check_back_space = function()
"     local col = vim.fn.col('.') - 1
"     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
"         return true
"     else
"         return false
"     end
" end
"
" -- Use (s-)tab to:
" --- move to prev/next item in completion menuone
" --- jump to prev/next snippet's placeholder
" _G.tab_complete = function()
"   if vim.fn.pumvisible() == 1 then
"     return t "<C-n>"
"   elseif vim.fn.call("vsnip#available", {1}) == 1 then
"     return t "<Plug>(vsnip-expand-or-jump)"
"   elseif check_back_space() then
"     return t "<Tab>"
"   else
"     return vim.fn['compe#complete']()
"   end
" end
" _G.s_tab_complete = function()
"   if vim.fn.pumvisible() == 1 then
"     return t "<C-p>"
"   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
"     return t "<Plug>(vsnip-jump-prev)"
"   else
"     -- If <S-Tab> is not working in your terminal, change it to <C-h>
"     return t "<S-Tab>"
"   end
" end
"
" vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
" EOF

lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF




nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

cnoreabbrev tele Telescope
cnoreabbrev sf Telescope find_files
cnoreabbrev s Telescope live_grep
cnoreabbrev ff Telescope find_files
cnoreabbrev f Telescope live_grep
cnoreabbrev rel! source $MYVIMRC
cnoreabbrev fave cd ~/projects/kfit-app
cnoreabbrev dc cd ~/projects/decube-app-backend

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.rb :call TrimWhiteSpace()
autocmd BufWritePre     *.py :call TrimWhiteSpace()
autocmd BufWritePre     *.rs :call TrimWhiteSpace()
autocmd Filetype rust setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

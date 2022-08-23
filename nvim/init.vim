" Pre-plugin dependencies
"" For wilder.nvim
function! UpdateRemotePlugins(...)
	" Needed to refresh runtime files
	let &rtp=&rtp
	UpdateRemotePlugins
endfunction

" Plugin manager: vim-plug
call plug#begin()
" --------------------------------------
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" --------------------------------------

" --------------------------------------
" PLUGINS ------------------------------
" --------------------------------------

" Co-pilot to do my work for me
Plug 'github/copilot.vim'

" UI component library for Neovim used by some plugins
Plug 'MunifTanjim/nui.nvim'

" Theme: Dracula
Plug 'dracula/vim'

" Theme: Oceanic Next
Plug 'mhartington/oceanic-next'

" Theme: Nightfox
Plug 'EdenEast/nightfox.nvim'

" Theme: zephyr
Plug 'glepnir/zephyr-nvim'

" Theme: Catppuccin
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Fzf to navigate files fuzzily
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File browser via :NERDTree
Plug 'scrooloose/nerdtree'

" Jump anywhere in the file.
" eg: gw <- this will let you jump to any word
Plug 'phaazon/hop.nvim'

" Add Prisma support
Plug 'pantharshit00/vim-prisma'

" Statusline/statusbar + winbar
Plug 'feline-nvim/feline.nvim'

" Dev icons (requires patched font)
Plug 'kyazdani42/nvim-web-devicons'

" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'

" Fancy, configurable notification manager
Plug 'rcarriga/nvim-notify'
" TODO evaluate whether this ^ is worth keeping

" Comment stuff out.
Plug 'numToStr/Comment.nvim'
" # NORMAL mode
"   `gcc` - Toggles the current line using linewise comment
"   `gbc` - Toggles the current line using blockwise comment
"   `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
"   `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
"   `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
"   `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
" # VISUAL mode
"   `gc` - Toggles the region using linewise comment
"   `gb` - Toggles the region using blockwise comment
" # Extra mappings
"   `gco` - Insert comment to the next line and enters INSERT mode
"   `gcO` - Insert comment to the previous line and enters INSERT mode
"   `gcA` - Insert comment to end of the current line and enters INSERT mode

" Treesitter highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Treesitter-based context as you scroll through code
Plug 'nvim-treesitter/nvim-treesitter-context'
" Treesitter-based local code dimming
Plug 'folke/twilight.nvim'
" Treesitter-based contextual comments (eg do {/* these */} in jsx depending
" on cursor location)
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Treesitter-based autoclose and autorename HTML tags
Plug 'windwp/nvim-ts-autotag'
" Treesitter-based rainbow parenthesis
Plug 'p00f/nvim-ts-rainbow'
" Regex explainer. Requires :TSInstall regex
Plug 'bennypowers/nvim-regexplainer'
" Syntax aware text-objects, select, move, swap, and peek support
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


" Opens the current buffer in a new full-screen floating window,
" doesn't mess with existing window layouts / splits.
" Use via :Zen (alias of the real command, :TZAtaraxis)
Plug 'Pocco81/true-zen.nvim'

" Substitute variants (like case differences),
" eg: :%s/foo/bar/g
" eg: (visual selection) Subvert/foo/bar/g
" ... would replace all foo/Foo/FOO with bar/Bar/BAR
" It can do a lot more though, but that's 99% of what i do with it.
Plug 'tpope/vim-abolish'

" Guide lines for indents
Plug 'lukas-reineke/indent-blankline.nvim'

" Highlight arguments' definitions and usages
Plug 'm-demare/hlargs.nvim'

" Opens a popup with suggestions to help you complete a key binding
" (tl;dr key mappings helper)
Plug 'folke/which-key.nvim'

" A cooler version of the :wildmenu (the command menu, via colon key)
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

" LSP stuff
Plug 'neovim/nvim-lspconfig'
"" Fancy lines for LSP messages
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
"" Fast as FUCK completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " main one
""" ^ run :COQdeps then :COQnow
"" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
"" Lspsaga for improving LSP UI/UX (vague, i know)
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
"" Lua language server
Plug 'sumneko/lua-language-server'

" Markdown preview via :MarkdownPreview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" ... ^ assumes nodejs and yarn are installed

" Lua functions that some plugins use
Plug 'nvim-lua/plenary.nvim'

" A fix for Neovim's `CursorHold` event. Used by some plugins (neotest, ...)
Plug 'antoinemadec/FixCursorHold.nvim'

" Extensible framework for interacting with tests within Neovim
Plug 'nvim-neotest/neotest'
" Vitest runner for neotest
Plug 'marilari88/neotest-vitest'
" Jest runner for neotest
" Plug 'haydenmeade/neotest-jest'
" Initialize plugin system
call plug#end()

" --------------------------------------
" MISC ---------------------------------
" --------------------------------------
set relativenumber " Relative line numbers on left
set number " Current line number on left
set cursorline " Highlight current row
set cursorline cursorcolumn " Highlight current column
set noexpandtab " Don't turn tabs to space
set tabstop=2 " how many columns a tab counts for
set shiftwidth=2 " how many columns text is indented with the reindent operations
set termguicolors " Required by feline, i guess?
set nowrap " Don't line wrap
set splitbelow " Preferred split direction
set splitright " Preferred vsplit direction
set scrolloff=5 " Always keep N number of lines from edge of screen
set mouse=a " enable mouse support in (a)ll modes
set timeoutlen=500

" Special line characters
set list
set listchars=tab:⣿⣿,eol:↵,trail:·,precedes:⦚,extends:⦚,nbsp:⎵
" misc fun symbols: 🡆 🠶 🠊 ⮞ ⮚ ▶ ⎵ ⣿ ⠉ ⠈ ░ ▒ ▓ ► ◄ ↵ · ◣ ◢ ◥ ◤ ◐ ◑ ⯺  ⯼ ☉ ⁞ ⦙ ┊ ⦚ ×
set showbreak=↪\

" Leader key is space (instead of default \)
" let mapleader = "\<Space>"

" <LocalLeader>
let maplocalleader = ","

" --------------------------------------
" various configurations to avoid cluttering the main file
" --------------------------------------
lua require('lsp')
lua require('treesitter-stuff')
lua require('tests-etc')
source $HOME/.dotfiles/nvim/fzf-ctrlp-etc.vim
source $HOME/.dotfiles/nvim/zen.vim
source $HOME/.dotfiles/nvim/twilight-dimming-etc.vim
source $HOME/.dotfiles/nvim/winbar-statusbar.vim
source $HOME/.dotfiles/nvim/git.vim
source $HOME/.dotfiles/nvim/movement.vim
source $HOME/.dotfiles/nvim/education.vim
source $HOME/.dotfiles/nvim/wildmenu-commandbar-etc.vim

" Set catppuccin after sourcing the look-and-feel
source $HOME/.dotfiles/nvim/theme-look-feel-etc.vim
let g:catppuccin_flavour = "frappe" " latte, frappe, macchiato, mocha
colorscheme catppuccin
" Misc color tweaks after colorscheme is set
"" Transparent background (use terminal emulator opacity)
highlight Normal guibg=NONE ctermbg=NONE
"" Floating window stuff
highlight FloatBorder guifg=white
highlight NormalFloat guibg=black

" --------------------------------------
" TODO ---------------------------------
" --------------------------------------

" Make filetypes of PostCSS = CSS
autocmd BufEnter *.pcss :setlocal filetype=css

" No background colors for nvim-ts-rainbow
hi rainbowcol1 guibg=NONE
hi rainbowcol2 guibg=NONE
hi rainbowcol3 guibg=NONE
hi rainbowcol4 guibg=NONE
hi rainbowcol5 guibg=NONE
hi rainbowcol6 guibg=NONE
hi rainbowcol7 guibg=NONE




" Always use the current buffer's directory as the relative location for
" commands and such. Mostly so I can :NERDTree and :sp/vsp anywhere.
autocmd BufEnter * silent! lcd %:p:h

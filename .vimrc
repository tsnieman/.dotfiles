""""""""""""""""""""""""""""""""""""""
"""""""" GENERAL NOTES FOR """"""""""
"""""""" A GREATER VIMMING """"""""""
"""""""""""""""""""""""""""""""""""""

" Go to older/newer positions in the change list (same file only):
" g; jumps to the previous change and g, to the next change.
" via https://www.reddit.com/r/vim/comments/6819r9/til_use_ctrlo_and_ctrli_to_navigate_cursor/dgv02jz/

" Navigate :jumps -- move around cursor history (even across files):
" CTRL O and CTRL I.
" via https://www.reddit.com/r/vim/comments/6819r9/til_use_ctrlo_and_ctrli_to_navigate_cursor/

"""""""""""""""""""""""""""""""""""""
""""""""PLUGIN SETUP SECTION"""""""""
"""""""""""""""""""""""""""""""""""""

" Automatically install Plug if Vim starts without it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Directory for plugins.
" > avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" NERDTree: file browser sidebar. Just type execute `:NERDTree`
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading

" Comment stuff out. Just execute `gcc` (or `gc` + motion).
Plug 'tpope/vim-commentary'

" Work with variants of words,
" like: `:%Subvert/facilit{y,ies}/building{,s}/g`
Plug 'tpope/vim-abolish'

" Git in vim.
Plug 'tpope/vim-fugitive'

" Navigate files by filename, just execute `CTRL-P`
" Plug 'ctrlpvim/ctrlp.vim'

" Theme 'Oceanic Next'
Plug 'mhartington/oceanic-next'

" Shows whether a line has been modified (per VCS like git)
Plug 'mhinz/vim-signify'

" Navigate files fuzzily with fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Dim text near focus
Plug 'junegunn/limelight.vim'

" Icons in NERDTree
Plug 'ryanoasis/vim-devicons' " Needs to happen after nerdtree stuff.

" Javascript syntax stuff
Plug 'pangloss/vim-javascript'

" JSX syntax stuff
Plug 'mxw/vim-jsx'

" Flow type checking on save (+ completions)
Plug 'flowtype/vim-flow'

" Multiple cursors! Highlight a word, hit CTRL N to highlight/modify multiple words.
Plug 'terryma/vim-multiple-cursors'

" Code completion
Plug 'maralla/completor.vim', { 'dir': '~/.vim/plugged/completor.vim/pythonx/completers/javascript', 'do': 'make js'}

" Indent guides (bars representing indentations, kinda like cursorline but for
" all whitespace)
Plug 'nathanaelkane/vim-indent-guides', { 'on':  'IndentGuidesToggle' } " On-demand loading

" Visualize undos from vim's undo branches via :UndotreeToggle
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Emmet for vim. Turn css selectors into longform HTML via CTRL-Y.
Plug 'mattn/emmet-vim'

" Easy motion for navigation. To use: LEADER-J or LEADER-K.
Plug 'easymotion/vim-easymotion'

" ALE (Asynchronous Linting Engine) provides inline linting hints for ESLint,
" Flow, etc.
Plug 'w0rp/ale'

" GraphQL syntax stuff
Plug 'jparise/vim-graphql'

" Opens a pane synchronized to your main buffer which displays the results of
" evaluating each line as you type. To use: :Codi [filetype]
Plug 'metakirby5/codi.vim'

" Illuminate the other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'
hi link illuminatedWord Visual
" Time in millis (default 250)
let g:Illuminate_delay = 150

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""
"""""""""""MISC SETTINGS"""""""""""""
"""""""""""""""""""""""""""""""""""""

set autoindent " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden " Possibility to have more than one unsaved buffers.
set incsearch " Incremental search, hit '<CR>' to stop.
set ruler " Shows the current line number at the bottom right of the screen.
set wildmenu " Great command-line completion, use '<Tab>' to move around and '<CR>' to validate.
set relativenumber " Relative line numbers on left.
set number " in combination with relativenumber, we get 'hybrid mode' that has the current linenumber on your current row position (instead of the default '0')
set cursorline " Highlight current row
set cursorline cursorcolumn " Highlight current column
set nowrap " Don't line wrap
" set foldmethod=indent " When folding, base it on line indentation
set noexpandtab " Don't turn tabs to space
set tabstop=2 " how many columns a tab counts for
set shiftwidth=2 " how many columns text is indented with the reindent operations
set scrolloff=2 " Always keep N number of lines from edge
set conceallevel=3 " Special characters use this to conceal multiple characters (i.e. ==> to arrow)
set timeout timeoutlen=1000 ttimeoutlen=100 " Because https://stackoverflow.com/a/2158610/498975

" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete " Enable CTRL X CTRL O autocompletion.

" Filetype-specific settings
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" General colorscheme (theme)
colorscheme OceanicNext

" Options for 'GUI Vim'
if has("gui_running")
  set guioptions-=T  " Remove toolbar
  set visualbell! " No visual bell (flash)
  set guifont=Fira\ Code\ Nerd\ Font\ Medium\ 12
endif

" Hide stuff from Ctrl P
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/dist/*,*/node_modules/*,*/bower_components/*,*/dist_server/*

" Special line characters
set list
set listchars=tab:→·,eol:↵,trail:·,precedes:←,extends:→
set showbreak=↪\

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

" Allow mouse use in vim (💀)
if has('mouse')
  set mouse=a
endif

" ZEN MODE.
" 1. Goyo (narrow, centered writing area)
" 2. limelight (dims text near focus)
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
command Zen Goyo

""""""""""""""""""""""""""""""""""""
"""""""""""LEADER MAPPINGS""""""""""
""""""""""""""""""""""""""""""""""""

" Leader key is space (instead of default \)
let mapleader = "\<Space>"

" Select all text in buffer
map <Leader>a ggVG

"""""""""""""""""""""""""""""""""""""
"""""""""""""""ALIASES"""""""""""""""
"""""""""""""""""""""""""""""""""""""

" :Tabnew -> :tabnew
cnoreabbrev <expr> Tabnew ((getcmdtype() is# ':' && getcmdline() is# 'Tabnew')?('tabnew'):('Tabnew'))


"""""""""""""""""""""""""""""""""""""
"""""""""""PLUGIN SETTINGS"""""""""""
"""""""""""""""""""""""""""""""""""""

""""""""""" NERDTree """"""""""""""""

" Minimal NERDTree UI
let NERDTreeMinimalUI=1

" Show hidden files by default
let NERDTreeShowHidden=1

" Adjust square brackets around devicons in NERDTree
" https://github.com/ryanoasis/vim-devicons/wiki/FAQ-&-Troubleshooting#square-brackets-around-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_nerdtree = 1

"""""""""""" vim-flow """""""""""""""
" Hide quickfix menu (since ALE is being used)
let g:flow#showquickfix = 0


"""""""""""""" ALE """"""""""""""""""
" Let ALE fix files using these fixers...
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'jsx': ['eslint', 'flow'],
\}


""""""""""""" Completor """""""""""""
" Tell completor/tern where node is
let g:completor_node_binary = '~/.nvm/versions/node/v8.6.0/bin/node'


""""""""""" fzf + ripgrep """""""""""
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search
" --color: Search color options
"
" fzf#vim#grep(command, with_column, [options], [fullscreen])

" Search git filesnames (i.e. git ls-files)
command! -bang -nargs=* GitFiles
  \ call fzf#vim#gitfiles(
    \ '.',
    \ fzf#vim#with_preview('right:50%')
  \ )

" Search git file content (i.e. git grep)
command! -bang -nargs=* GitGrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --no-heading --glob="!package-lock.json" --glob="!.git/*" --color=always --ignore-case '.shellescape(<q-args>),
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Ripgrep to search contents of all files.
" :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
" :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>),
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Open files, split in window.
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" Open fzf to search files via CTRL P
nnoremap <c-p> :GitFiles<cr>

" Search buffers via ; (semicolon key)
nmap ; :Buffers<CR>


"""""""""""""""""""""""""""""""""""""
"""""""""""STATUSLINE SETUP""""""""""
"""""""""""""""""""""""""""""""""""""

" Highlight colors for statusline.
hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15

" via https://www.reddit.com/r/vim/comments/6b7b08/my_custom_statusline/
function! ActiveStatus()
  let statusline=" " " blank space

  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}" " git branch

  let statusline.="%2*" " highlight thing (TODO better explanation)

  let statusline.=" " " blank space
  let statusline.=" " " blank space
  let statusline.="%f" " filename
  let statusline.="@" " just an @ symbol lol
  let statusline.="%l:%c" " line:column numbers.
  let statusline.=" " " blank space

  let statusline.="%{&modified?'+':''}" " show a little icon when modified (but not saved)
  let statusline.="%{&readonly?'':''}" " show a little icon when readonly

  let statusline.="%=" " Right-align shit after this line

  let statusline.="\ %{''!=#&filetype?&filetype:'none'}" " display filetype if present
  let statusline.=" " " blank space
  let statusline.="[buffer#%n]" " buffer #
  let statusline.=" "
  return statusline
endfunction

set laststatus=2 " Always show the statusline
set statusline=%!ActiveStatus()

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
augroup END

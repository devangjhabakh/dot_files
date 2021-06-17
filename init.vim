" ================== neovim 20201122 ========================

set spell spelllang=en_us
filetype off
filetype plugin indent on

set title								" Window title is `filename [+=-] (path) - NVIM`
set titlestring=						" reset the titlestring
set titlestring+=nvim					" Clearly identify the sessionis running nvim,
set titlestring+=\ [%t]					" Add the file name to titlestring,
set titlestring+=\ %r%m					" Add the readonly and modified flag to titlestring.
set number								" Show the line numbers
set ruler								" Show the line and column numbers of the cursor.
set textwidth=0							" Hard-wrap long lines as you type them.
set modeline							" Enable modeline.
set linespace=0							" Set line-spacing to minimum.
set nojoinspaces						" Prevents inserting two spaces after punctuation on a join (J)
set display+=lastline					" Show as much of the last line as possible.
set nostartofline						" Do not jump to first character with page commands.
set noerrorbells						" No beeps
set nofoldenable						" Disable folding
set backspace=indent,eol,start			" Delete key should work
set showcmd								" Show me what I'm typing
set showmode							" Show current mode.
set noswapfile							" Don't use swapfile
set nobackup							" Don't create annoying backup files
set nowritebackup						" Don't make a backup before overwriting a file
set encoding=utf-8						" Set default encoding to UTF-8
set splitright							" Split window right when creating horizontal windows
set splitbelow							" Split window below when creating vertical windows
set autowrite							" Automatically save before :next, :make etc.
set autoread							" Automatically reread changed files without asking me anything
set laststatus=2						" Always have a statusline
set fileformats=unix,dos,mac			" Prefer Unix over Windows over OS 9 formats
set showmatch							" Do not show matching brackets by flickering
set incsearch							" Shows the match while typing
set hlsearch							" Highlight found searches
set ignorecase							" Search case insensitive...
set smartcase							" ... but not when search pattern contains upper case characters
set lazyredraw							" Delay redrawing
set nocursorcolumn						" Don't highlight the cursor column
set cursorline							" Highlight the cursor line
set wrap								" Wrap lines that are longer than the window width
set linebreak							" Wrap long lines on words and not the last character.
" set formatoptions-=r formatoptions-=c formatoptions-=o    " Continue comment marker in new lines.
set formatoptions=qcron1				" Configures automatic formatting
										" q : Allow formatting of comments with GQ
										" c	: Auto-wraps comments using textwidth, inserting
										"	  the current commet leader automatically.
										" r	: Auto inserts commet leader after hitting enter
										" o : Auto inserts commet leader after entering o or O
										" n	: When formatting text, recognize numbered lists
										" 1	: Don't break a line after a one-letter word
set autoindent							" Copy indent from current line when starting a new line
set smartindent							" Do smart autoindenting when starting a new line
set showmatch							" When a bracket is inserted, briefly jump to the matching one.
										" The jump is only done if the match can be seen on the screen.
set smarttab							" A <Tab> in front inserts spaces set by shiftwidth and all other places use tabstop or softtabstop.
set tabstop=4							" Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4						" The number of spaces to indent the next deeper level.
set softtabstop=4
set expandtab							" Use the appropriate number of spaces to insert a <Tab>.
set nospell								" Spell checking is off by default.
set norelativenumber					" Show the line number relative to the line with the cursor in front of each line.
set updatetime=100						" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
syntax enable							" Turn syntax highlighting on.
set conceallevel=0						" Do not conceal markdown syntax.
set termguicolors

" == Mappings ==
let mapleader = ","
let g:mapleader = ","
cmap w!! w !sudo tee % >/dev/null

nmap <C-n> :bn<CR>  " Next buffer in list
nmap <C-p> :bp<CR>  " Previous buffer in list
nmap <C-#> :b#<CR>  " Previous buffer you were in
nmap <C-3> :b#<CR>  " Previous buffer you were in

" Add a date timestamp between two new lines.
nnoremap <leader>d :call InsertDate()<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Center the screen
nnoremap <space> zz

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


" cd ~/.config/nvim/spell
" wget http://ftp.vim.org/vim/runtime/spell/pt.utf-8.spl
" set spell spelllang=pt_pt
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
" set spellfile=~/.config/nvim/spellfile.add
set nospell

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins here
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'tpope/dispatch.vim'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'neomake/neomake'
Plug 'metakirby5/codi.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/goyo.vim'
Plug 'plasticboy/vim-markdown'
Plug 'SirVer/ultisnips'
Plug 'moll/vim-bbye'
Plug 'honza/vim-snippets'
Plug 'chr4/nginx.vim'
Plug 'Yggdroot/indentLine'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()


" Filetypes
autocmd FileType gitconfig,sh,toml set noexpandtab
autocmd FileType gitcommit setlocal spell
autocmd FileType dockerfile set noexpandtab
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.json setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.lua setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.md setlocal spell noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.txt setlocal spell noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.vim setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.yml,*.yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType help nnoremap q :q<cr>

" ======================== fzf ========================
autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>

" =================== NerdTree ========================
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
nmap <Leader>p :NERDTreeToggle<CR>

" === vim-terraform ===
let g:terraform_align=1					" Allow vim-terraform to override your .vimrc indentation syntax for matching files.
let g:terraform_fmt_on_save=1			" Run terraform fmt on save.

" === ayu-vim ===
" Set color theme in vim
let ayucolor="dark"
colorscheme ayu

" === vim-go ===
let g:go_template_autocreate = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1

" === GoYo ===
nmap <leader>g :Goyo<CR>

" === airline ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" === Markdown ===
" disable folding
let g:vim_markdown_folding_disabled = 1

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Allow the ge command to follow named anchors in links of the form
" file#anchor or just #anchor, where file may omit the .md extension as usual
let g:vim_markdown_follow_anchor = 1

" highlight frontmatter
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" === deoplete ===
" let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = $HOME."/.asdf/shims/python"

" === ultisnips ===
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" === Searching ===
map <leader>h :noh<CR>

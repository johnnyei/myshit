"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"git
Plug 'tpope/vim-fugitive'

"syntax
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'

"files
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

"autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"autopair
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

"commenting
Plug 'preservim/nerdcommenter'

"status bar
Plug 'vim-airline/vim-airline'

"themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

call plug#end()

"
" NATIVE CONFIG
"

"disable mouse
set mouse=

"enable cursorline
set cursorline

"syntax
syntax enable
set number relativenumber
set autoread
set encoding=UTF-8

"finder
map <C-n> :NERDTreeToggle<CR>

"default for vim sleuth
set expandtab
set tabstop=2
set shiftwidth=2

"
" PLUGIN CONFIG
"

"completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set cmdheight=1
"turn off completion menu messages
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
\    'coc-git',
\    'coc-json',
\    'coc-python',
\    'coc-sh',
\    'coc-yaml',
\]

inoremap <silent><expr> <C-space> coc#refresh()

"jump back to and forth
nnoremap <space>o <C-o>zz
nnoremap <space>i <C-i>zz

"GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)zz
nmap <silent> gt <Plug>(coc-type-definition)zz
nmap <silent> gi <Plug>(coc-implementation)zz
nmap <silent> gr <Plug>(coc-references)zz

nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"remap keys for applying codeAction to the current line.
nmap <leader>ac <Plug>(coc-codeaction)
"apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

"Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>

let g:user_emmet_leader_key = '<C-d>'

"buffer remap
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>

"
" THEMING
"

"set true colors
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has('termguicolors'))
    set termguicolors
endif

let g:airline_powerline_fonts = 1

"disable all extensions for a minimal setup
"let g:airline_extensions = []

set background=dark
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material

"whitespace rendering
highlight NonText guifg=grey22
highlight Whitespace guifg=grey22
highlight SpecialKey guifg=grey22

"highlight only one character when line too long
highlight ColorColumn ctermbg=grey guibg=grey25
call matchadd('ColorColumn', '\%75v', 100)

call plug#begin()
" Thema
Plug 'crusoexia/vim-monokai'
"Angular
Plug 'crusoexia/vim-javascript-lib'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
"Git
Plug 'tpope/vim-fugitive'
" Nerdtree
Plug 'preservim/nerdtree'
" Finder fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"React
Plug 'neovim/nvim-lspconfig'
" Suporte a LSP (Language Server Protocol)

" Autocomplete
Plug 'hrsh7th/nvim-cmp'            " Sistema de autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'        " Integração entre LSP e nvim-cmp

" Snippets
Plug 'L3MON4D3/LuaSnip'            " Gerenciador de snippets
Plug 'rafamadriz/friendly-snippets' " Snippets pré-prontos para React

" Destacamento de Sintaxe e JSX/TSX
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Melhor sintaxe
Plug 'maxmellon/vim-jsx-pretty'    " Suporte avançado para JSX/TSX
call plug#end()

syntax enable
colorscheme monokai
set termguicolors
set t_Co=256
set number
set cpoptions+=n
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set completeopt=menuone,noinsert,noselect
autocmd FileType typescript,json setlocal omnifunc=coc#refresh
autocmd BufWritePre *.ts,*.html,*.scss :silent! PrettierAsync
" Abrir arquivos no NERDTree em abas
let g:NERDTreeMapActivateNode = '<Enter>'
autocmd FileType nerdtree nmap <buffer> <CR> :call OpenInNewTab()<CR>

" Função para abrir o arquivo selecionado em uma nova aba
function! OpenInNewTab()
  let node = g:NERDTreeFileNode.GetSelected()
  if node != {}
    execute 'tabnew' node.path.str()
  endif
endfunction

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
let g:netrw_browse_split = 3
let NERDTreeQuitOnOpen=1
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

let g:netrw_altv = 1

let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-prettier',
\]

" Configuração básica do ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescriptreact': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescriptreact': ['prettier'],
\}
let g:ale_fix_on_save = 1

" Atalhos úteis
 nmap f :NERDTreeToggle<CR> " Abre o netrw a esqueda
 nnoremap <C-n> :Files<CR>
nnoremap <leader>r :!npm run start<CR>
nnoremap <leader>f :ALEFix<CR>

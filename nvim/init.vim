:set number
:set noincsearch
:set autoread
:set autowrite
:set nowrap
:set sidescroll=10
:set expandtab
:set shiftwidth=4
:set softtabstop=4
:filetype plugin indent on
:au FocusLost * silent! wa


set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping


call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
if exists("g:neovide")
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
endif
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

let b:ale_fixers = ['prettier', 'eslint']

"start nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"let g:NERDTreeMouseMode = 3

"start theme
let g:gruvbox_contrast_dark='hard'
let g:onedark_config = {
      \ 'style': 'darker',
      \}
colorscheme gruvbox

"for coc tab completion
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"telescope mappings
:map <Space> :Telescope find_files<Cr>

"airline
:set noshowmode

"prettier
:map <C-p> :PrettierAsync <Cr>

lua << EOF
require'nvim-treesitter.configs'.setup {

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

EOF


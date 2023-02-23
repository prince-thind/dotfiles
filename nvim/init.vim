:set number
:set noincsearch
:set autoread
:set autowrite
:set nowrap
:set sidescroll=10

let g:gruvbox_contrast_dark='hard'
call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug 'sickill/vim-monokai'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

"start nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"let g:NERDTreeMouseMode = 3

"start theme
autocmd vimenter * ++nested colorscheme gruvbox
"colorscheme monokai

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


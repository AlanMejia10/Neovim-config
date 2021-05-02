source $HOME/.config/nvim/vim-plug/plugins.vim

" Install ripgrep: sudo aptitude install ripgrep

let mapleader=","
syntax on
set noshowmode
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set smartindent
set nowrap
set smartcase
set noswapfile
set incsearch
set hlsearch
set hidden "notify when a buffer is closed and not saved
set cursorline
set guicursor= " set the cursor as a block for every mode 
set scrolloff=6
set signcolumn=yes
set clipboard=unnamedplus

" ------- CONGIF ---------
"Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

colorscheme gruvbox
set background=dark
highlight comment cterm=italic

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Navigate Splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Copy to system clipboard (depends on vim-gtk)
vnoremap <Leader><C-c> "+y

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = "onedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" COC (Conquer of Completion)
let g:coc_global_extensions = [
    \'coc-json', 'coc-angular', 'coc-clangd', 'coc-cmake', 
    \'coc-css', 'coc-cssmodules', 'coc-emmet', 'coc-git', 
    \'coc-html', 'coc-jedi', 'coc-prettier', 'coc-rome', 
    \'coc-sql', 'coc-texlab', 'coc-tsserver', 'coc-snippets'
    \]

"coc tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Fzf (Fuzzy finder)
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>frg :Rg<CR>

"closing tags

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.ejs'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml, ejs'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" support for ejs
au BufNewFile,BufRead *.ejs set filetype=html


" source ~/.vim/cscope_maps.vim
call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'habamax/vim-winlayout'
Plug 'ycm-core/YouCompleteMe'
"enable buffer top,using vim-airline
let g:airline#extensions#tabline#enabled = 1

call plug#end()
"self-define keybindings
inoremap jk <esc> 
inoremap <esc> <nop>
"
colors darkblue
" enable fzf
set rtp+=~/.fzf
set cursorline 
set number
set hlsearch
set background=dark
set pastetoggle=<F2>
" leader keys
let mapleader = ","
let g:EasyMotion_leader_key = ','

"NERDTree
noremap <C-e> :NERDTreeToggle<CR>
noremap <leader>e :NERDTreeFind<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap  <leader>[ :vertical resize -10<CR>
nnoremap  <leader>] :vertical resize +10<CR>
nnoremap  <C-Left> :resize -1<CR>
nnoremap  <C-Right> :resize -1<CR>
nnoremap t] :call tagbar#jumpToNearbyTag(1)<CR>
nnoremap t[ :call tagbar#jumpToNearbyTag(-1)<CR>
nmap <leader>g <Plug>(WinlayoutBackward)
nmap <leader>h <Plug>(WinlayoutForward)

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.o$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

let g:rooter_patterns = ['!=theme', 'package.json', '.git','cscope.out']
" keybindings
" noremap <leader>ev :execute "a:tabedit" . " " . expand("~/.vimrc",":p")
noremap <leader>ev :vsp $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
"Ctrl-C Ctrl-v
vnoremap <C-c> :w !xclip -selection clipboard<CR><CR>
vnoremap <C-v> :r !xclip -o -selection clipboard<CR><CR>
nnoremap <C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

command! -nargs=* AgCaseWord call fzf#vim#ag_raw('--case-sensitive --word-regexp ' . <q-args>)

if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  if filereadable("cscope.out")
    cs add cscope.out
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif
function! Tasty()
	  return "Tasty"
  endfunction

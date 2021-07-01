"-----------------------------------------------------------------------------
" Standard setting 徐々にコメントつけて整理していく。
"-----------------------------------------------------------------------------
set nobackup "ファイル保存時にバックアップファイルを作らない
set noswapfile "ファイル編集中にスワップファイルを作らない
set hlsearch "検索文字列をハイライトする
set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set mouse=a " マウスの入力を受け付ける
set number "行番号
nnoremap <esc><esc> :noh<CR> "スケープ二回押してハイライトを消す

let mapleader = "\<Space>" " リーダーキーの設定
set clipboard+=unnamed "クリップボードにコピー

"-------------------------------------------------------------------------------
" Dein
"-------------------------------------------------------------------------------
let s:dein_dir = expand('~/.cache/dein')
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------

colorscheme molokai

"----------------------------------------------------------------------------
" スニペット
"-----------------------------------------------------------------------------
let g:UltiSnipsUsePythonVersion    = 3
let g:UltiSnipsEditSplit           = 'normal'
let g:UltiSnipsSnippetDirectories  = [$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsEnableSnipMate      = 0
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
command! SNIP UltiSnipsEdit

"----------------------------------------------------------------------------
" Remap key biding
"-----------------------------------------------------------------------------
nmap :s :UltiSnipsEdit
nmap :'<,'>r :'<,'>Reword/

" jj連打でescape
inoremap <silent> jj <ESC>
" Select all
nmap <C-a> gg<S-v>G

" noremap <Down> gj
" noremap <Up> gk
" nnoremap <S-Tab> <<

" INSERT mode
"inoremap <Up> <C-O>gk
"inoremap <Down> <C-O>gj
" inoremap <Tab> <C-t>
" inoremap <S-Tab> <C-d>

"----------------------------------------------------------------------------
" vim-easymotion
"-----------------------------------------------------------------------------
" s{char}{char} to move to {char}{char}
map <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

"-----------------------------------------------------------------------------
" Emmet
"-----------------------------------------------------------------------------
let g:user_emmet_leader_key=','












set nobackup "ファイル保存時にバックアップファイルを作らない
set noswapfile "ファイル編集中にスワップファイルを作らない
set hlsearch "検索文字列をハイライトする
set ignorecase "大文字と小文字を区別しない
set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set mouse=a " マウスの入力を受け付ける

let mapleader = "\<Space>" " リーダーキーの設定
set clipboard+=unnamed "クリップボードにコピー

"-----------------------------------------------------------------------------
" Remap key biding
"-----------------------------------------------------------------------------
" jj連打でescape
inoremap <silent> jj <ESC>
" Space押しながらwで保存して閉じる
nnoremap <Leader>w :wq<CR>
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

"-----------------------------------------------------------------------------
" Emmet
"-----------------------------------------------------------------------------
let g:user_emmet_leader_key=','

"-----------------------------------------------------------------------------
" Dein
"-----------------------------------------------------------------------------
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

let s:toml_dir = expand('~/.vim/rc')
"dein settings
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

   "Load TOML
    let s:toml = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

   "finalize
    call dein#end()
    cll dein#save_state()
endif

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}



"------------------------------------------------------------------------------
" Color scheme
"------------------------------------------------------------------------------

syntax on
colorscheme molokai

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
a






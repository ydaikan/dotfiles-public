" Define mappings
"cnoreabbrev sf Defx -listed -new
"      \ -columns=indent:mark:icon:icons:filename:git:size
"      \ -buffer-name=tab`tabpagenr()`<CR>

 "【sf】ファイルツリー起動
nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>

" 不明
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

" 不明
autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
    
"-----------------------------------------------------------------------------
" よく使うコマンド達 Define mappings
"-----------------------------------------------------------------------------
    "【Enter】【l】ファイルを開く 
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
    nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')

    "【E】ファイルを開く（ファイルツリーはそのまま）
    nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')

    "【h】一つ前のディレクトリに戻る
    nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])

    "【q】やめる
    nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')

    "【c】コピー 
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  
    "【m】ファイルを移す
    nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  
    "【p】ペースト 
    nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  
    "【d】削除
    nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  
    "【r】リネーム  
    nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  
    "【o】ディレクトリツリーの開閉 
    nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  
    "【K】新規作成（ディレクトリ）
    nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  
    "【N】新規作成（ファイル）
    nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  
    "【yy】パスのコピー
    nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  
    "【;】同じ動作を繰り返す
    nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  
"-----------------------------------------------------------------------------
" あまり使わないコマンド達
"-----------------------------------------------------------------------------
    "vimバインド 
    nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  
    "vimバインド
    nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'

    "ホームディレクトリに戻る
    nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')

"-----------------------------------------------------------------------------
" Takuyaさんの参考にしたがほぼ使ってない
"-----------------------------------------------------------------------------
    "【P】ファイルを開く 
    nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')

    "？
    nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  
    "【C】更新時間を確認する？
    nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  
    "？
    nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  
    "？
    nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  
    "？
    nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')

    "？ 
    nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')

    "？
    nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  
    "？ 
    nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')

    "？
    nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  
    "？
    nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  
    "？
    nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

"-----------------------------------------------------------------------------
" アイコン設定
"-----------------------------------------------------------------------------

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

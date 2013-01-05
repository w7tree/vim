" change leader key bind
let mapleader = ","
"let mapleader = "\"

"--------------------------------------------------
" プラグイン管理-NeoBundleの設定
"--------------------------------------------------

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" プラグインリスト
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'https://github.com/tpope/vim-repeat'
" NeoBundle 'https://github.com/kana/vim-textobj-user'
" NeoBundle 'https://github.com/kana/vim-textobj-fold'
" NeoBundle 'https://github.com/kana/vim-textobj-indent'
" NeoBundle 'https://github.com/kana/vim-textobj-lastpat'
" NeoBundle 'https://github.com/thinca/vim-guicolorscheme'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/thinca/vim-ref'
NeoBundle 'https://github.com/thinca/vim-quickrun'
NeoBundle 'https://github.com/yuratomo/w3m.vim.git'
" NeoBundle 'https://github.com/tsukkee/unite-tag'
" NeoBundle 'taglist.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'matchit.zip'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle 'ruby.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'ruby-matchit'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/urilib.vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'motemen/git-vim.git'
NeoBundle 'Markdown'
" NeoBundle 'AtsushiM/sass-compile.vim'

" from ishi
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'ujihisa/neco-ruby'
" NeoBundle 'taichouchou2/vim-rsense.git'
" NeoBundle 'ujihisa/neco-rubymf'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'basyura/unite-rails'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'taq/vim-rspec'
" NeoBundle 'taichouchou2/alpaca_complete.git'

" " rails-best-practice
" NeoBundle 'taichouchou2/unite-rails_best_practices',
"       \{  'depends' : [ 'Shougo/unite.vim', 'romanvbabenko/rails.vim' ] }
" " unite-reek
" NeoBundle 'taichouchou2/unite-reek'

filetype plugin on
filetype indent on

"--------------------------------------------------
" zen-codingの設定"{{{
"--------------------------------------------------

" zen-codingの展開を<C-z>のみで発動するようにする
" let g:user_zen_expandabbr_key = '<c-z>'

" 展開するHTMLの言語を設定
" let g:user_zen_settings = {'lang' : 'ja'}

" railsのテンプレートで使う<%= %>タグのzen-codingスニペットを追加
let g:user_zen_settings = {
\ 'lang' : 'ja',
\ 'html' : {
\  'snippets' : {
\   'r' : "<% ${cursor}${child} %>",
\   'rr' : "<%= ${cursor}${child} %>",
\   'php' : "<?php ${cursor}${child} ?>",
\   'pe' : "<?php echo ${cursor}${child}; ?>",
\  },
\ },
\}"}}}

"--------------------------------------------------
" vimshellの設定"{{{
"--------------------------------------------------

" ノーマルモードで起動するためのエイリアス
nnoremap <silent> vs :VimShell<CR>

" シェルコマンドのパスを通す:注-コピペ設定
let $PATH = $VIM.'\bin'.';'.$PATH
"}}}

"--------------------------------------------------
" neocomplecacheの設定"{{{
"--------------------------------------------------
" AutoComplPopを無効化
let g:acp_enableAtStartup = 0

" neocomplcacheを起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字小文字を区別しない
let g:neocomplcache_enable_smart_case = 1

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20

"}}}

"--------------------------------------------------
" ref.vimの設定:一部停止中"{{{
"--------------------------------------------------

" w3mを使えるようにする
let $PATH = $PATH . ':/usr/local/bin'

" phpmanual
" let g:ref_phpmanual_path = $HOME . '/.vim/refdoc/php-chunked-xhtml/'
" let g:ref_phpmanual_cmd = 'w3m -dump %s'

" レファレンス起動のショートカット
nnoremap <C-o> :Ref<space>

" 英辞郎alcで検索のショートカット
nnoremap <leader>u :W3m alc<space>
"}}}

"--------------------------------------------------
" ctags関連の設定(停止中)"{{{
"--------------------------------------------------

" ctagsでホームディレクトリまで遡ってタグを探す設定
" set tags+=tags;**/tags
" if filereadable(expand('~/rtags'))
"   au FileType ruby,eruby setl tags+=~/rtags
"   au FileType ruby,eruby setl tags+=~/gemtags
" endif
"}}}

"--------------------------------------------------
" vimfiler関連の設定"{{{
"--------------------------------------------------

" キーマップを設定
nnoremap <Leader>, :VimFiler<CR>"}}}

"--------------------------------------------------
" unite関連の設定"{{{
"--------------------------------------------------

" 入力モードで開始する
let g:unite_enable_start_insert=1

" キーマップ：バッファ一覧
nnoremap <C-p> :Unite buffer<CR>

" キーマップ；ファイル一覧
nnoremap <C-n> :Unite -buffer-name=file file<CR>

" キーマップ：最近使ったファイルの一覧
nnoremap <C-z> :Unite file_mru<CR>

" キーマップ：uniteでタグリスト
nnoremap <C-c> :Unite tag:"}}}

"--------------------------------------------------
" QuickRun関連の設定"{{{
"--------------------------------------------------

" ショートカット用キーマップ
nnoremap <leader>q :QuickRun

" markdown compile
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
\ 'command': 'bluecloth',
\ 'exec': '%c -f %s'
\ }"}}}

"--------------------------------------------------
" ruby.vim関連の設定"{{{
"--------------------------------------------------
" コードの折りたたみが可能に
" let ruby_fold = 1

" Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1"}}}


"--------------------------------------------------
" coffee.vim関連の設定"{{{
"--------------------------------------------------
"
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" quickrunの起動でjsにコンパイルされたファイルを見る設定
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}"}}}


"--------------------------------------------------
" Rsense"{{{
"--------------------------------------------------

" let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = expand('~/.vim/rsense')
"
" function! SetUpRubySetting()
" nnoremap <buffer>rj :RSenseJumpToDefinition<CR>
" nnoremap <buffer>rk :RSenseWhereIs<CR>
" nnoremap <buffer>rh :RSenseTypeHelp<CR>
" endfunction
" autocmd FileType ruby,eruby call SetUpRubySetting()"}}}

"--------------------------------------------------
" open-browser"{{{
"--------------------------------------------------
" open url on cursor
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)

"google some word
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>"}}}


"--------------------------------------------------
" vim-browserreload-mac"{{{
"--------------------------------------------------
let g:returnApp = "iTerm"
nnoremap <Space>bc :ChromeReloadStart<CR>
nnoremap <Space>bC :ChromeReloadStop<CR>
nnoremap <Space>bf :FirefoxReloadStart<CR>
nnoremap <Space>bF :FirefoxReloadStop<CR>
nnoremap <Space>bs :SafariReloadStart<CR>
nnoremap <Space>bS :SafariReloadStop<CR>
" nmap <Space>bo :OperaReloadStart<CR>
" nmap <Space>bO :OperaReloadStop<CR>
nnoremap <Space>ba :AllBrowserReloadStart<CR>
nnoremap <Space>bA :AllBrowserReloadStop<CR>"}}}

"------------------------------------
" sass-compile.vim"{{{
"------------------------------------
" let g:sass_compile_auto = 1
" let g:sass_compile_cdloop = 5
" let g:sass_compile_cssdir = ['css', 'stylesheet']
" let g:sass_compile_file = ['scss', 'sass']
" let g:sass_started_dirs = []
"
" autocmd FileType less,sass setlocal sw=2 sts=2 ts=2 et
" au! BufWritePost * SassCompile"}}}

"--------------------------------------------------
" gist-vim
"--------------------------------------------------
" let g:gist_use_password_in_gitconfig = 1

"--------------------------------------------------
" 基本の設定
"--------------------------------------------------

" vi互換にしない(whichwrapを有効にするためには必須らしい)
set nocompatible

" シンタックスカラー
syntax on

" カーソル行の強調(太字にすることで光っているように見える)
set cursorline
highlight CursorLine cterm=bold ctermbg=black

" 行番号の表示
set number

" タイトルを表示
set title

" バックスペースの拡張
set backspace=indent,eol,start

" ステータスラインを常に表示
set laststatus=2

" ステータスラインの表示項目()
set statusline=%F%r%h%=%l行|

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" カーソルが行頭/末にある時に前/次行に移動できるように
set whichwrap=b,s,h,l,<,>,[,]

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" 全角スペースを目立たせる(赤い下線+グレー)
highlight ZenkakuSpace cterm=underline ctermfg=red ctermbg=lightgray
match ZenkakuSpace /　/

" ノーマルモードでも改行できるようにする
" nnoremap <CR> o<Esc>

" ビジュアルモードにおける複数回インデントへの対応
vnoremap < <gv
vnoremap > >gv

" swapファイル(*.swp)は「~/.vim/swap/」に保存
set directory=~/.vim/swap/

" backupファイル(*~)は「~/.vim/backup/」に保存
set backupdir=~/.vim/backup/

" コードの折りたたみにマークを挿入する
set foldmethod=marker

"クリップボードをWindowsと連携
set clipboard=unnamed

"--------------------------------------------------
" タブに関する設定
"--------------------------------------------------

" autoindentを有効にする
set autoindent

" 新しい行のインデントを現在行と同じ量に
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
" set smarttab

" タブ文字の大きさ
" set tabstop=4
set tabstop=2

" オートインデントのサイズ（基本的に上記と一致させる）
" set softtabstop=4
set softtabstop=2

" インデント幅
" set shiftwidth=4
set shiftwidth=2

" タブはスペースとして認識させる（タブではない）
" set noexpandtab
set expandtab

" タブを可視化
set list
set lcs=tab:␣␣
" set lcs=tab:>.,eol:$,trail:_,extends:\

" タブの設定をファイル全体に反映
retab

" markdown関連のファイルではタブ数を4に
au BufNewFile,BufRead *.md set nowrap tabstop=4 softtabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.mkd set nowrap tabstop=4 softtabstop=4 shiftwidth=4 expandtab


" html/cssはタブをタブとして認識
" au BufNewFile,BufRead *.html set nowrap noexpandtab
" au BufNewFile,BufRead *.css set nowrap noexpandtab


"--------------------------------------------------
" 検索・置換の設定
"--------------------------------------------------

" インクリメント検索を有効にする
set incsearch

" 検索/置換の際に大文字/小文字を区別しない
set ignorecase

" 検索が末尾までいったら先頭へと戻る
set wrapscan

" 検索のハイライトを<C-j>２回で解除
nnoremap <C-j><C-j> :nohlsearch<CR><Esc>

" 検索結果に移動した時その位置を画面の中央にする
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"--------------------------------------------------
" キーバインドの変更
"--------------------------------------------------
" USキーボード設定
noremap ; :
noremap : ;

" 基本の移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <C-e> <End>
inoremap <C-e> <End>
xnoremap <C-e> <End>
nnoremap <C-a> <Home>
inoremap <C-a> <Home>
xnoremap <C-a> <Home>

" 単語単位の移動
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b

" 画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Delキーの追加
nnoremap <C-d> <Del>
inoremap <C-d> <Del>

" insertでもアンドゥ
" inoremap <C-u> <C-o>u

" insertでもリドゥ
" inoremap <C-r> <C-o><C-r>

" ESCの変更
inoremap jj <ESC>
inoremap <C-f> <ESC>
vnoremap <C-j> <esc>

" 改行挿入-移動なし
" inoremap <C-f> <C-o>O

" 検索
" inoremap <C-_> <C-o>/

" ビジュアルモードでのインデントを<tab>でもできるようにする
xnoremap <TAB> >
xnoremap <S-TAB> <

" tmuxのキーバインド用に<C-t>の設定を削除
noremap <C-t> <ESC>
noremap! <C-t> <ESC>

"--------------------------------------------------
" 引用符等の設定
"--------------------------------------------------
" カッコやクオートなどを入力した際に左に自動で移動します
" inoremap {} {}<Left>
" inoremap [] []<Left>
" inoremap () ()<Left>
" inoremap "" ""<Left>
" inoremap '' ''<Left>
" inoremap <> <><Left>


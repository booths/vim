" 插件开始的位置
call plug#begin('~/.vim/plugged')

Plug 'ludovicchabant/vim-gutentags'

" 注释插件
Plug 'scrooloose/nerdcommenter'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plug 'ycm-core/YouCompleteMe'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
" Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'preservim/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" 下面两个插件要配合使用，可以自动生成代码块
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }

" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'

" 可以在 vim 中使用 tab 补全
"Plug 'vim-scripts/SuperTab'

" 可以在 vim 中自动完成
"Plug 'Shougo/neocomplete.vim'


" 插件结束的位置，插件全部放在此行上面
call plug#end()

" YCM peizhi
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "python":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }


autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype sh setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yml setlocal tabstop=2 shiftwidth=2 softtabstop=2

map <silent><F8> :NERDTree<CR>
map <silent><F9> :NERDTreeClose<CR>
map <leader>r :NERDTreeFind<cr>
map <leader>e :NERDTreeToggle<cr>
map <leader>y "+y<cr>
map <leader>p "+p<cr>
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_width=25
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i
:inoremap < <><Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i
map <left> <c-w>h
map <right> <c-w>l
map <leader>, <c-w><
map <leader>. <c-w>>
nmap - :bp<cr>
nmap = :bn<cr>
nmap \ :vsp<cr>
set hlsearch
set cursorline
highlight Search ctermfg=17 ctermbg=40 guifg=#00005f guibg=#00d700
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1



" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

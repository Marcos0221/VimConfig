" 设置显示行号
set nu

" 设置不自动换行
set nowrap

" 设置tab=4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 设置取消自动备份
set nobackup

" 插件配置
call plug#begin('~/.config/nvim/plugged')

" lsp插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nvim主题插件
Plug 'morhetz/gruvbox'

" 状态栏插件
Plug 'vim-airline/vim-airline'

" Java 开发者的最爱 Getter and Setter
Plug 'dinduks/vim-java-get-set'

call plug#end()

" 配置主题文件
colorscheme gruvbox

" 永远显示状态栏
set laststatus=2

" 回车补全
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" 使用 K 查看文档
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

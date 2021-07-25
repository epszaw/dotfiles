let g:config_root_path = stdpath('config')
let g:config_files = [
	\ 'plugins.vim',
	\ 'settings.vim',
	\ 'keymap.vim']

for f in g:config_files
    execute 'source ' . g:config_root_path. '/' . f
endfor

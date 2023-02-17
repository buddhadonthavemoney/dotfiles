let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'b': '~/.config/bspwm/bspwmrc' },
            \ { 'p': '~/.config/polybar/config' },
            \ { 's': '~/.config/sxhkd/sxhkdrc' },
            \ { 'k': '~/.config/kitty/kitty.conf' },
            \ { 'r': '~/.config/ranger/rc.conf' },
            \ { 'dj': '~/Code/project/odyssey/odyssey_django/' },
            \ { 'n': '~/.notable/notes/School.md'},
            \ '~/Code',
            \ '/opt/miscellaneous',
            \ ]
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'

let s:footer = [
      \ '                      / /    ___ | |_ ( ) ___  | |_ | |__  (_) _ __  | | __  ',
      \ '                     / /    / _ \| __||/ / __| | __|| |_ \ | || |_ \ | |/ /  ',
      \ '                    / /___ |  __/| |_    \__ \ | |_ | | | || || | | ||   <   ',
      \ '                    \____/  \___| \__|   |___/  \__||_| |_||_||_| |_||_|\_\  ',
      \ '                                                                             ',
      \ '',
      \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_footer = s:center(s:footer)


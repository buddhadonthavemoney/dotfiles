vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_lists = {
  { type = 'files',     header = {'   Files'} },
  { type = 'sessions',  header = {'   Sessions'} },
  { type = 'bookmarks', header = {'   Bookmarks'} },
}
vim.g.startify_bookmarks = {
  { i = '~/.config/nvim/init.lua' },
  { z = '~/.zshrc' },
  { b = '~/.config/bspwm/bspwmrc' },
  { p = '~/.config/polybar/config' },
  { s = '~/.config/sxhkd/sxhkdrc' },
  { k = '~/.config/kitty/kitty.conf' },
  { r = '~/.config/ranger/rc.conf' },
  { dj = '~/Code/project/odyssey/odyssey_django/' },
  { n = '~/Notes/School.md' },
  '~/Code',
  '/opt/miscellaneous',
}

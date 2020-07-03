" External Tools
if ! has('win32') && ! has('win64')
  " Check if ranger is installed and if not install it
  if ! executable('ranger')
    silent :exe '!pip3 install --user ranger-fm'
  endif
endif

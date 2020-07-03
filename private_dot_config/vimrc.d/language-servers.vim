if ! has('win32') && ! has('win64')
  let languageServersPath=expand('$HOME/.local/share/language-servers')
  if ! isdirectory(languageServersPath)
    silent call mkdir(languageServersPath, "p")
  endif

  " Puppet Language Server
  let puppetLanguageServerPath=languageServersPath . '/puppet-editor-services'
  if ! isdirectory(puppetLanguageServerPath)
    if executable('git')
      silent :exe '!git clone https://github.com/lingua-pupuli/puppet-editor-services.git ' . puppetLanguageServerPath
    endif
  endif
endif

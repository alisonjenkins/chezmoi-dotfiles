" Setting up vim plug"{{{
let vimPlugNOTInstalled=1
let vimPlugURI='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after/

  let vimplugpath=expand('$HOME/.vim/autoload/plug.vim')
  if !filereadable(vimplugpath)
    echo "Installing vim-plug.."
    echo ""
    silent :exe '!mkdir -p ' . $HOME .'\.vim\autoload'
    silent :exe "!powershell -command \"(New-Object Net.WebClient).DownloadFile(\\\"" . vimPlugURI . "\\\", \\\"" . vimplugpath . "\\\")\""
    let vimPlugNOTInstalled=0
  endif
else
  let vimplugpath=expand('~/.vim/autoload/plug.vim')
  if !filereadable(vimplugpath)
    echo "Installing vim-plug.."
    echo ""
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vimPlugNOTInstalled=0
  endif
endif "}}}

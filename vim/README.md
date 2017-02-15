## Requirements
- ctags (yum install ctags on redhat based systems)
- vim must be compiled with perl & python (in order to use gundo)
  - ./configure --enable-perlinterp --enable-pythoninterp

### On OSX, use <a href="http://mxcl.github.com/homebrew/">homebrew</a> to install vim (terminal & gui):

    brew install ctags
    brew install macvim --override-system-vim

## Install

    git clone git://github.com/tempire/dotvim.git .vim
    cd .vim
    ln -s ~/.vim/vimrc ~/.vimrc

### Install Vundle

  git
  clone
  https://github.com/gmarik/Vundle.vim.git
  ~/.vim/bundle/Vundle.vim

### Install other plugins using vundle

  Open up vim, type :BundleInstall


### If you're using Haskell...

    cabal install ghc-mod # Install cabal

    cd $HOME/.vim/bundle/vimproc
    make -f make_mac.mak # For Mac (use appropriate file for platform)


## Customization

    ~/.vim/vimrc.$USER

If your shell login is *purl*, create the file *~/.vim/vimrc.purl*.

All custom vim configuration will override the dotvim defaults.

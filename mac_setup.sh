ln -sv .bash_profile ~/.bash_profile
ln -sv .zshrc ~/.zshrc
ln -sv .zshenv ~/.zshenv
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade
brew install nvim
ln -sv init.vim ~/.config/nvim/init.vim

brew install --cask visual-studio-code
ln -sv settings.json "~/Library/Application Support/Code/User/settings.json"

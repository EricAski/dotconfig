brew update

# Install base packages if needed
brew install curl wget
 
# Clone repo
setopt glob_dots null_glob
mkdir -p ~/.config
git clone ssh://git@github.com/EricAski/dotconfig.git ~/temp_config
mv ~/temp_config/* ~/.config/
rm -rf ~/temp_config

# Create symlinks
ln -s ~/.config/zsh/zshrc ~/.zshrc
ln -s ~/.config/zsh/zshenv ~/.zshenv
ln -s ~/.config/zsh/p10k.zsh ~/.p10k.zsh

 # Create zshenv if it doesn't exist
ls ~/.config/zsh/zshenv || (touch ~/.config/zsh/zshenv)


# Install autojump (J command)
brew install autojump

# Install atuin (shell history manager, CTRL+R)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh && atuin import auto

# Install Antigen (ZSH package manager)
mkdir -p ~/.config/zsh && curl -L git.io/antigen > ~/.config/zsh/antigen.zsh


# Install neovim
brew install neovim

# Install Zellij (tmux alternative)
brew install zellij

# Install lsd (ls replacement)
brew install lsd
 
# Install bat (cat replacement)
apt install bat

# install aws-cli
brew install awscli

# install kitty (nice terminal)
brew install --cask kitty

zsh && source ~/.zshrc

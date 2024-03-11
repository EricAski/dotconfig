# Clone repo
mkdir -p .config
git clone https://github.com/EricAski/dotconfig.git ~/temp_config
mv ~/temp_config/ ~/.config:
rm -rf ~/temp_config

# Create symlinks
ln -s ~/.config/zsh/zshrc ~/.zshrc && ln -s ~/.config/zsh/zshenv ~/.zshenv
ln -s ~/.config/zsh/p10k.zsh ~/.p10k.zsh

 # Create zshenv if it doesn't exist
ls ~/.config/zsh/zshenv || (touch ~/.config/zsh/zshenv)

# Install base packages if needed
apt install curl wget git

# Install autojump (J command)
apt install autojump

# Install atuin (shell history manager, CTRL+R)
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh) && atuin import auto

# Install Antigen (ZSH package manager)
mkdir -p ~/.config/zsh && curl -L git.io/antigen > ~/.config/zsh/antigen.zsh


# Install zsh
apt install zsh
# Set zsh to default shell
chsh -s $(which zsh)

# Install Zellij (tmux alternative)
mkdir -p ~/.local/bin && cd ~/.local/bin && wget https://github.com/zellij-org/zellij/releases/download/v0.39.2/zellij-x86_64-unknown-linux-musl.tar.gz && tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz && chmod +x zellij && rm -rf zellij-x86_64-unknown-linux-musl.tar.gz && cd -

# install lsd (ls replacement)
apt install lsd


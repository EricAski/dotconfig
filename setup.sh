apt update -y

# Install base packages if needed
apt install -y curl wget git build-essential unzip
 
# Clone repo
mkdir -p ~/.config
git clone https://github.com/EricAski/dotconfig.git ~/temp_config
mv ~/temp_config/* ~/.config/
rm -rf ~/temp_config

# Create symlinks
ln -s ~/.config/zsh/zshrc ~/.zshrc
ln -s ~/.config/zsh/zshenv ~/.zshenv
ln -s ~/.config/zsh/p10k.zsh ~/.p10k.zsh

 # Create zshenv if it doesn't exist
ls ~/.config/zsh/zshenv || (touch ~/.config/zsh/zshenv)


# Install autojump (J command)
apt install -y autojump

# Install atuin (shell history manager, CTRL+R)
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh) && atuin import auto

# Install Antigen (ZSH package manager)
mkdir -p ~/.config/zsh && curl -L git.io/antigen > ~/.config/zsh/antigen.zsh


# Install neovim
apt install -y software-properties-common
add-apt-repository -y ppa:neovim-ppa/unstable # Only old versions are on stable
apt install -y neovim
nvim --headless "+Lazy! sync" +qa

# Install zsh
apt install -y zsh
# Set zsh to default shell
chsh -s $(which zsh)

# Install Zellij (tmux alternative)
mkdir -p ~/.local/bin && cd ~/.local/bin && wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz && tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz && chmod +x zellij && rm -rf zellij-x86_64-unknown-linux-musl.tar.gz && cd -

# Install lsd (ls replacement)
cd ~/.local/bin && wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz && tar -xvf lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz && chmod +x  lsd-v1.0.0-i686-unknown-linux-gnu/lsd && cp lsd-v1.0.0-i686-unknown-linux-gnu/lsd . && cd - 

# Install bat (cat replacement)
apt install bat

# install aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


zsh && source ~/.zshrc

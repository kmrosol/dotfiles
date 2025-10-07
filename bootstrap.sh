#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"
PACKER_NVIM_DIR="$HOME/.local/share/nvim/site/pack/packer/opt"
STOW_PACKAGES_PATH=$DOTFILES_DIR/packages

# =============================
# Clone dotfiles Repository
# =============================
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone git@github.com:kmrosol/dotfiles.git "$DOTFILES_DIR"
else
    echo "Skipping cloning dotfiles. It already exists."
fi

# =============================
# Set up Homebrew
# =============================
if ! command -v brew &> /dev/null ; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installation completed."
else
    echo "Skipping install of Homebrew. It is already installed."
fi

# Install apps using Homebrew Bundle
echo "Installing applications from Brewfile..."
brew bundle -v --file=$DOTFILES_DIR/packages/brew/Brewfile
echo "Application installation completed."

# =============================
# Link configs
# =============================
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

echo "Linking configs..."
stow --ignore=DS_Store -v -d $STOW_PACKAGES_PATH -t ~ $(ls $STOW_PACKAGES_PATH)

# =============================
# Setup development tools
# =============================
echo "Setting up development tools..."

# Install packer.nvim
if [ ! -d $PACKER_NVIM_DIR ]; then
    echo "Installing packer.nvim..."
    git clone https://github.com/wbthomason/packer.nvim \
        $PACKER_NVIM_DIR
else
    echo "packer.nvim is already installed."
fi

# =============================
# Install runtimes
# =============================
if command -v mise &> /dev/null; then
    echo "Setting up mise tools..."

    # Install tools defined in mise.toml or .mise.toml
    if [ -f ~/.config/mise/config.toml ] ; then
        echo "Installing tools from mise configuration..."
        mise install

        # Activate mise to update PATH
        eval "$(mise activate zsh)"
    else
        echo "No mise configuration found, skipping tool installation."
    fi
else
    echo "mise not available, skipping mise setup."
fi

# Install python provider for neovim
pip install pynvim

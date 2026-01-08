#!/bin/bash


echo "🚀 Starting Developer Environment Setup..."

if ! command -v brew &> /dev/null; then
    echo "🚀 Installing Homebrew (The Universal Layer)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


echo "🛠️ Installing Resume Tools (Node, Docker, Postman)..."
brew install node@20 nvm yarn pnpm git-delta
brew install visual-studio-code postman docker docker-compose
brew install mongodb-community postgresql@16 redis awscli gh


echo "🐚 Refreshing Terminal Aliases..."
curl -o ~/.zshrc https://raw.githubusercontent.com/msami625/dotfiles/main/.zshrc


sudo usermod -aG docker $USER
echo "✅ Setup Complete. Restart your terminal and log in to sync."
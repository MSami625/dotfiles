#!/usr/bin/env bash
set -eo pipefail

echo "=================================================="
echo "🚀 Starting Full-Stack Dev Environment Setup"
echo "=================================================="

# OS Detection
if [ -f /etc/manjaro-release ]; then
    DISTRO="Manjaro"
else
    DISTRO="Linux"
fi

# 1. Native Packages & Tools
if [ "$DISTRO" == "Manjaro" ]; then
    echo "📦 Updating Pacman & installing core packages..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm \
        base-devel git curl wget git-delta \
        docker docker-compose postgresql-libs \
        python python-pip dbeaver code zsh

    sudo systemctl enable --now docker.service || true

    if ! command -v yay &> /dev/null; then
        echo "Installing yay (AUR helper)..."
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
        rm -rf /tmp/yay
    fi

    echo "Installing Cursor IDE..."
    yay -S --needed --noconfirm cursor-bin

    sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf
fi

# 2. Homebrew (Cross-Linux Package Manager)
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to path for the rest of the script
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# 3. Node.js, NVM, and Web Tooling (Next.js, Prisma, Cloudflare Workers)
if [ ! -d "$HOME/.nvm" ]; then
    echo "⚡ Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if command -v nvm &> /dev/null; then
    echo "⚡ Provisioning Node.js LTS and web CLI tools..."
    nvm install --lts
    nvm use --lts
    npm install -g pnpm yarn typescript ts-node prisma  wrangler @angular/cli
fi

# 4. Python Backend Environment (FastAPI)
if command -v python3 &> /dev/null; then
    echo "🐍 Installing Python backend packages..."
    python3 -m pip install --upgrade pip --quiet
    pip install --user virtualenv fastapi uvicorn poetry --quiet
fi

# 5. Configure IDE Extensions
EXTENSIONS=(
    "dbaeumer.vscode-eslint"
    "esbenp.prettier-vscode"
    "ms-python.python"
    "ms-vscode.cpptools"
    "prisma.prisma"
    "eamodio.gitlens"
)

for ext in "${EXTENSIONS[@]}"; do
    command -v code &> /dev/null && code --install-extension "$ext" --force || true
    command -v cursor &> /dev/null && cursor --install-extension "$ext" --force || true
done

echo "=================================================="
echo "✅ Linux Environment Setup Complete!"
echo "=================================================="

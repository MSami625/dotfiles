# 🚀 Dotfiles & Dev Environment Setup

This repository contains automated bootstrap scripts to instantly provision a production-ready, full-stack development machine from scratch. 

It is designed to be completely idempotent and requires zero manual intervention during execution.

## 🛠️ Stack & Tooling Included

* **Core Systems:** Git, Docker Desktop / Docker Engine, PostgreSQL libs
* **Languages & Runtimes:** Node.js (via NVM), Python 3.11, C++ (GCC/MinGW)
* **Web Tooling:** `pnpm`, `yarn`, `typescript`, `prisma`, `@angular/cli`, Vercel CLI, Cloudflare Wrangler
* **Backend Tooling:** `fastapi`, `uvicorn`, `virtualenv`, `poetry`
* **Applications:** VS Code, Cursor, DBeaver, `git-delta`
* **OS Tweaks:** Debloats Windows pre-installed apps, configures dark mode, and optimizes Linux pacman downloads.

---

## ⚡ Installation (One-Click Setup)

Choose the command for your operating system. Open a fresh terminal and paste the command below.

### 🐧 Linux (Manjaro / Ubuntu)
Open your standard terminal and run:

```bash
curl -fsSL [https://raw.githubusercontent.com/msami625/dotfiles/main/bootstrap.sh](https://raw.githubusercontent.com/msami625/dotfiles/main/bootstrap.sh) | bash


```🪟 Windows 10 / 11
Open PowerShell as Administrator and run:
Set-ExecutionPolicy Bypass -Scope Process -Force; iex (New-Object System.Net.WebClient).DownloadString('[https://raw.githubusercontent.com/msami625/dotfiles/main/setup.ps1](https://raw.githubusercontent.com/msami625/dotfiles/main/setup.ps1)')

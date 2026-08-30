# 🚀 My Dev Environment Setup (Dotfiles)

I got tired of spending hours configuring a new laptop from scratch, so I built these scripts to automate the whole process. 

Whether I'm on Linux or Windows, running one command sets up my entire full-stack dev environment—installing my favorite tools, pulling down my configs, and even tweaking the OS to get the junk out of the way. You can run these safely multiple times; they skip whatever is already installed.

## 🛠️ What's in the box?

Here is what gets installed and configured automatically:

*   **The Core:** Git, Docker (Engine/Desktop), and PostgreSQL libs.
*   **Languages & Runtimes:** Node.js (via NVM), Python 3.11, and C++ (GCC/MinGW).
*   **Web & Edge:** `pnpm`, `yarn`, `typescript`, `prisma`, `@angular/cli`, plus the Vercel and Cloudflare Wrangler CLIs.
*   **Backend & Data:** `fastapi`, `uvicorn`, `virtualenv`, and `poetry`.
*   **My Daily Drivers:** VS Code, Cursor, DBeaver, and `git-delta`.
*   **OS Tweaks:** Strips out Windows bloatware (bye, Candy Crush), forces dark mode, and speeds up Linux `pacman` downloads.

---

## ⚡ One-Click Installation

Got a fresh machine? Just open a terminal and run the command for your OS. 

### 🪟 Windows 10 / 11
Open PowerShell as Administrator and paste:

Set-ExecutionPolicy Bypass -Scope Process -Force; iex (New-Object System.Net.WebClient).DownloadString('[https://raw.githubusercontent.com/msami625/dotfiles/main/setup.ps1](https://raw.githubusercontent.com/msami625/dotfiles/main/setup.ps1)')


### 🐧 Linux (Manjaro / Ubuntu)
Open your standard terminal and paste:

```bash
curl -fsSL [https://raw.githubusercontent.com/msami625/dotfiles/main/bootstrap.sh](https://raw.githubusercontent.com/msami625/dotfiles/main/bootstrap.sh) | bash


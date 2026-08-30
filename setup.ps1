$ErrorActionPreference = "Stop"

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "🚀 Starting Windows Dev Environment Setup" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

# 1. Install Developer Applications
$packages = @(
    "Microsoft.VisualStudioCode",
    "Anysphere.Cursor",
    "dbeaver.dbeaver",
    "Docker.DockerDesktop",
    "Git.Git",
    "dandavison.delta",
    "Python.Python.3.11",
    "OpenJS.NodeJS.LTS"
)

Write-Host "📦 Installing System Applications via Winget..." -ForegroundColor Yellow
foreach ($pkg in $packages) {
    Write-Host "Installing $pkg..."
    winget install --id $pkg -e --source winget --accept-package-agreements --accept-source-agreements --silent
}

# 2. Update Environment Variables to use Node immediately
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 3. Web & Edge Tooling (Next.js, Prisma, Vercel, Wrangler)
Write-Host "⚡ Installing TypeScript, Prisma, and Cloudflare Edge Tooling..." -ForegroundColor Yellow
npm install -g pnpm yarn typescript ts-node prisma vercel wrangler @angular/cli

# 4. Windows UI Optimizations & Bloatware Cleanup
Write-Host "⚙️ Applying Windows System Tweaks..." -ForegroundColor Yellow
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0

Write-Host "🧹 Debloating pre-installed packages..." -ForegroundColor Yellow
$bloatware = @('*bing*', '*zune*', '*solitaire*', '*tiktok*', '*instagram*', '*facebook*')
foreach ($app in $bloatware) {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Write-Host "==================================================" -ForegroundColor Green
Write-Host "✅ Windows Environment Setup Complete! Restart your computer." -ForegroundColor Green

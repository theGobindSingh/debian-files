#!/bin

# Define a flag file path
FLAG_FILE="/tmp/wsl_restart_flag"

# Check if the flag file exists
if [ ! -f "$FLAG_FILE" ]; then
  # Initial setup commands
  touch ~/.hushlogin
  sudo touch /etc/wsl.conf
  sudo sh -c 'echo -e "[boot]\nsystemd=true\n\n[network]\ngenerateResolvConf=false" > /etc/wsl.conf'
  sudo dpkg --add-architecture i386

  # Create the flag file to indicate initial setup is complete
  touch "$FLAG_FILE"

  # Signal PowerShell to restart WSL
  echo "Please restart WSL and run this script again..."
  exit 0
fi

# If the flag file exists, continue with the remaining commands after the restart
sudo apt upgrade -y 
sudo apt update -y
sudo apt upgrade -y 
sudo apt update -y
sudo sh -c 'echo -e "[Resolve]\nDNS=1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com 2606:4700:4700::1111#cloudflare-dns.com 2606:4700:4700::1001#cloudflare-dns.com
\nFallbackDNS=8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8888#dns.google 2001:4860:4860::8844#dns.google" >> /etc/systemd/resolved.conf'
sudo systemctl restart systemd-resolved.service
sudo apt install x11-apps -y
code .

# zsh
sudo apt install zsh -y
chsh -s $(which zsh)
source ~/.zshrc
echo "ZSH Installed!"

git config --global user.name "theGobindSingh"
git config --global user.email thesinghgobind@gmail.com

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
echo -c 'export ZSH="$HOME/.oh-my-zsh"\nZSH_THEME="steeef"\nplugins=(git sudo web-search pass nvm node qrcode)\nexport NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && \\. "$NVM_DIR/nvm.sh"  # This loads nvm\n[ -s "$NVM_DIR/bash_completion" ] && \\. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion\nalias goto-nginx="cd /home/linuxbrew/.linuxbrew/etc/nginx/"\nalias kuru="~/.kuru/index.zsh"\nalias please-stop="~/.pleasestop/index.zsh"\nsource $ZSH/oh-my-zsh.sh' >> ~/.zshrc
source ~/.zshrc
nvm install --lts
echo "NVM Installed!"

# pulseaudio
sudo apt install pulseaudio pavucontrol -y
echo "Pulseaudio Installed!"

# sox
sudo apt install sox -y
sudo apt install libsox-fmt-all -y
echo "Sox Installed!"

# Clean up the flag file at the end (optional)
rm "$FLAG_FILE"
echo "Setup Complete"
#!/bin/bash
set -e

# PyDeploy CLI v1.0 install.sh
# MIT License: Copyright (c) 2026 Kevin de 3ngineer

echo "===================================="
echo "   Installing PyDeployCLI v1"
echo "===================================="
echo ""

# Check for Debian-based system
if ! command -v apt >/dev/null 2>&1; then
    echo "This installer only supports Raspberry Pi OS or Debian-based systems."
    exit 1
fi

# Install git if missing
if ! command -v git >/dev/null 2>&1; then
    echo "Installing git..."
    sudo apt update
    sudo apt install git -y
fi

# Install Python3 if missing
if ! command -v python3 >/dev/null 2>&1; then
    echo "Installing Python3..."
    sudo apt update
    sudo apt install -y python3
fi

INSTALL_DIR="/opt/pydeploycli"

echo "Installing to $INSTALL_DIR..."

# Remove old install
sudo rm -rf "$INSTALL_DIR"

# Clone repo
sudo git clone https://github.com/kevinde3ngineer/PyDeployCLI-v1.0.git "$INSTALL_DIR"

# Make sure file exists
if [ ! -f "$INSTALL_DIR/PyDeployCLI.py" ]; then
    echo "Error: PyDeployCLI.py not found!"
    exit 1
fi

# Make executable
sudo chmod +x "$INSTALL_DIR/PyDeployCLI.py"

# Create global command (this is what makes pydeploycli` work)
echo '#!/bin/bash
python3 /opt/pydeploycli/PyDeployCLI.py "$@"' | sudo tee /usr/local/bin/pydeploycli > /dev/null

sudo chmod +x /usr/local/bin/pydeploycli

echo ""
echo "===================================="
echo " PyDeployCLI Installed Successfully!"
echo " Run with: pydeploycli"
echo "===================================="

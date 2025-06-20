#!/bin/bash

# Prompt for app name and website URL
read -p "Enter the name of the app: " app_name
read -p "Enter the website URL: " website_url

# Setup paths
app_dir="$HOME/$app_name"
venv_path="$app_dir/venv"
python_exec="$venv_path/bin/python3"

# Create app directory
mkdir -p "$app_dir"

# Create virtual environment if it doesn't exist
if [ ! -f "$python_exec" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$venv_path"
fi

# Activate virtual environment
source "$venv_path/bin/activate"

# Upgrade pip
pip install --upgrade pip

# Install pywebview + Qt backend (PyQt5 + PyQtWebEngine)
echo "Installing required packages..."
pip install pywebview qtpy PyQt5 PyQtWebEngine

# Create the Python app file
cat > "$app_dir/app.py" <<EOL
import webview

webview.create_window("$app_name", "$website_url")
webview.start()
EOL

# Create .desktop entry
desktop_file="$HOME/.local/share/applications/$app_name.desktop"
cat > "$desktop_file" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=$app_name
Exec=$python_exec $app_dir/app.py
Icon=web-browser
Terminal=false
Categories=Network;WebBrowser;
EOL

chmod +x "$desktop_file"

echo "Launching $app_name..."
$python_exec "$app_dir/app.py"


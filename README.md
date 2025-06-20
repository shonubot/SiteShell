# Webcrate

Turn any website into a native Linux desktop app — powered by Python, PyWebView, and Qt.

---

### Features

- Create standalone apps for your favorite websites
- Adds app to GNOME launcher menu with `.desktop` support
- Comes with an uninstaller script

---

### Setup Guide

#### 1. Clone this repository

```bash
git clone https://github.com/yourusername/webcrate.git
cd webcrate
```

#### 2. Make the scripts executable

```bash
chmod +x ./create_webapp.sh ./uninstall_webapp.sh
```

#### 3. Create a Web App

```bash
./create_webapp.sh
```

You’ll be prompted to enter:
- The app name (e.g. `YouTube`)
- The website URL (e.g. `https://youtube.com`)

A native app will be created in `~/YouTube`, added to your application menu, and launched immediately.

---

### Uninstall a Web App

```bash
./uninstall_webapp.sh
```

This will delete the app folder and remove the launcher from your system.

---

### Requirements

- Linux (Debian/Ubuntu recommended)
- Python 3.11+
- `python3-venv`
- Internet connection (to install dependencies in the venv)

You can install requirements using:

```bash
sudo apt install python3-venv
```

### License

GNU GPL 3.0 License — free to use, modify, and share.

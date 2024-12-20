# macOS Setup

This is how I set up a new device running macOS. Tested on macOS Ventura (13.3.1) and Sonoma Beta 7 (14.0).

## Give Terminal Full Disk Access

Go to System Settings > Privacy & Security > Full Disk Access and enable Terminal.

This is required to run some commands in `set-system-defaults`.

## Install Homebrew

Follow [installation instructions](https://brew.sh/).

This should also install command line tools (includes git). If it doesn't, install with:

    xcode-select --install

## Install packages

    ./install-brew-packages
    ./install-other-packages

## Set defaults with computer name of `Name`

    ./set-system-defaults Name
    ./set-app-defaults
    sudo ./set-permissions
    ./link-dotfiles

Restart machine.

## Manual steps

I haven't found a way to automate these.

### iCloud

Sign in to iCloud.

### App Store

Go to past purchases and download apps in bulk. A list that I used at a point in time:

- DaftCloud for SoundCloud
- djay Pro
- Final Cut Pro
- Gifski
- Keynote
- Logic Pro
- Microsoft Excel
- Microsoft OneNote
- Microsoft PowerPoint
- Microsoft Word
- Numbers
- Pages
- Pixelmator Pro
- Slack for Desktop

Or, here's an output of `mas list | sort -k1 -n`:

```
404705039   Graphic         (3.1)
409201541   Pages           (13.2)
409203825   Numbers         (13.2)
450527929   djay Pro        (5.0.2)
497799835   Xcode           (15.1)
539883307   LINE            (8.5.1)
634148309   Logic Pro       (10.8.1)
1289583905  Pixelmator Pro  (3.5)
1320450034  DaftCloud       (4.0.20)
1435957248  Drafts          (42.0)
1460836908  GoPro Player    (2.1.10)
1475387142  Tailscale       (1.54.1)
```

### Install other apps

- [Spotube](https://github.com/KRTirtho/spotube)
- [Textinator](https://github.com/RhetTbull/textinator)

```
pip install spotdl
pip install "audio-separator[silicon]"
```

### System Settings

- iCloud
    - iCloud Photos: off
- Wi-Fi
    - Ask to join networks: off
    - Ask to join hotspots: off
- Notifications
    - Notification Center
        - Allow notifications when the display is sleeping: off
        - Allow notifications when the screen is locked: off
    - Application Notifications
        - Tips: off
- Focus
    - Delete focuses synced from iCloud account
- General
    - Login Items
        - Add ActivityWatch
- Desktop & Dock
    - Default web browser: Vivaldi.app
- Desktop & Dock > Shortcuts
    - Mission Control: `-`
    - Application windows: `-`
    - Show Desktop: `-`
- Accessibility
    - Spoken Content
        - System voice > Manage voices… > Chinese > Chinese (Taiwan) - Siri > Download Voice 2
        - Speaking rate: ~40%
- Siri & Spotlight
    - Search results
        - turn off:
            - Contacts
            - Conversion
            - Developer
            - Events & Reminders
            - Fonts
            - Images
            - Mail & Messages
            - Movies
            - Music
            - Other
            - Siri Suggestions
            - Tips
            - Websites
    - Spotlight Privacy…
        - Prevent spotlight from searching these locations
            - Add development directories to prevent Spotlight from searching the likes of `node_modules`.
- Privacy & Security
    - Full Disk Access
        - add Visual Studio Code
- Displays
    - Night Shift… > Schedule: Sunset to Sunrise
        - For Macs not using Wi-Fi (i.e. ethernet only), the Date & Time must be set manually to closest city since Wi-Fi triangulation will not be available.
- Lock Screen
    - Start Screen Saver when inactive: never
    - Show large clock: Never
    - Show user name and photo: off
- Keyboard
    - Text Input > Text Replacements… > remove `omw` replacement
    - Input Sources
        - add Chinese, Traditional keyboards
    - Keyboard Shortcuts… > App Shortcuts > +
        - Start Speaking: F6
        - Stop Speaking: SHIFT + F6

### Notification Center

- Remove default widgets like News, Stocks, etc.

### Vivaldi

#### Browser settings

- Start page > Speed Dial Appearance
    - Thumbnail Size: Icon
    - Maximum columns: Unlimited
- - chrome://settings/content
    - Notifications: block

An alternative to the steps below is data synchronization with a Vivaldi account.

- chrome://settings/passwords
    - Offer to save passwords: off
- chrome://settings/payments
    - Save and fill payment methods: off
    - Allow sites to check if you have payment methods saved: off
- chrome://settings/addresses
    - Save and fill addresses: off
- chrome://settings/content/federatedIdentityApi
    - Third-party sign-in: Block sign-in prompts from identity services
- Vivaldi Settings (⌘,)
    - Tabs > Tab Features > Cycle in Tab Order

#### Extension: Redirector

#### Extension: 1Password

- Remove some vaults from autofill

### Finder

- Settings > Sidebar > remove everything but Downloads
- Dock > Downloads
    - Display as: Folder
    - View content as: Grid

### MenuMeters

- CPU > Set System color to white

### Maccy

- General
    - Hotkey: SHIFT + CMD + V
    - Launch at login: on

### 1Password

- General
    - Keyboard Shortcuts: clear all
- Appearance
    - Density: Compact
- Security
    - Concealed Fields > Hold Option to toggle revealed fields: on

### Ice

- Show MenuMeters

### QLMarkdown

- Just need to right click > Open from Finder to properly initialize.

### Terminal

- Profiles > Keyboard > Use Option as Meta key: on

### VSCode

- Turn on Settings Sync via GitHub account

### Command line

- Run `gh auth login` to authenticate git commands

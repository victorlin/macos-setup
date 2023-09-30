# macOS Setup

This is how I set up a new device running macOS. Tested on macOS Ventura (13.3.1) and Sonoma Beta 7 (14.0).

## Install command line tools

Install command line tools (includes git) with:

    xcode-select --install

## Install Homebrew

Follow [installation instructions](https://brew.sh/).

## Copy dotfiles

    cp -a dotfiles/. ~

## Install Homebrew packages

    ./install-brew-packages

## Set defaults with computer name of `Name`

    ./set-system-defaults Name
    ./set-app-defaults

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
- Sound > Sound Effects
    - Play sound on startup: off
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
    - Display
        - Reduce transparency: on
    - Zoom
        - Use keyboard shortcuts to zoom: on
        - Use scroll gesture with modifier keys to zoom: on
        - Zoom style: Picture in picture
        - Advanced
            - Appearance
                - When zoomed in, the screen image moves: So the pointer is at or near the center of the zoomed image
                - Smooth images: off
            - Controls > Hold `ctrl`+`option` to temporarily toggle zoom
    - Spoken Content
        - System voice > Manage voices… > Chinese > Chinese (Taiwan) - Siri > Download Voice 2
        - Speaking rate: ~40%
- Siri & Spotlight
    - Search results
        - Mail & Messages: off
        - Tips: off
- Displays
    - Night Shift… > Schedule: Sunset to Sunrise
- Lock Screen > Start Screen Saver when inactive: never
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
- Vivaldi Settings (⌘,)
    - Tabs > Tab Features > Cycle in Tab Order

#### Extension: Redirector


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

### Bartender

- General
    - Startup > Launch Bartender at login: on
- Menu Bar Layout
    - show MenuMeters
- Show For Updates
    - Battery: on
    - Wifi: on

### Microsoft Edge

- Appearance > Customize toolbar
    - Show vertical tabs for all current browser windows: Turn On
    - Hide title bar while in vertical tabs: on
    - Extensions button: Never Show
- edge://extensions/shortcuts
    - 1Password
        - Activate the extension: `shift`+`cmd`+`P`
- edge://settings/content
    - Strip down site permissions

### QLMarkdown

- Just need to right click > Open from Finder to properly initialize.

### Terminal

- Profiles > Keyboard > Use Option as Meta key: on

### iTerm

- Profiles > Default
    - General > Working Directory: Reuse previous session's directory
    - Keys > Key Mappings > Presets… > Natural Text Editing (remove all existing key mappings)

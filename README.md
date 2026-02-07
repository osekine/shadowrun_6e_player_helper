# Shadowrun 6E Player Helper

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)

> Digital companion app for Shadowrun 6th Edition players to track inventory, equipment, and character stats

<p align="center">
  <img src="assets/screenshots/dark_mode.png" width="45%" />
  <img src="assets/screenshots/light_mode.png" width="45%" />
</p>

## 🎯 The Problem

Shadowrun character sheets get messy fast. Limited space, smudged pencil marks, and constant erasing make tracking your street samurai's growing arsenal a nightmare. Ever lost track of which gun has which modification? Or forgot your armor's defense rating mid-combat?

This app solves that by giving you a clean, organized digital inventory that persists across gaming sessions.

## ✨ Features

### Currently Implemented
- 🔫 **Weapon Management** — Track all weapon stats (DMG, Mode, ATK, Price, Category)
- 🛡️ **Armor Tracking** — Monitor defense ratings and capacity
- 🌓 **Theme Support** — Seamless dark/light mode switching
- ➕ **Quick Actions** — Add/remove items with smooth animations
- 💾 **Persistent Storage** — SQLite-based local database
- 🖥️ **Cross-Platform** — Runs on Windows, macOS, Linux, iOS, and Android

### 🚀 Roadmap
- [ ] Vehicles & Electronics categories
- [ ] Custom notes and modifications for items
- [ ] Full digital character sheet (attributes, skills, qualities, cyberware)
- [ ] Local WiFi lobbies for in-game chat and GM-to-player material sharing
- [ ] Dice roller with initiative tracking
- [ ] User-friendly Roll20 alternative

## 🛠️ Tech Stack

- **Flutter** — Cross-platform UI framework
- **Dart** — Primary programming language
- **SQLite** (`sqflite`) — Local database for equipment storage
- **Custom State Management** — Lightweight state handling
- **Material Design 3** — Modern UI with theme support

### Data Pipeline
Equipment data is sourced from official Shadowrun 6E rulebooks, preprocessed with AI assistance, and migrated into SQLite schemas for efficient querying.

## 📸 Showcase

<p align="center">
  <img src="assets/screenshots/showcase.gif" width="70%" alt="App Demo" />
</p>

*Adding weapons and armor with smooth animations*

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0 or higher
- Desktop development tools (for Windows/macOS/Linux builds)

### Installation

```bash
# Clone the repository
git clone https://github.com/osekine/shadowrun_6e_player_helper.git

# Navigate to project directory
cd shadowrun_6e_player_helper

# Install dependencies
flutter pub get

# Run on your platform
flutter run -d windows  # or macos, linux, ios, android
```

### Building Release

```bash
# Desktop (example for Windows)
flutter build windows --release

# Mobile
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

## 🎮 For Shadowrun Players

This app is built by a shadowrunner who codes. I created it because I was tired of:
- Losing track of weapon modifications and stats
- Running out of space on physical character sheets  
- Spending more time erasing than playing

If you're part of a Shadowrun campaign, try it out and share your feedback! I'm especially interested in hearing from GMs about features that would streamline your sessions.

## 🧑‍💻 For Developers

This project is a great reference for:
- **Flutter Desktop development** with native platform integration
- **SQLite integration** for local-first data persistence
- **Cross-platform theming** with dark/light mode support
- **Card-based UI patterns** for data-heavy applications
- **State management** in Flutter without external dependencies

The codebase demonstrates clean architecture principles and serves as a practical example of building CRUD applications in Flutter.

## 🏗️ Project Status

**Current Phase:** Active but intermittent development  
**Stability:** Beta — core features work, but expect bugs  
**Tested By:** Small group of players in active campaigns

This is a passion project that I return to between gaming sessions. Contributions and feedback are welcome!

## 🤝 Contributing

Found a bug? Have a feature idea? Want to add support for Shadowrun 5E or Anarchy?

- **Report issues:** [Open an issue](https://github.com/osekine/shadowrun_6e_player_helper/issues)
- **Request features:** Describe your use case in a new issue
- **Submit code:** Fork, code, test, and open a PR

All contributions are appreciated, whether it's code, documentation, or rulebook data!

## 📜 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

*Shadowrun is a trademark of The Topps Company, Inc. This is an unofficial fan project.*

## 🔗 Links

- [Shadowrun 6th World Official Site](https://www.shadowrunsixthworld.com/)
- [Flutter Desktop Documentation](https://docs.flutter.dev/desktop)
- [SQLite Flutter Plugin](https://pub.dev/packages/sqflite)

---

**Built with ❤️ by a shadowrunner who refused to erase one more character sheet**

*"In 2080, everyone carries a commlink. Your runner should too."*
# 🎵 SampleLiquidGlass  
**An Apple Music–inspired UIKit demo app** showcasing a beautiful **liquid-glass interface**, custom navigation, and compositional layout — built entirely with **UIKit**.

---

## ✨ Features
- 🧊 **Liquid-Glass UI:**  
  Dynamic blur and gradient layers that simulate a soft, glass-like aesthetic used across the navigation bar, tab bar, and background.

- 🎶 **Apple Music–style Layout:**  
  Smooth horizontal scrolling carousels created using `UICollectionViewCompositionalLayout`.

- 🪩 **Modern Glass Tab Bar:**  
  Transparent, rounded tab bar with elegant tint colors and subtle glow animations.

- 👤 **Custom Navigation Bar:**  
  Left-aligned title and right profile image — designed to mimic Apple Music’s clean header style.

---

## 🏗️ Architecture Overview

| Layer | Description |
|--------|--------------|
| **HomeModel.swift** | Defines `HomeModel` and `Content` data models for each section. |
| **HomeVM.swift** | ViewModel providing mock music section data (e.g., “Recently Played”, “Top Charts”). |
| **ViewController.swift** | Main home screen with blur background, collection view layout, and navigation customization. |
| **GlassTabBarController.swift** | Manages tab navigation with a glass-like bottom bar and five main sections. |
| **MusicCell.swift / SectionCell.swift** | Custom reusable cells for item content and section headers. |

---

## 🧰 Requirements
- **Xcode:** 15.0 or later  
- **iOS:** 17.0 or later  
- **Language:** Swift 5.9+  
- **Frameworks:**  
  - `UIKit`  
  
  🧠 Design Highlights

Built entirely with UIKit, no Storyboards.

Uses UIVisualEffectView + CAGradientLayer for the blur-and-glow “liquid” look.

Adaptive with light/dark mode support.

Modular, easily extendable architecture for future “Now Playing” or “Mini Player” additions.

📄 License

This project is licensed under the MIT License — feel free to use, modify, and share.

MIT License © 2025 Poem Kimlang
Permission is hereby granted, free of charge, to any person obtaining a copy of this software..

🙋‍♂️ Contributing Feel free to contribute by creating pull requests or raising issues.

🧑‍💻 Author

Created by Poem Kimlang

UIKit Enthusiast • iOS Developer 💚

🖼️ App Preview Run the project on simulator or device.
<p align="center">
  <img src="ScreenShot/demo_app.png" width="300" />
</p>


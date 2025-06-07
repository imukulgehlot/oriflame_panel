
# 🌐 Oriflame Panel (Flutter Web)

A feature-rich admin panel built using **Flutter Web**, crafted as part of an interview task for Oriflame. This panel allows reviewing social media accounts with smooth UI, thoughtful interactions, and animated feedback.

> 📢 **Best viewed in a full-screen browser window** for optimal layout and responsiveness.

---

## ▶️ Demo
![Oriflame Panel Demo](docs/demo.gif)

---

## 🚀 How to Run the Project

1. **Clone the repo:**
   ```bash
   git clone https://github.com/imukulgehlot/oriflame_panel.git
   cd oriflame_panel
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on Web:**
   ```bash
   flutter run -d chrome
   ```

---

## 🔧 Assumptions & Improvements Made

- **Navigation** for screens not present in design is implemented with the screen name shown centrally.
- Added **toast messages** for buttons without Figma interactions, showing “Feature under development.”
- **Review detail dialog** includes:
  - Slide animations for smooth transition
  - Hides *Next* or *Previous* when at start/end
  - Clickable "Go to Profile" opens relevant website
- Added **hover animations** for action buttons and chips.
- **Sorting**: both type and order now work.
- **Review Accounts icon** includes a custom *unfilled SVG* for deselected state.
- Splash screen animation added until Flutter Web loads.
- **Responsiveness**: UI adapts reasonably, but not fully mobile-optimized.
- **Clean component breakdown**, modular UI model, and route handling.

---

## 📬 Contact Me

Feel free to connect for any questions or suggestions:  
💼 [linkedin.com/in/imukulgehlot](https://www.linkedin.com/in/imukulgehlot)
📧 [imukulgehlot@gmail.com](mailto:imukulgehlot@gmail.com)  
🐙 [github.com/imukulgehlot](https://github.com/imukulgehlot)

---
# oriflame_panel

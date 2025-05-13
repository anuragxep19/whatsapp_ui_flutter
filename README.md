# Whatsapp_ui

![Flutter](https://img.shields.io/badge/flutter-3.19.2-blue.svg)
[![LICENSE](https://img.shields.io/badge/LICENSE-MIT-blue.svg)](LICENSE)

Whatsapp_ui is a Flutter-based user interface recreation of WhatsApp’s onboarding and core layout experience.
This project was built to practice Flutter’s widget layout, screen navigation, and clean UI structure.
It features custom tap (forward) & double-tap (back) navigation for prototyping.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure-simplified-overview)
3. [Screen Flow](#screen-flow)
4. [Screenshots](#screenshots)
5. [Credits](#credits)
6. [License](#license)
7. [Author](#author)

---

## Getting Started

1. **Clone the repository**:

   ```bash
   git clone https://github.com/anuragxep19/whatsapp_ui_flutter.git
   cd whatsapp_ui_flutter
   ```

1. **Install dependencies**:

   ```bash
   flutter pub get
    ```

1. **Run**:

    ```bash
    flutter run
    ```

---

## Project Structure (Simplified Overview)

```tree

Whatsapp_ui/
├── lib/
│   ├── constants/               # Static values like country codes, language list
│   ├── view/                    # All UI screens and components
│   │   ├── enter_phone_number/  # Phone input + country selector
│   │   ├── home/                # Bottom nav: chats, updates, communities, calls
│   │   ├── language/            # Language selection UI
│   │   ├── verify_phone_number/ # OTP input screen
│   │   ├── welcome/             # Welcome screen with popup
│   │   ├── splash_view.dart     # Splash screen
│   │   ├── loading_view.dart    # Loading screen
│   │   ├── profile_view.dart    # Name + avatar input
│   └── main.dart                # App entry point
│
├── assets/
│   ├── icons/                   # Logos and backgrounds
│   ├── licenses/                # OSS license data
│   └── readme/                  # App screenshots for docs
│
├── pubspec.yaml                 # Dependencies and asset paths
├── README.md                    # Project overview
├── LICENSE                      # MIT license
└── .gitignore                   # Git exclusion rules
             

```

---

## Screen Flow

1. **Splash**
   - WhatsApp-style logo with Meta branding.

2. **Language Selection**
   - Scrollable language options via radio list.
   - "Next" button to proceed.

3. **Welcome Screen**
   - Title/subtitle.
   - Language change via popup menu.
   - "Agree and Continue" to proceed.

4. **Enter Phone Number**
   - Full-screen bottom sheet for country/code selection.
   - Text field for number input.
   - Keyboard-aware UI.

5. **Verify Phone Number**
   - OTP-style layout with 6 text fields.
   - Autofocus and navigation to next field.

6. **Profile Info Setup**
   - Avatar.
   - Name input.
   - Button to continue.
  
7. **Loading Screen**
   - Circular loading spinner.

8. **Home Screen with Bottom Nav**
   - WhatsApp-style bottom navigation:
      - `Chats` – Search bar, FAB, animated custom list tiles, filter     icons.
      - `Updates` – Stories/status tiles with FAB (edit & camera).
      - `Communities` – Static content with button.
      - `Calls` – List of past calls, icons, and detail views.  

---

## Screenshots

<details>
  <summary>Click to expand screenshots</summary>

  <br/>

  | Splash | Language | Welcome |
  |:-----:|:----:|:----:|
  | <img src="assets/readme/splash.png" alt="Splash" width="200"/> |  <img src="assets/readme/language.png" alt="Language" width="200"/> |<img src="assets/readme/welcome.png" alt="Welcome" width="200"/> |

  | Phone Entry | OTP | Profile |
  |:-----:|:----:|:----:|
  | <img src="assets/readme/enter_phone_number.png" alt="Phone Entry" width="200"/> |  <img src="assets/readme/verify_phone_number.png" alt="OTP" width="200"/> |<img src="assets/readme/profile_info.png" alt="Profile" width="200"/> |

  | Loading | Chats | Updates |
  |:-----:|:----:|:----:|
  | <img src="assets/readme/loading.png" alt="Loading" width="200"/> |  <img src="assets/readme/chats.png" alt="Chats" width="200"/> |<img src="assets/readme/updates.png" alt="Updates" width="200"/> |

  | Communities | Calls |
  |:---------------:|:----:|
  | <img src="assets/readme/communities.png" alt="Communities" width="200"/> | <img src="assets/readme/calls.png" alt="Calls" width="200"/> |

</details>

---

## Credits

- [Shields.io](https://shields.io/) – Used for project badges  
- [IconKitchen](https://icon.kitchen) – Helped generate the app’s logo assets  
- [Flutter](https://flutter.dev/) – Core framework for building the UI  

- [The open-source community](https://pub.dev/) – For architectural inspiration and reusable packages

---

## License

- **MIT License** – see [LICENSE](LICENSE)  
- **Third-Party Licenses** – see `assets/licenses/oss_licenses.json`

---

## Author

**Anurag E P**  
[GitHub: @anuragxep19](https://github.com/anuragxep19)  

---

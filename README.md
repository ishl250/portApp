
# Ishimwe Portfolio App

Welcome to the **Ishimwe Portfolio App** – a mobile portfolio showcasing the skills, projects, and achievements of **Ishimwe Jean Claude**, built using **Flutter** with full support for light/dark themes and responsive design.

**Repository:** [github.com/ishl250/portApp](https://github.com/ishl250/portApp)

---

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Screenshots](#screenshots)
* [Technologies Used](#technologies-used)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

---

## Overview

This Flutter application is designed as a **personal portfolio** app to display:

* Personal information and bio
* Technical skills
* Projects with links to GitHub repositories
* Certificates and professional achievements
* Contact information (email, phone, LinkedIn, GitHub)

It includes:

* **Light/Dark theme toggle**
* Responsive UI using `NavigationBar`
* Interactive project links and contact options
* Modern Material 3 styling with custom color scheme

---

## Features

* **Home Section** – Profile picture, name, and role
* **About Section** – Bio and skill chips
* **Projects Section** – Interactive cards with project description, tech stack, and GitHub links
* **Certificates Section** – List of certifications and achievements
* **Contact Section** – Clickable email, phone, LinkedIn, and GitHub links
* **Theme Toggle** – Switch between light and dark mode

---

## Screenshots

*Add screenshots of your app here for mobile & tablet views.*

---

## Technologies Used

* **Flutter** – Cross-platform mobile UI framework
* **Dart** – Programming language for Flutter
* **Material 3** – Modern UI design
* **url_launcher** – To open external project links and contact actions

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/ishl250/portApp.git
```

2. Navigate to the project directory:

```bash
cd portApp
```

3. Install dependencies:

```bash
flutter pub get
```

4. Ensure the `assets/licky.png` image is available in the `assets/` folder and referenced in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/licky.png
```

5. Run the app on a connected device or emulator:

```bash
flutter run
```

---

## Usage

* Navigate through sections using the bottom navigation bar
* Toggle between light and dark theme using the switch in the AppBar
* Click on project links to view GitHub repositories
* Contact directly via email, phone, LinkedIn, or GitHub

---

## Project Links

| Project Name | Description                        | Tech Stack                | GitHub Link                                    |
| ------------ | ---------------------------------- | ------------------------- | ---------------------------------------------- |
| AgriTech AI  | Smart farming app with AI features | Flutter, Firebase, Python | [Link](https://github.com/ishl250/agritech-ai) |
| TravelMate   | Travel planner with weather & maps | Flutter, REST APIs        | [Link](https://github.com/ishl250/travelmate) |
| SRAILA       | Adaptive gamified learning app     | Flutter, REST APIs        | [Link](https://github.com/ishl250/SRAILA)     |

---

## License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

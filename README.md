# My Tasks Application  

## Overview

This repository contains a Flutter application developed as part of the **Flutter Developer Practical Test** for *Five Line for Web Services*.  
The project, titled **“My Tasks”**, is a task management app that allows users to efficiently organize, create, and track their daily tasks.  

The app demonstrates clean architecture using the **Bloc** and **Hydrated Bloc** state management approach with **Firebase** as the backend for authentication and data storage. It also includes localization (Arabic/English), offline persistence, and smooth UI animations.

---

## Core Features

*   **Splash and Authentication Screens**  
    - Splash screen with app logo and name.  
    - Firebase Authentication for login, signup, and logout.  
    - Authentication state persisted locally with **Hydrated Bloc**.

*   **Task Management (CRUD)**  
    - Add, edit, and delete tasks.  
    - Each task includes:  
        - **Title**  
        - **Description**  
        - **Status** (Done / Not Done).  
    - Real-time updates reflected instantly on the main task list.  
    - Offline caching and sync when the internet is restored.

*   **Localization**  
    - Supports both **Arabic 🇸🇦** and **English 🇬🇧**.  
    - Implemented using the `easy_localization` package.  
    - Changes apply instantly after restarting the app.

*   **Bonus Features**  
    - **Dark / Light Theme** switching.  
    - **Restart App** functionality using `restart_app` package.  
    - **Network Checker** using `data_connection_checker_tv` for real-time connection monitoring.  
    - **Dependency Injection** implemented with `get_it`.  
    - **Animations** and UI transitions for smooth navigation.  

---

## Project Structure

The application follows **Clean Architecture** principles and is organized feature-wise under the `lib/` directory.

![image alt](https://github.com/karim1256/five_line_task/blob/ae6a0765b76cce89049c7c91f0ab8a87b5a9d71e/Screenshot%202025-11-03%20002948.png)



**Architecture Used:** Clean Architecture (Data → Domain → Presentation)  
**State Management:** Bloc / Hydrated Bloc

---

## Firebase Backend Setup

The app uses **Firebase** services for authentication and data storage.

### Required Setup:
1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable:
   - **Authentication → Email/Password**
   - **Cloud Firestore**
3. Add Firebase configuration files:
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
4. Cloud Firestore structure:

| Collection | Fields | Type | Description |
|-------------|---------|------|-------------|
| `tasks` | `title` | String | Task title |
|  | `description` | String | Task description |
|  | `isDone` | Boolean | Task completion status |

---

## Getting Started

To run this project locally:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/karim1256/five_line_task.git
    cd five_line_task
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Configure Firebase:**
    - Place your Firebase config files (`google-services.json` and `GoogleService-Info.plist`) in their respective platform folders.
    - Make sure Firebase Authentication and Firestore are enabled.

4. **Run the application:**
    ```bash
    flutter run
    ```

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  svg_flutter: ^0.0.1
  flutter_screenutil: ^5.9.3
  flutter_bloc: ^9.1.1
  hydrated_bloc: ^10.1.1
  path_provider: ^2.1.5
  firebase_core: ^4.2.0
  firebase_auth: ^6.1.1
  easy_localization: ^3.0.8
  data_connection_checker_tv: ^0.3.5-nullsafety
  dartz: ^0.10.1
  get_it: ^8.2.0
  cloud_firestore: ^6.0.3
  restart_app: ^1.3.2


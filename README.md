![alt text](/ios/Runner/Assets.xcassets/AppIcon.appiconset/icon76.png)
## Speed Watch

Speed Watch is an iPad application developed in Flutter for use in the Speed Watch program by volunteer police throughout B.C. 

* [Team Members](#team-members)
* [General Info](#general-info)
* [Technologies](#technologies)
* [Dependencies](#dependencies)
* [Contents](#contents)
* [IDE](#ide)
* [Setup](#setup)

## Team Members
First Name | Last Name | Github
--- | --- | ---
Harry | Seo | [Link](https://github.com/harryseo1992)
Rahim | Askarzadeh | [Link](https://github.com/RADeveloping)
Amrit | Manhas | [Link](https://github.com/apsm100)
Sunwoo | Park | [Link](https://github.com/swparkaust)

## General Info
The Speed Watch program is performed by volunteers to survey speeding incidents throughout B.C. Speed Watch allows volunteers to create sessions locally, record speeds, and export sessions to an excel file. *The application is available for download in the App Store. 

## Technologies
Technologies used for this project:
* Flutter
* Dart
* Objective-C
* Swift

## Dependencies
* flutter
* cupertino_icons: 1.0.2
* get: 4.6.1
* font_awesome_flutter: 9.0.0-nullsafety
* line_icons: 2.0.1
* flutter_cupertino_settings: 0.5.0
* multi_split_view: 1.13.0
* settings_ui: 2.0.2
* chips_choice_null_safety: 2.0.6
* isar: 2.5.0
* isar_flutter_libs: 2.5.0
* isar_generator: 2.5.0
* build_runner: any
* path_provider: 2.0.9
* popover: 0.2.6+3
* intl: 0.17.0
* sticky_headers: 0.2.0
* share_plus: 4.0.4
* excel: 2.0.0-null-safety-3

## IDE
* Android Studio or Visual Studio Code
* Xcode

## Contents
Content of the project folder:
```
Top level:
├── README.md                  # Readme
├── pubspec.yaml               # Package dependencies

Subfolders:
├── /android                   # Android build data
├── /ios                       # iOS build data
├── /lib                       # Flutter project files
    ├── /assets                # Project assets; images and templates
    ├── /collections           # Isar model classes
    ├── /components            # Flutter components
    ├── /controllers           # GetX controllers
    ├── /converters            # Isar enum converters
    ├── /screens               # Main screens
    ├── /services              # Services
    ├── constants.dart         # Constants
    ├── main.dart              # Entry point
    
```

## Setup
Setting up this project will allow you to preview and compile the app locally.
1. Clone the repository into a working directory
2. Run *pub get*
3. Run main.dart in Android Studio or Visual Studio Code using the iOS Simulator

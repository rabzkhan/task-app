## Runs on Flutter 3.7.10


## Acknowledgment
Project was created using [get_cli](https://pub.dev/packages/get_cli) which is a great tool helping you to (start project,create screens/controllers, handling DI)..etc and we will list other packages that helped to create this skeleton
- [GetX](https://pub.dev/packages/get) for state management,navigation,managing dependencies..etc
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) to make app more responsive
- [hive](https://pub.dev/packages/hive) as local database

## Discovering Project
```
.
└── lib
    ├── app
    │   ├── components
    │   ├── data
    │   │   ├── local
    │   │   └── models
    │   ├── modules
    │   │   └── home
    │   ├── routes
    │   └── services
    ├── config
    │   ├── theme
    │   └── translation
    └── utils
```

## Quick Start
- Responsive app: to make your app responsive you need to get advantage of using flutter_ScreenUtil so instead of using normal double values for height,width,radius..etc you need to use it like this
-
```dart
200.w // adapted to screen width
100.h // /Adapted to screen height
25.sp // adapter font size
10.r // adapter radius
// Example
Container(
    height: 100.h,
    width: 200.w,
    child: Text("Hello",style: TextStyle(fontSize: 20.sp,))
)
```

- Change app package name
    ```
    flutter pub run change_app_package_name:main com.new.package.name
    ```
- Change app name
    ```
    flutter pub run rename_app:main all="My App Name"
    ```
- Change app launch icon (replace assets/images/app_icon.png with your app icon) then run this command
    ```
    flutter pub run flutter_launcher_icons:main
    ```
- Change app splash screen (replace assets/images/splash.png with your app splash logo) then run this command
   ```
   flutter pub run flutter_native_splash:create
   ```
## ScreenShots

## Login Page view
![login](https://user-images.githubusercontent.com/20728252/231259447-82732f0d-7aea-41a7-94e3-f3c6c2c47868.jpeg)

## Home Page view
![home_page](https://user-images.githubusercontent.com/20728252/231259235-c16fa4ba-99f8-43e0-afb8-bf177f3b0124.jpeg)

## Product details view / delete view
![product_details_view](https://user-images.githubusercontent.com/20728252/231259507-ed3efd9b-4a1e-4e92-a52c-e532d5e2cb2e.jpeg)

## Add product view
![add_product](https://user-images.githubusercontent.com/20728252/231259600-6598a090-6854-4608-8949-980d6f1e3c2b.jpeg)

## Profile Page view
![profile_view](https://user-images.githubusercontent.com/20728252/231259747-980d152b-5e68-4ab1-8e0a-3baf172a0624.jpeg)

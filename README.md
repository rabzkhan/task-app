
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

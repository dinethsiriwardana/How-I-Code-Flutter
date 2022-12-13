# How I Code in Flutter
## Steps I followed when I create a flutter app


###  My Basic Packages :-
```yaml
      cupertino_icons: ^1.0.2
      cloud_firestore: ^3.5.1
      flutter_lints: ^2.0.0
      firebase_auth: ^3.11.2
      firebase_core: ^1.24.0
      firebase_storage: ^10.3.11
      firebase_database: ^9.1.7
      font_awesome_flutter: ^10.1.0
      get: ^4.6.5
      provider: ^6.0.3
      responsive_sizer: ^3.1.1
      google_fonts: ^3.0.1  
```
    And run > flutter pub upgrade

### Add Firebase Dev to void main
```dart

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

```

### Setup Pod File 
#### Uncomment the  platform :ios, '11.0'  line in ios/Podfile
#### Open Terminal in ios folder and run
      
      pod repo update
      pod install
      
### Open android/app/build.gradle and add these lines

    defaultConfig {
        minSdkVersion 19
        multiDexEnabled true
    }
    

### Add responsive_sizer to the main.dart
```dart
    return ResponsiveSizer(builder: (context, orientation, screenType) {
    
    )}
```

### Add provider to the main.dart
```dart
    return Provider<AuthBase>(
       create: (context) => Auth(),
    )
```



### Add get routes to the routes.dart (Need to create a file)
Change *MaterialApp* -> *GetMaterialApp* in the main.dart

```dart
    import 'package:get/get.dart';

    class RoutesClass {
        static String landing = "/";

        static String getHomeRoute() => landing;

        static List<GetPage> routes = [
            GetPage(page: () => LandingPage(), name: landing),
        ];
    }
```


## Connect Database class using provider in the landing_page.dart

```dart
      return Provider<Database>(
            create: (_) => FirestoreDatabase(user: user.uid),
            child: //return
      );                 
```

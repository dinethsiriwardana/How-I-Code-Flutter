# How I Code in Flutter
## Steps I followed when I create a flutter app


### My Basic Packages :-
    >  cupertino_icons: ^1.0.2 
    >  flutter_lints: ^2.0.0 
    >  firebase_auth: ^3.11.2 
    >  firebase_core: ^1.24.0 
    >  firebase_storage: ^10.3.11 
    >  firebase_database: ^9.1.7 
    >  get: ^4.6.5 
    >  google_fonts: ^3.0.1
    >  provider: ^6.0.3 
    >  responsive_sizer: ^3.1.1  
    >  font_awesome_flutter: ^10.1.0  

    And run > flutter pub upgrade


### Add responsive_sizer to the main.dart

    > return ResponsiveSizer(builder: (context, orientation, screenType) {
    
    > )}


### Add provider to the main.dart

    > return Provider<AuthBase>(
    >    create: (context) => Auth(),

    > )



### Add get routes to the routes.dart (Need to create a file)

    > import 'package:get/get.dart'; 
    > class RoutesClass {
        > static String landing = "/";
        > static String login = "/login";

        > static String getHomeRoute() => landing;
        > static String getLoginRoute() => login;

        > static List<GetPage> routes = [
        >     GetPage(page: () => LandingPage(), name: landing),
        >     GetPage(page: () => LoginScreen(), name: login),
        > ];
    > }
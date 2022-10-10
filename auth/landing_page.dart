class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context,
        listen: false); //Get Data from 'app/servises/auth.dart' using provider

    return StreamBuilder<User?>(
      //  Create stream builder
      stream: auth
          .authStateChanges(), // check authStateChanges in auth.dart for check the user is logged
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return WelcomePage();
          }
          return HomePage();
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}

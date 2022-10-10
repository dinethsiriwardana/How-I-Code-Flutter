class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

final FocusNode _emailFocusNode = FocusNode();
final FocusNode _passwordFocusNode = FocusNode();

String get _email => _emailController.text;
String get _password => _passwordController.text;

bool _ispasswordfilled = true;
bool _isemailfilled = true;

bool checkfields() {
  _isemailfilled = _email == "" ? false : true;
  _ispasswordfilled = _password == "" ? false : true;
  if ((_email == "") || (_password == "")) {
    return false;
  }
  return true;
}

class _LoginScreenState extends State<LoginScreen> {
  void login() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signInWithEmailAndPassword(_email, _password);
      Get.toNamed(RoutesClass.landing);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: creamwhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customHeaderClip("Login"),
            Column(
              children: [
                Text(
                  "Choco Shop",
                  style: GoogleFonts.workSans(
                    textStyle: TextStyle(
                        color: darkbrown,
                        fontSize: 9.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Column(
              children: [
                textInput(
                  _emailController,
                  _emailFocusNode,
                  _isemailfilled,
                  ["Email", "Enter your email"],
                  false,
                ),
                SizedBox(
                  height: 15,
                ),
                textInput(
                    _passwordController,
                    _passwordFocusNode,
                    _ispasswordfilled,
                    ["Password", "Enter your Password"],
                    false),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  width: 80.w,
                )
              ],
            ),
            Column(
              children: [
                CustomElebutton(
                  color: darkbrown,
                  fontcolor: creamwhite,
                  bcolor: oakbrown,
                  bcolor2: oakbrown,
                  text: "Login",
                  width: 80.w,
                  height: 14.w,
                  textStyle: GoogleFonts.workSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      bool _isallvarify = checkfields();
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ));
  }

  SizedBox textInput(
    TextEditingController controller,
    FocusNode focusNode,
    bool isfilled,
    List<String> textlist,
    bool obscureText,
  ) {
    return SizedBox(
      width: 80.w,
      height: 55.0,
      child: TextField(
        style: TextStyle(
          color: oakbrown,
        ),
        controller: controller,
        focusNode: focusNode,
        onTap: () {
          isfilled = false;
          setState(() {});
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: oakbrown,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: brownred,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          labelText: !isfilled ? textlist[1] : textlist[0],
          hintText: textlist[0],
          hintStyle: TextStyle(
            fontSize: 15,
            color: oakbrown,
          ),
          labelStyle: TextStyle(
            fontSize: 15,
            color: !isfilled ? Color.fromARGB(255, 244, 130, 54) : oakbrown,
          ),
        ),
        onChanged: (email) => _updateState(),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }
}

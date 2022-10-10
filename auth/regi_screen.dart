class RegiScreen extends StatefulWidget {
  const RegiScreen({Key? key}) : super(key: key);

  @override
  State<RegiScreen> createState() => _RegiScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _passwordConfirmController =
    TextEditingController();

final FocusNode _emailFocusNode = FocusNode();
final FocusNode _passwordFocusNode = FocusNode();
final FocusNode _passwordConfirmFocusNode = FocusNode();

String get _email => _emailController.text;
String get _password => _passwordController.text;
String get _passwordConfirm => _passwordController.text;

bool _isemailfilled = true;
bool _ispasswordfilled = true;
bool _ispasswordconfilled = true;

bool checkfields() {
  _isemailfilled = _email == "" ? false : true;
  _ispasswordfilled = _password == "" ? false : true;
  _ispasswordconfilled = _passwordConfirm == "" ? false : true;
  if ((_email == "") || (_password == "") || (_passwordConfirm == "")) {
    return false;
  }
  return true;
}

class _RegiScreenState extends State<RegiScreen> {
  void register() async {
    try {
      //connect Class Auth from app/servises/auth.dart using provider create in main.dart
      final auth = Provider.of<AuthBase>(context, listen: false);

      // send email and password to createUserWithEmailandPassword in auth.dart for register
      await auth.createUserWithEmailandPassword(_email, _password);

      Get.toNamed(RoutesClass.landing);
      //pop for go back

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
            customHeaderClip("Create Account"),
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
                    true),
                SizedBox(
                  height: 15,
                ),
                textInput(
                    _passwordConfirmController,
                    _passwordConfirmFocusNode,
                    _ispasswordconfilled,
                    ["Password Confirm", "Enter your Password Again"],
                    true),
              ],
            ),
            Column(
              children: [
                CustomElebutton(
                  color: darkbrown,
                  fontcolor: creamwhite,
                  bcolor: oakbrown,
                  bcolor2: oakbrown,
                  text: "Create Account",
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
                      if (_isallvarify) {
                        register();
                      }
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

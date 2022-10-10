class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customHeaderClip("Welcome"),
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
                height: 100,
              ),
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
                  Get.toNamed(RoutesClass.getLoginRoute());
                },
              ),
              SizedBox(
                height: 5.w,
              ),
              CustomElebutton(
                color: darkbrown,
                fontcolor: creamwhite,
                bcolor: darkbrown,
                bcolor2: darkbrown,
                text: "Register",
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
                  Get.toNamed(RoutesClass.getregisterRoute());
                },
              ),
              SizedBox(
                height: 7.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

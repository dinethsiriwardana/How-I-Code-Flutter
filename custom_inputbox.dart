// Cant add to a another file 

// Add this lines top of the file
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  String get _email => _emailController.text;

//#############################


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
          color: white,
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
              color: white,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: white,
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
            color: white,
          ),
          labelStyle: TextStyle(
            fontSize: 15,
            color: !isfilled ? Colors.red : white,
          ),
        ),
        onChanged: (email) => _updateState(),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }

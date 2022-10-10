import 'package:choco_shop/custom/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

ClipPath customHeaderClip() {
  return ClipPath(
    clipper: CustomClipPath(),
    child: Container(
      width: 100.w,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            darkbrown,
            lightdarkbrown,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Text(
          "Welcome",
          style: GoogleFonts.workSans(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 9.w,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

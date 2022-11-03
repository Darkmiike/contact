import 'package:flutter/material.dart';

Text textInfo(
    String text, FontWeight fontweight, Color? color, double fontSize) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: fontweight,
      color: color,
      fontSize: fontSize,
    ),
  );
}

fetchUserFunc(String url) {
  return Uri.parse(url);
}

Container profileImage(String url) {
  return Container(
    clipBehavior: Clip.none,
    width: 70,
    height: 70,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      image: DecorationImage(
        image: NetworkImage(url),
      ),
    ),
  );
}

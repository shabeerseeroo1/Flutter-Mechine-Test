import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyView());
  }

  Container _bodyView() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: _buildText(),
    );
  }

  Text _buildText() {
    return Text(
      "Flutter Test",
      style: GoogleFonts.roboto(
          color: Colors.grey, fontSize: 35, fontWeight: FontWeight.w900),
    );
  }
}

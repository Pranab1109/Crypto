import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowWidget extends StatelessWidget {
  final String txtr, txtl;
  const RowWidget({Key? key, required this.txtr, required this.txtl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txtl,
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Text(
            txtr,
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItems extends StatelessWidget {
  DrawerItems({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  IconData icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Color.fromARGB(255, 63, 76, 104),
                  size: 14.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  text,
                  style: GoogleFonts.robotoMono(
                      color: Color.fromARGB(255, 63, 76, 104),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.0,
              color: Color.fromARGB(255, 63, 76, 104),
            ),
          ],
        ),
      ),
    );
  }
}

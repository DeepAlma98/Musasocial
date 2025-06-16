import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';

class MusaTheme {
  static ThemeData lightTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      colorScheme: base.colorScheme.copyWith(brightness: Brightness.light),
      // Altre personalizzazioni
    ).copyWith(
      textTheme: GoogleFonts.ubuntuTextTheme(base.textTheme),
    );
  }

  static ThemeData darkTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: navyblueshade2,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: navyblueshade2,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: navyblueshade4,
      ),
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        secondary: navyblueshade3,
      ),
    ).copyWith(
      textTheme: GoogleFonts.ubuntuTextTheme(base.textTheme),
    );
  }

  // Codici colore per il tema scuro
  static Color navyblueshade1 = HexColor('#1C223A');
  static Color navyblueshade2 = HexColor('#1E233E');
  static Color navyblueshade3 = HexColor('#161A2C');
  static Color navyblueshade4 = HexColor('#20263F');
  static Color whiteShade1 = HexColor('#C7D8EB');
  static Color lightBlueShade = HexColor('#87A5B9');
  static Color colorBackground = HexColor('#FFFAFAFA');
  static Color buttonColor = HexColor('#FF40B59F');
  static Color buttonColorLight = HexColor('#52d3bb');
  static Color primaryColor = Colors.white;
  static Color secondaryColor = HexColor('#acaaad');

  static var googleFont = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontWeight: FontWeight.w700,
    ),
  );
}
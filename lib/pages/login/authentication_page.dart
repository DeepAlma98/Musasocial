import 'package:flutter/material.dart';
import 'package:musasocial/pages/login/login_banner.dart';
import 'package:musasocial/utils/themes.dart';

import '../signup/signup.dart';

class AuthenticationPage extends StatefulWidget {
  final String role;
  const AuthenticationPage({super.key, required this.role});

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  bool _showLoginBanner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusaTheme.colorBackground,
      body: Stack(
        children: [
          // Contenuto principale
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/MUSA_logo.png',
                  fit: BoxFit.contain,
                  height: 70,
                ),
                const SizedBox(height: 70),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 60),
                    backgroundColor: const Color(0xFF40B59F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _showLoginBanner = true;
                    });
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/chiavediviolino.png',
                        fit: BoxFit.contain,
                        height: 50,
                      ),
                      const SizedBox(width: 70),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 60),
                    backgroundColor: MusaTheme.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage(role: widget.role)),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/chiavedibasso.png',
                        fit: BoxFit.contain,
                        height: 35,
                      ),
                      const SizedBox(width: 70),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "for unforgettable events...",
                  style: TextStyle(
                    color: MusaTheme.whiteShade1,
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.20,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/libroDario.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          // Banner login
          if (_showLoginBanner == true)
            LoginBanner(
              onClose: () {
                setState(() {
                  _showLoginBanner = false;
                });
              },
            ),
        ],
      ),
    );
  }
}


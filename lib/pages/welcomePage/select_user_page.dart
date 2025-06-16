import 'package:flutter/material.dart';
import 'package:musasocial/pages/login/authentication_page.dart';
import 'package:musasocial/pages/signup/signup.dart';
import 'package:musasocial/utils/themes.dart';

class SelectUserPage extends StatelessWidget {
  const SelectUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MusaTheme.colorBackground,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chi sei?',
              textAlign: TextAlign.center,
              style: MusaTheme.googleFont.copyWith(
                decoration: TextDecoration.none,
              )),
          SizedBox(height: 20),

          // Bottone Artista
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 60),
                backgroundColor: const Color(0xFF40B59F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthenticationPage(role: 'Artista'),
                  ),
                );
              },
              child: const Text(
                'Artista',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Bottone Organizzatore
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(250, 60),
              backgroundColor: const Color(0xFF40B59F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(role: 'Organizzatore'),
                ),
              );
            },
            child: const Text(
              'Organizzatore',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:musasocial/api/auth/authentication.dart';
import 'package:musasocial/pages/welcomePage/select_user_page.dart';
import 'package:musasocial/providers/user_provider.dart';
import 'package:musasocial/screenLayout/mobile_screen_layout.dart';
import 'package:musasocial/utils/themes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            UserProvider userProvider = UserProvider();
            userProvider.refreshUser();
            return userProvider;
          },
        ),
      ],
      child: MaterialApp(
        title: 'MUSA',
        theme: MusaTheme.lightTheme(),
        darkTheme: MusaTheme.darkTheme(),
        routes: {
          '/welcome': (context) => SelectUserPage(),
        },
        home: FutureBuilder<bool>(
          future: _checkInternetConnection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data == true) {
              return StreamBuilder(
                stream: Authentication().authStateChanges,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MobileScreenLayout();
                  } else {
                    return IntroductionScreen(
                      showDoneButton: true,
                      done: Text('Done',
                          style: TextStyle(color: MusaTheme.buttonColor)),
                      onDone: () => Navigator.of(context)
                          .pushReplacementNamed('/welcome'),
                      next: Text('Next',
                          style: TextStyle(color: MusaTheme.buttonColor)),
                      showSkipButton: true,
                      skip: Text('Skip',
                          style: TextStyle(color: MusaTheme.buttonColor)),
                      onSkip: () => Navigator.of(context)
                          .pushReplacementNamed('/welcome'),
                      pages: [
                        PageViewModel(
                          image: Image.asset(
                            'assets/images/MUSA_logo.png',
                            fit: BoxFit.contain,
                            height: 70,
                          ),
                          body:
                          "Proponiti come artista per un evento oppure recluta un'artista per il tuo evento",
                          title: "Benvenuto in MUSA",
                        ),
                        PageViewModel(
                          image: Lottie.asset(
                              "assets/lottieassets/Animation.json"),
                          body:
                          "Pubblica i tuoi lavori e chatta con l'organizzatore",
                          title: "Fatti conoscere",
                        ),
                        PageViewModel(
                          image: Lottie.asset(
                              "assets/lottieassets/server.json"),
                          body:
                          "Firebase è una piattaforma sviluppata da Google che offre una suite di strumenti e servizi per lo sviluppo di applicazioni mobili e web. È particolarmente utile per gestire funzionalità backend senza dover configurare server complessi",
                          title: "Musa usa Firebase per la gestione dei dati",
                        ),
                      ],
                    );
                  }
                },
              );
            } else {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, size: 100, color: Colors.red),
                      const SizedBox(height: 16),
                      const Text(
                        "Nessuna connessione a Internet",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop(); // Chiude l'app
                        },
                        child: const Text("Chiudi"),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

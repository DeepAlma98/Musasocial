# Musasocial

Applicazione social mobile sviluppata con **Flutter** e **Firebase**: gli utenti possono registrarsi, pubblicare foto, mettere like, commentare, cercare altri profili e seguirli.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![Versione](https://img.shields.io/badge/versione-1.0.0-blue)

## Funzionalità

- Schermata di benvenuto con introduzione all'app
- Registrazione e accesso con Firebase Authentication
- Feed con i post degli utenti
- Pubblicazione di post con immagine, salvata su Firebase Storage
- Like con animazione
- Commenti sotto ai post
- Ricerca degli utenti
- Profilo utente con sistema di follow
- Interfaccia curata con animazioni Lottie, icone SVG e Google Fonts

## Tecnologie utilizzate

| Ambito | Strumenti |
|--------|-----------|
| Framework | Flutter, Dart (SDK `^3.6.2`) |
| Backend | Firebase Authentication, Cloud Firestore, Firebase Storage, Firebase App Check |
| Gestione dello stato | [Provider](https://pub.dev/packages/provider) |
| Interfaccia | `google_fonts`, `font_awesome_flutter`, `flutter_svg`, `lottie`, `introduction_screen`, `flutter_staggered_grid_view`, `flutter_hex_color` |
| Utilità | `image_picker`, `uuid`, `intl`, `connectivity_plus` |

## Requisiti

- [Flutter SDK](https://docs.flutter.dev/get-started/install) con Dart `^3.6.2` (Flutter 3.27 o successivo)
- Android Studio o VS Code con i plugin Flutter e Dart
- Un emulatore o un dispositivo fisico
- Un progetto [Firebase](https://console.firebase.google.com/)

Per verificare l'ambiente:

```bash
flutter doctor
```

## Configurazione di Firebase

1. Crea un progetto dalla [console Firebase](https://console.firebase.google.com/).
2. Abilita **Authentication**, **Cloud Firestore** e **Storage**.
3. Se usi App Check, configuralo per la tua app.
4. Installa la [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) e collega il progetto, così viene rigenerato il file `lib/firebase_options.dart`:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

## Installazione e avvio

1. Clona il repository:
   ```bash
   git clone https://github.com/DeepAlma98/Musasocial.git
   cd Musasocial
   ```

2. Installa le dipendenze:
   ```bash
   flutter pub get
   ```

3. Avvia l'app su un emulatore o su un dispositivo collegato:
   ```bash
   flutter run
   ```

## Struttura del progetto

```
lib/
├── main.dart                     # Punto di ingresso dell'app
├── firebase_options.dart         # Configurazione Firebase generata da FlutterFire
├── api/
│   └── auth/                     # Logica di autenticazione
├── models/                       # Modelli dati (post, user)
├── pages/
│   ├── loading/                  # Schermata di caricamento
│   ├── login/                    # Accesso e banner
│   ├── signup/                   # Registrazione
│   ├── welcomePage/              # Introduzione e scelta utente
│   └── screen/                   # Feed, aggiunta post, commenti, profilo, ricerca
├── providers/                    # Stato dell'utente (Provider)
├── resources/                    # Metodi per Firestore e Storage
├── screenLayout/                 # Layout mobile
├── utils/                        # Temi, variabili globali, funzioni di utilità
└── Widgets/                      # Componenti riutilizzabili (post, commenti, follow, like...)
```

## Autore

Sviluppato da [DeepAlma98](https://github.com/DeepAlma98).

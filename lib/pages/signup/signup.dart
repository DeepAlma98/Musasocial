import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musasocial/api/auth/authentication.dart';
import 'package:musasocial/utils/themes.dart';
import '../../screenLayout/mobile_screen_layout.dart';
import '../../utils/utils.dart';

class SignUpPage extends StatefulWidget {
  final String role;
  const SignUpPage({super.key, required this.role});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedLocation;
  final List<String> _locations = [
    'Milano',
    'Roma',
    'Torino',
    'Napoli',
    'Firenze'
  ];

  final TextEditingController _profileNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;

  bool _isLoading = false;

  Future<void> CreateUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String res = await Authentication().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
        username: _profileNameController.text,
        bio: _bioController.text,
        file: _image ?? await rootBundle.load('assets/images/avatarImmage.png').then((byteData) => byteData.buffer.asUint8List()),
        location: _selectedLocation ?? 'Milano',
        role: widget.role,
      );
      if (res == "success") {
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MobileScreenLayout(),
            ),
          );
        }
      } else {
        if (context.mounted) {
          showSnackBar(context, res);
        }
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, "An error occurred: $e");
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  void dispose() {
    _profileNameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusaTheme.colorBackground,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: const Color(0xFF40B59F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.red,
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/l60Hf.png'),
                          backgroundColor: Colors.red,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF352555),
                ),
              ),
              const SizedBox(height: 24),

              // Profile Name
              TextFormField(
                controller: _profileNameController,
                decoration: InputDecoration(
                  labelText: "Profile Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) =>
                    value!.contains('@') ? null : 'Invalid email',
              ),
              const SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: _bioController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Biography",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) => value!.length > 100
                    ? 'Invalid Biography max 100 characters'
                    : null,
              ),
              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) =>
                    value!.length < 6 ? 'Minimum 6 characters' : null,
              ),
              const SizedBox(height: 16),

              // Location (Dropdown)
              DropdownButtonFormField<String>(
                value: _selectedLocation,
                items: _locations
                    .map(
                        (loc) => DropdownMenuItem(value: loc, child: Text(loc)))
                    .toList(),
                decoration: InputDecoration(
                  labelText: "Location",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (val) {
                  setState(() {
                    _selectedLocation = val;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a location' : null,
              ),

              const SizedBox(height: 32),

              // Submit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MusaTheme.buttonColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: !_isLoading ? CreateUser : null,
                child: !_isLoading
                    ? Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18,
                            color: MusaTheme.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    : CircularProgressIndicator(
                        color: MusaTheme.primaryColor,
                      ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

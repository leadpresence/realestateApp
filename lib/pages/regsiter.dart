import 'package:flutter/material.dart';
import 'package:realeastapp/utils/app_assets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.realbg),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  bottom: 155,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: Text(
                    "PMS Homes",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 30),
                  ))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Welcome Home",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),

              // Centered form
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 55.0),
                              Row(
                                children: [
                                  Text(
                                    'User Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                  labelText: null,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Email',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: null,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Text(
                                    'Password',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              TextFormField(
                                obscuringCharacter: '*',
                                decoration: const InputDecoration(
                                  hintText: 'Passwword',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: null,
                                  border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                              ),
                              const SizedBox(height: 20.0),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Text(
                                    'Confirm Password',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              TextFormField(
                                obscuringCharacter: '*',
                                decoration: const InputDecoration(
                                  hintText: 'Confirm Passwword',
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                  labelText: null,
                                  border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                              ),
                              const SizedBox(height: 20.0),
                              SizedBox(
                                  width: double.infinity,
                                  height: 55.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle button press
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Register(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor:
                                          Colors.white, // Background color
                                      backgroundColor:
                                          Colors.pink[600], // Background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Text('Submit'),
                                  )),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Divider(
                                      color: Colors.white,
                                      thickness: .5,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Text('or'),
                                  const SizedBox(width: 10.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Divider(
                                      thickness: .5,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )))
            ],
          )),
    );
  }
}

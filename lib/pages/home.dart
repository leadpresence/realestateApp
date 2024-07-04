import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realeastapp/pages/login.dart';
import 'package:realeastapp/utils/app_assets.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
                  bottom: 200,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: Text(
                            "PMS Homes",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontSize: 30),
                          )))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Welcome Home",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          )),
    );
  }
}

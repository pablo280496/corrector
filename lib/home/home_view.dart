import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/auth/login.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            backgroundColor: const Color(0xFF1B1B1B),
            title: const Text("Profile"),
            actions: [
              PopupMenuButton(
                  child: const Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text("Logout"),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => LoginView())));
                        },
                      ))
                    ];
                  })
            ],
          ),
          body: AppBar( ) ,
      )
    );
  }
}
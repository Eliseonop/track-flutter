import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trackservice/auth/models/user_model.dart';
import 'package:trackservice/screens/home/pages/settings/components/avatar_component.dart';
import 'package:trackservice/screens/welcome/welcome_screen.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({super.key});

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  User? _user;
  @override
  void initState() {
    super.initState();
    getUserFromSharedPreferences();
  }

  Future<void> getUserFromSharedPreferences() async {
    // await EasyLoading.show(status: 'loading...');
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      final user = User.fromJson(userMap);
      setState(() {
        _user = user;
      });
    }
    // await EasyLoading.dismiss();
  }

  Future<void> logout(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    setState(() {
      _user = null;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_user != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Perfil',
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              const SizedBox(height: 40),
              AvatarComponent(user: _user!),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: () {
                    logout(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[300]),
                    alignment: Alignment.center,
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                  child: const Text("Logout",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ));
    } else {
      return const Center(
        child: Text(''),
      );
    }
  }
}

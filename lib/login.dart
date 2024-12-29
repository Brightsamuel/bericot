import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_animated_login/flutter_animated_login.dart';
import 'package:bericot/homescreen.dart';

ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDark,
      builder: (context, value, child) => MaterialApp(
        title: 'Stocks',
        themeMode: value ? ThemeMode.light : ThemeMode.light,
        theme: value ? ThemeData.light() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: FilledButton(
            onPressed: () => isDark.value = !isDark.value,
            child: value
                ? const Text("Login with OTP")
                : const Text("Login with Password"),
          ),
          body: FlutterAnimatedLogin(
            loginType: value ? LoginType.password : LoginType.otp,
            onLogin: (loginData) {
              // Check if the input is focused before proceeding
              if (FocusScope.of(context).hasFocus) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homescreen()),
                );
              } else {
                // Optionally, you can show a message or handle the case where the input is not focused
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please focus on the input field before logging in.')),
                );
              }
              return null;
            },
            loginConfig: LoginConfig(
              logo: ImageIcon(AssetImage('images/bct.png')),
              title: 'Stocks',
              // subtitle: 'Let\'s Sign In',
            ),
          ),
        ),
      ),
    );
  }
}
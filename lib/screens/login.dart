import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _show = true;

  void _togglevisibility() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Серый круг баурсак
              const CircleAvatar(
                radius: 94,
                backgroundColor: Color(0xffD9D9D9),
              ),
              const SizedBox(height: 20),

              // Заголовок с названием Приложения
              const Text(
                "Welcome to HandyMan!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // Поле Email/Number
              SizedBox(
                height: 52.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Email/Number",
                    filled: true,
                    fillColor: const Color.fromRGBO(50, 161, 230, 0.13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Поле Password
              SizedBox(
                height: 52.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: const Color.fromRGBO(50, 161, 230, 0.13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _togglevisibility();
                      },
                      icon:
                          Icon(_show ? Icons.visibility_off : Icons.visibility),
                      padding: const EdgeInsetsDirectional.only(end: 10.0),
                    ),
                    contentPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20.0,
                    ),
                  ),
                  obscureText: _show,
                  style: _show
                      ? (const TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ))
                      : (const TextStyle()),
                ),
              ),
              const SizedBox(height: 20),

              // Кнопка Login
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 160, vertical: 12),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Ссылка Forgot password
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),

              // Ссылка на регистрацию
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Register!",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

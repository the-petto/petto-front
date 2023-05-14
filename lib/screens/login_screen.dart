import 'package:flutter/material.dart';
import 'package:petto_mobile/controllers/auth_controller.dart';
import 'package:petto_mobile/models/login_view_model.dart';
import 'package:petto_mobile/screens/walk_screen.dart';
import 'package:petto_mobile/widgets/auth_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController authController = AuthController();

  Map<String, String> formData = {};
  bool _showPassword = false;

  void _onSubmitTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        ResponseLoginModel responseLoginModel = await authController.login(
            RequestLoginModel(
                username: formData["username"]!,
                password: formData["password"]!));
        if (responseLoginModel.isSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WalkScreen(),
            ),
          );
        } else {
          // 에러메시지 출력
          print(responseLoginModel.data['message']);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "PETTO",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'username',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Plase write your email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              print(value);
                              if (value != null) {
                                formData['username'] = value;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: !_showPassword,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Plase write your password";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              if (value != null) {
                                formData['password'] = value;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'password',
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(_showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: _onSubmitTap,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(child: Text("로그인")),
                            ),
                          )
                        ],
                      )),
                  const AuthButton(
                    text: "카카오 로그인",
                    imageUrl: 'lib/assets/images/kakao_icon.png',
                    bgColor: Color(0xffFEE500),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

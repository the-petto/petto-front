import 'package:flutter/material.dart';
import 'package:petto_mobile/controllers/auth_controller.dart';
import 'package:petto_mobile/models/login_view_model.dart';
import 'package:petto_mobile/screens/sign_up_screen.dart';
import 'package:petto_mobile/screens/walk_screen.dart';
import 'package:petto_mobile/widgets/auth_button.dart';
import 'package:petto_mobile/widgets/showToast.dart';

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

  void _onSubmitLoginTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        ResponseLoginModel responseLoginModel = await authController.login(
          RequestLoginModel(
            username: formData["username"]!,
            password: formData["password"]!,
          ),
        );
        if (responseLoginModel.isSuccess) {
          ToastComponent.show(context, "로그인에 성공하셨습니다.");
          // print(responseLoginModel.data['accessToken']);
          // print(responseLoginModel.data['refreshToken']);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WalkScreen(),
            ),
          );
        } else {
          ToastComponent.show(context, responseLoginModel.message,
              isError: true);
          print(responseLoginModel.message);
        }
      }
    }
  }

  void _navigateToSignUpPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              return "Please write your email";
                            }
                            return null;
                          },
                          onSaved: (value) {
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
                              return "Please write your password";
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
                          onTap: _onSubmitLoginTap,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(child: Text("로그인")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: _navigateToSignUpPage,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "회원가입",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
    );
  }
}

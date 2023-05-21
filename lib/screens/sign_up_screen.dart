import 'package:flutter/material.dart';
import 'package:petto_mobile/controllers/auth_controller.dart';
import 'package:petto_mobile/models/sign_up_view_model.dart';
import 'package:petto_mobile/screens/login_screen.dart';
import 'package:petto_mobile/widgets/showToast.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController authController = AuthController();

  final Map<String, String> formData = {};
  bool _showPassword = false;

  SignUpScreen({super.key});

  void _onSubmitSignUpTap(BuildContext context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        ResponseSignUpModel responseSignUpModel =
            await authController.signUp(RequestSignUpModel(
          username: formData["username"]!,
          password: formData["password"]!,
          nickname: formData["nickname"]!,
        ));

        if (responseSignUpModel.isSuccess) {
          ToastComponent.show(context, '회원가입이 성공적으로 완료되었습니다.');
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LogInScreen()),
            );
          });
        } else {
          // 에러메시지 출력
          ToastComponent.show(context, responseSignUpModel.message,
              isError: true);
          print(responseSignUpModel.message);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                            return "Please write your username";
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
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please write your nickname";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          if (value != null) {
                            formData['nickname'] = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'nickname',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !_showPassword,
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
                              _showPassword = !_showPassword;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => _onSubmitSignUpTap(context),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(child: Text("회원가입")),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/resourses/componant/round_button.dart';
import 'package:provider_mvvm/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    ValueNotifier<bool> obsecureText = ValueNotifier<bool>(true);
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginViewModel.emailcontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: obsecureText,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: loginViewModel.passwordcontroller,
                    obscureText: obsecureText.value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          obsecureText.value = !obsecureText.value;
                        },
                        child: Icon(obsecureText.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
                loading: loginViewModel.loading,
                hight: 50,
                width: 200,
                title: 'login',
                onPress: () {
                  Map data = {
                    'email': loginViewModel.emailcontroller.text.toString(),
                    'password':
                        loginViewModel.passwordcontroller.text.toString()
                  };
                  loginViewModel.loginApi(data, context);
                },
                color: Colors.grey)
          ],
        ),
      ),
    );
  }
}

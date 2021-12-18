import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identitypass_hack/app/app_route.dart';
import 'package:identitypass_hack/core/ui/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in',
                        style: CsTextStyle.headline4,
                      ),
                      const Gap(30),
                      const InputBox(
                        hintText: 'email@gmail.com',
                        labelText: 'Email',
                        icon: Icons.check,
                      ),
                      const Gap(20),
                      const InputBox(
                        hintText: '........',
                        labelText: 'Password',
                        icon: Icons.visibility,
                      ),
                      const Gap(30),
                      SolidButton(
                        text: 'Sign up',
                        onPressed: () {
                          context.go(Pages.home);
                        },
                      ),
                      const Gap(20),
                      Center(
                        child: Text(
                          'Forgot Password?',
                          style: CsTextStyle.caption,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: CsTextStyle.caption,
                    children: [
                      TextSpan(
                        text: 'Register',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Pages.register);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}

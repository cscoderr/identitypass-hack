import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identitypass_hack/app/app_route.dart';
import 'package:identitypass_hack/core/ui/ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                        'Create Account',
                        style: CsTextStyle.headline4,
                      ),
                      const Gap(30),
                      const InputBox(
                        hintText: 'Marcus Rashford',
                        labelText: 'Full Name',
                        icon: Icons.person,
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: CsTextStyle.caption,
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Pages.landing);
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

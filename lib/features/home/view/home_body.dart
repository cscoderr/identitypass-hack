import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:identitypass_hack/core/ui/ui.dart';
import 'package:identitypass_hack/features/home/cubit/home_cubit.dart';
import 'package:provider/src/provider.dart';

class Homebody extends StatelessWidget {
  const Homebody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: CsTextStyle.caption,
                  ),
                  Text(
                    'Ajao Omolade',
                    style: CsTextStyle.headline6.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/png/user.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: CsColors.secondary),
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 70),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
            color: CsColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Balance',
                style: CsTextStyle.overline.copyWith(
                  color: CsColors.white,
                ),
              ),
              Text(
                'NGN120,000',
                style: CsTextStyle.headline2.copyWith(
                  color: CsColors.white,
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SolidButton(
                  text: 'Fund Wallet',
                  color: CsColors.white,
                  textColor: CsColors.primary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check your polling unit',
                      style: CsTextStyle.headline4.copyWith(
                        fontSize: 24,
                        color: CsColors.primaryText,
                        fontWeight: CsFontWeight.black,
                      ),
                    ),
                    Text(
                      'You will be charge NGN10 per call',
                      style: CsTextStyle.caption.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      "Voter's card number",
                      style: CsTextStyle.caption.copyWith(),
                    ),
                    const InputBox(
                      hintText: '',
                    ),
                    const Gap(20),
                    Text(
                      "Last Name",
                      style: CsTextStyle.caption.copyWith(),
                    ),
                    const InputBox(
                      hintText: '',
                    ),
                    const Gap(20),
                    Text(
                      "State",
                      style: CsTextStyle.caption.copyWith(),
                    ),
                    const InputBox(
                      hintText: '',
                    ),
                    const Gap(30),
                    SolidButton(
                      text: 'Check',
                      onPressed: () {
                        context.read<HomeCubit>().check();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

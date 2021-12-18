import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:identitypass_hack/core/ui/ui.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 207,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: CsColors.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'History',
                    style: CsTextStyle.headline4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

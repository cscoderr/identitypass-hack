import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:identitypass_hack/core/ui/colors.dart';
import 'package:identitypass_hack/core/ui/ui.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            const Gap(20),
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
                  Text(
                    'Chech your polling unit',
                    style: CsTextStyle.headline4.copyWith(
                      fontSize: 24,
                      color: CsColors.primaryText,
                      fontWeight: CsFontWeight.black,
                    ),
                  ),
                  Text(
                      'There are many more candidates on the ballot this year fine the faster way to locate your polling unit.'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: CsColors.primary,
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SalomonBottomBar(
          currentIndex: 0,
          onTap: (i) {},
          unselectedItemColor: CsColors.secondary,
          selectedItemColor: const Color(0xFF3E1C07),
          margin: const EdgeInsets.all(10),
          selectedColorOpacity: 1.0,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: 1 == 1
                  ? SvgPicture.asset('assets/svg/home_selected.svg')
                  : SvgPicture.asset('assets/svg/home.svg'),
              title: Text(
                "Home",
                style: CsTextStyle.caption.copyWith(
                  color: const Color(0xFF3E1C07),
                ),
              ),
              selectedColor: CsColors.white,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: 1 == 2
                  ? SvgPicture.asset('assets/svg/wallet_selected.svg')
                  : SvgPicture.asset('assets/svg/wallet.svg'),
              title: const Text("Wallet"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: 1 == 3
                  ? SvgPicture.asset('assets/svg/user_selected.svg')
                  : SvgPicture.asset('assets/svg/user.svg'),
              title: Text("Profile"),
              selectedColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

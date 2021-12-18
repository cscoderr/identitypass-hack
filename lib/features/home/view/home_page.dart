import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:identitypass_hack/core/repository/api_repository.dart';
import 'package:identitypass_hack/core/ui/colors.dart';
import 'package:identitypass_hack/core/ui/ui.dart';
import 'package:identitypass_hack/features/home/cubit/home_cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<ApiRepository>()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return state.pages[state.currentIndex];
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            color: CsColors.primary,
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SalomonBottomBar(
              currentIndex: state.currentIndex,
              onTap: (i) => context.read<HomeCubit>().onIndexChanged(i),
              unselectedItemColor: CsColors.secondary,
              selectedItemColor: const Color(0xFF3E1C07),
              margin: const EdgeInsets.all(10),
              selectedColorOpacity: 1.0,
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: state.currentIndex == 0
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
                  icon: state.currentIndex == 1
                      ? SvgPicture.asset('assets/svg/wallet_selected.svg')
                      : SvgPicture.asset('assets/svg/wallet.svg'),
                  title: Text(
                    "Wallet",
                    style: CsTextStyle.caption.copyWith(
                      color: const Color(0xFF3E1C07),
                    ),
                  ),
                  selectedColor: CsColors.white,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: state.currentIndex == 2
                      ? SvgPicture.asset('assets/svg/user_selected.svg')
                      : SvgPicture.asset('assets/svg/user.svg'),
                  title: Text(
                    "Profile",
                    style: CsTextStyle.caption.copyWith(
                      color: const Color(0xFF3E1C07),
                    ),
                  ),
                  selectedColor: CsColors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

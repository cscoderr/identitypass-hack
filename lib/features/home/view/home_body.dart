import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:identitypass_hack/core/model/polling_unit.dart';
import 'package:identitypass_hack/core/ui/ui.dart';
import 'package:identitypass_hack/features/home/cubit/home_cubit.dart';

class Homebody extends StatelessWidget {
  const Homebody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.loaded) {
          showResultBottomSheet(context, data: state.pollingUnit);
        }
      },
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Form(
                      key: state.formKey,
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
                            'You will be charge NGN10 per check',
                            style: CsTextStyle.caption.copyWith(
                              color: Colors.red,
                            ),
                          ),
                          const Gap(20),
                          Text(
                            "Voter's card number",
                            style: CsTextStyle.caption.copyWith(),
                          ),
                          InputBox(
                            hintText: '',
                            onChanged:
                                context.read<HomeCubit>().onVoterNumberChanged,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Voter's number cannot be empty";
                              }
                            },
                          ),
                          const Gap(20),
                          Text(
                            "Last Name",
                            style: CsTextStyle.caption.copyWith(),
                          ),
                          InputBox(
                            hintText: '',
                            onChanged:
                                context.read<HomeCubit>().onLastNameChanged,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last Name cannot be empty";
                              }
                            },
                          ),
                          const Gap(20),
                          Text(
                            "State",
                            style: CsTextStyle.caption.copyWith(),
                          ),
                          InputBox(
                            hintText: '',
                            onChanged: context.read<HomeCubit>().onStateChanged,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "State cannot be empty";
                              }
                            },
                          ),
                          const Gap(30),
                          SolidButton(
                            text: 'Check',
                            isLoading: state.status == HomeStatus.loading,
                            onPressed: () => state.status == HomeStatus.loading
                                ? null
                                : () => context.read<HomeCubit>().check(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showResultBottomSheet(BuildContext context, {PollingUnit? data}) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Column(
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: const BoxDecoration(
                    color: CsColors.secondary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Result',
                    style: CsTextStyle.headline4,
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('First Name'),
                        subtitle: Text(data!.firstName!),
                      ),
                      const Gap(20),
                      ListTile(
                        title: const Text('Last Name'),
                        subtitle: Text(data.lastName!),
                      ),
                      const Gap(20),
                      ListTile(
                        title: const Text('Gender'),
                        subtitle: Text(data.gender!),
                      ),
                      const Gap(20),
                      ListTile(
                        title: const Text("Voter's Number"),
                        subtitle: Text(data.vin!),
                      ),
                      const Gap(20),
                      ListTile(
                        title: const Text('Date of Birth'),
                        subtitle: Text(data.dateOfBirth!),
                      ),
                      const Gap(20),
                      ListTile(
                        title: const Text('Polling Unit'),
                        subtitle: Text(data.pollingUnit!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

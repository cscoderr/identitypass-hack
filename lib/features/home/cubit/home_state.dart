part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  failure,
  loaded,
  intial,
}

class HomeState extends Equatable {
  const HomeState({
    this.currentIndex = 0,
    this.pages = const [
      Homebody(),
      WalletPage(),
      ProfilePage(),
    ],
    this.voterNumber = '',
    this.lastName = '',
    this.state = '',
    this.formKey,
    this.status = HomeStatus.intial,
    this.pollingUnit = const PollingUnit(),
  });

  HomeState copyWith(
      {int? currentIndex,
      List<Widget>? pages,
      String? voterNumber,
      String? lastName,
      String? state,
      GlobalKey<FormState>? formKey,
      HomeStatus? status,
      PollingUnit? pollingUnit}) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pages ?? this.pages,
      voterNumber: voterNumber ?? this.voterNumber,
      lastName: lastName ?? this.lastName,
      state: state ?? this.state,
      formKey: formKey ?? this.formKey,
      status: status ?? this.status,
      pollingUnit: pollingUnit ?? this.pollingUnit,
    );
  }

  final int currentIndex;
  final List<Widget> pages;
  final String voterNumber;
  final String lastName;
  final String state;
  final GlobalKey<FormState>? formKey;
  final HomeStatus status;
  final PollingUnit pollingUnit;

  @override
  List<Object?> get props => [
        currentIndex,
        pages,
        voterNumber,
        lastName,
        state,
        formKey,
        status,
        pollingUnit,
      ];
}

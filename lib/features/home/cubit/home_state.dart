part of 'home_cubit.dart';

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
  });

  HomeState copyWith({
    int? currentIndex,
    List<Widget>? pages,
    String? voterNumber,
    String? lastName,
    String? state,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pages ?? this.pages,
      voterNumber: voterNumber ?? this.voterNumber,
      lastName: lastName ?? this.lastName,
      state: state ?? this.state,
    );
  }

  final int currentIndex;
  final List<Widget> pages;
  final String voterNumber;
  final String lastName;
  final String state;

  @override
  // TODO: implement props
  List<Object?> get props => [currentIndex, pages];
}

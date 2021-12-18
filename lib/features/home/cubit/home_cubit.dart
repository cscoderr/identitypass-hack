import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:identitypass_hack/core/repository/api_repository.dart';
import 'package:identitypass_hack/features/home/view/view.dart';
import 'package:identitypass_hack/features/profile/view/profile_page.dart';
import 'package:identitypass_hack/features/wallet/wallet.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._apiRepository) : super(const HomeState());

  final ApiRepository _apiRepository;

  void onIndexChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void check() {
    _apiRepository.getPollingUnit(
        number: '987f545AJ67890', lastName: 'test', state: 'Lagos');
  }
}

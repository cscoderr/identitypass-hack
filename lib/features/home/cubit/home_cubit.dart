import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:identitypass_hack/core/model/polling_unit.dart';
import 'package:identitypass_hack/core/repository/api_repository.dart';
import 'package:identitypass_hack/features/home/view/view.dart';
import 'package:identitypass_hack/features/profile/view/profile_page.dart';
import 'package:identitypass_hack/features/wallet/wallet.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._apiRepository) : super(const HomeState()) {
    emit(state.copyWith(formKey: GlobalKey<FormState>()));
  }

  final ApiRepository _apiRepository;

  void onIndexChanged(int index) {
    emit(state.copyWith(currentIndex: index, status: HomeStatus.intial));
  }

  void onVoterNumberChanged(String number) {
    emit(state.copyWith(voterNumber: number, status: HomeStatus.intial));
  }

  void onLastNameChanged(String name) {
    emit(state.copyWith(lastName: name, status: HomeStatus.intial));
  }

  void onStateChanged(String states) {
    emit(state.copyWith(state: states, status: HomeStatus.intial));
  }

  Future<void> check() async {
    try {
      if (!state.formKey!.currentState!.validate()) return;
      emit(state.copyWith(status: HomeStatus.loading));
      final response = await _apiRepository.getPollingUnit(
        number: state.voterNumber,
        lastName: state.lastName,
        state: state.state,
      );
      emit(state.copyWith(status: HomeStatus.loaded, pollingUnit: response));
    } on PollingUnitError {
      emit(state.copyWith(status: HomeStatus.failure));
    } on PollingUnitNotFound {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}

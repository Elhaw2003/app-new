import 'package:app_new/featuers/auth/sign_up/presentation/controller/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/register_rebo.dart';
class RegisterCubit extends Cubit<SignUpStates> {
  RegisterCubit({required this.registerRepo}) : super(SignUpInitialState());

  final RegisterRebo registerRepo;
  Future<void> register(
      {required String email,
        required String password,
        required BuildContext context}) async {
    emit(SignUpLoadingState());
    var result = await   registerRepo.registerReboFunction(email: email, password: password, context: context);

    result.fold(
            (left){

          emit(SignUpFailureState(errorMessage: left.message));
        } ,
            (right) {
          emit(SignUpSuccessState());
        }
    );

  }
}
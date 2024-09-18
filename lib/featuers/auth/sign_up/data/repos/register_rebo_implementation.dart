import 'package:app_new/featuers/auth/sign_up/data/repos/register_rebo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../../core/errors/failure.dart';

class RegisterFirebaseImplementation implements RegisterRebo {
  @override
  Future<Either<Failure, void>> registerReboFunction(
      {required String email,
        required String password,
        required BuildContext context}) async {
    // TODO: implement registerReboFunction
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // emit(RegisterSuccessState());

      return right(null);
      // success  --> > >> > >  >  >  >
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //   failure

        return left(FirebaseFailure(message: "weak-password"));
      } else if (e.code == 'email-already-in-use') {
        //   failure

        return left(FirebaseFailure(message: "email-already-in-use"));
      } else {
        return left(FirebaseFailure(message: "Error"));
      }
    } catch (e) {
      //   failure

      return left(FirebaseFailure(message: "errorMessage"));

      // print(e.toString());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/failure.dart';

abstract class RegisterRebo{
  Future<Either< Failure, void >>  registerReboFunction({
    required  String email,
    required String password,
    required BuildContext context,
  });
}
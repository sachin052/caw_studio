import 'package:caw_studio/core/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);
}
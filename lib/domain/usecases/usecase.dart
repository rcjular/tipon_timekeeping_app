// domain/usecases/usecase.dart
// ignore_for_file: avoid_types_as_parameter_names

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {}

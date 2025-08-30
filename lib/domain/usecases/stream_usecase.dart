// domain/usecases/stream_usecase.dart
// ignore_for_file: avoid_types_as_parameter_names

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

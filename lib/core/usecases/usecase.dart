/// Base interface for standard asynchronous use cases returning a [Future].
abstract class UseCase<T, Params> {
  const UseCase();

  Future<T> call(Params params);
}

/// Base interface for reactive use cases returning a [Stream].
abstract class StreamUseCase<T, Params> {
  const StreamUseCase();

  Stream<T> call(Params params);
}

/// Parameter object used when a usecase requires no input arguments.
class NoParams {
  const NoParams();
}

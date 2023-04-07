abstract class MyError implements Error {
  final String message;
  MyError({required this.message});

  @override
  StackTrace? get stackTrace;
}

class TokenError extends MyError {
  TokenError({required String message})
      : super(
          message: 'TOKEN ERROR: $message',
        );

  @override
  StackTrace? get stackTrace => StackTrace.empty;
}

class CustomDioError extends MyError {
  CustomDioError({required String message})
      : super(message: 'DIO ERROR: $message');
  @override
  StackTrace? get stackTrace => StackTrace.empty;
}

class ViewModelError extends MyError {
  ViewModelError({required String message})
      : super(message: 'VIEW MODEL ERROR: $message');
  @override
  StackTrace? get stackTrace => StackTrace.empty;
}


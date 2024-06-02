class Failure {
  final String message;
  final StackTrace? stackTrace;
  final String? errorInfo;
  final int? errorCode;
  const Failure({
    required this.message,
    this.stackTrace,
    this.errorInfo,
    this.errorCode,
  });

  // tostring
  @override
  String toString() {
    return '[Failure] message: $message, stackTrace: $stackTrace, errorInfo: $errorInfo, errorCode: $errorCode';
  }
}

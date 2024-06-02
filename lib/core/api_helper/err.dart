import 'dart:io' show HttpException, SocketException;

String getErrorMessage(dynamic e) {
  if (e is SocketException) {
    return 'Network Error: No internet connection\nErr: ERR420';
  } else if (e is HttpException) {
    return e.message;
  } else if (e is TypeError) {
    return 'Type Error: Something went wrong!\nErr: ERR414';
  } else {
    return 'Aw snap: Something went wrong! Type: ${e.runtimeType}\nMessege: $e\nErr: ERR413';
  }
}

String getCustomHttpErrorMessage(int statusCode) {
  final errorMessages = {
    400: 'Bad Request: The client sent a malformed request.\nErr: ERR400',
    401: 'Unauthorized: Authentication is required or failed.\nErr: ERR401',
    403: 'Forbidden: The client does not have permission to access the resource.\nErr: ERR403',
    404: 'Not Found: The requested resource was not found.\nErr: ERR404',
    405: 'Wrong Methods: API Request Methods Not Allowed.\nErr: ERR405',
    500: 'Internal Server Error: There was an unexpected server error.\nErr: ERR500',
    // Add more custom error messages as needed.
  };

  // Check if a custom message exists for the given status code.
  return errorMessages[statusCode] ?? 'Aw snap: Something went wrong\nErr: ERR413';
}

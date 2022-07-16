
import 'package:flutter_mechine_test/web_service/error_handler/error_handler.dart';

class BaseModel<T> {
  ErrorHandler? _error;
  T? data;

  setException(ErrorHandler error) {
    _error = error;
  }

  setData(T data) {
    this.data = data;
  }

  get getException {
    return _error;
  }
}
class Resource<T> {
  bool? isLoading;
  T? data;
  Error? error;

  Resource({
    this.isLoading,
    this.data,
    this.error,
  });
}

class Error<T> {
  String? message;
  String? code;
  T? data;

  Error({this.message, this.data, this.code});
}

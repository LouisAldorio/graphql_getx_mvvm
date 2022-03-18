class Resource<T> {
  T? data;
  Error? error;
  Metadata? metadata;

  Resource({
    this.data,
    this.error,
    this.metadata
  });
}

class Error {
  String? message;
  Map<String, dynamic>? extensions;

  Error({this.message, this.extensions});
}

class Metadata {
  int? total;
  int? currentPage;
  int? totalPages;

  Metadata({this.currentPage, this.total, this.totalPages});
}

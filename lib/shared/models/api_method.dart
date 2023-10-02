enum ApiMethod {
  post,
  get,
  patch,
  delete,
  put;

  static ApiMethod convertStringToApiMethod(final String value) {
    switch (value) {
      case 'POST':
        return ApiMethod.post;
      case 'GET':
        return ApiMethod.get;
      case 'DELETE':
        return ApiMethod.delete;
      case 'PUT':
        return ApiMethod.put;
      case 'PATCH':
        return ApiMethod.patch;
    }

    return ApiMethod.get;
  }
}

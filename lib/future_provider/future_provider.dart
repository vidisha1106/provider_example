class Data {
  static Future<String> fetchAddress() {
    return Future.delayed(
      const Duration(seconds: 5),
      () => 'Hello Flutter',
    );
  }
}

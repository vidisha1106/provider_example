class Data {
  static Future<String> fetchData() {
    return Future.delayed(
      const Duration(seconds: 5),
      () => 'Hello Flutter',
    );
  }
}

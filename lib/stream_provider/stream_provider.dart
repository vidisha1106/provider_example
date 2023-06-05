Stream<int> countStream() {
  return Stream<int>.periodic(
    Duration(seconds: 2),
    (computationCount) => computationCount,
  ).take(80);
}

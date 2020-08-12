class Love {
  final String percentage;
  final String result;
  final String maleName;
  final String femaleName;

  Love({
    this.percentage,
    this.result,
    this.maleName,
    this.femaleName,
  });
  factory Love.fromJson(Map<String, dynamic> json) {
    return Love(
        maleName: json['sname'],
        femaleName: json['fname'],
        percentage: json['percentage'],
        result: json['result']);
  }
}
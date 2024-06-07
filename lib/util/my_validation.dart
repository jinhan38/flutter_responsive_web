class MyValidation {
  /// 이메일 유효성 체크
  static bool isEmail(String text) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return emailRegExp.hasMatch(text);
  }

  static bool questionTitle(String text) => text.length >= 5;

  static bool questionName(String text) => text.length >= 2;

  static bool questionContent(String text) => text.length >= 10;
}

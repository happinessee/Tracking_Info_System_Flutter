class StringProcessing {
  static String removeSpaceDash(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r"[ -]"), "");
  }

  static String dashToSpace(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp('-'), ' ');
  }
}

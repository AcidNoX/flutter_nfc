class NfcResult {
  String data, scheme, language;

  NfcResult.fromJson(Map json) {
    this.data = json['data'];
    this.scheme = json['scheme'];
    this.language = json['language'];
  }
}
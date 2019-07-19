class QueryString {
  // ignore: non_constant_identifier_names
  int event_id;
  String keyword;
  // ignore: non_constant_identifier_names
  String keyword_or;
  int ym;
  int ymd;
  String nickname;
  // ignore: non_constant_identifier_names
  String owner_nickname;
  // ignore: non_constant_identifier_names
  int series_id;
  // int start;
  int order;
  int count;
  String format;
  String get(int firstNum) {
    String query = "?";
    if (keyword != null && keyword.length > 0) {
      query += "keyword=" + keyword + "&";
    }
    if (ym != null && ym != 0) {
      query += "ym=" + ym.toString() + "&";
    }
    if (ym != null && firstNum != 0) {
      query += "start=" + firstNum.toString() + "&";
    }
    return query;
  }
}

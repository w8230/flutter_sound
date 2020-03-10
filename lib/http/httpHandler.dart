import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// AppCertified {App Key 인증}
Future<int> AppCertified(String idx) async {
  final url = 'http://192.168.1.31:8888/mobile_connection?idx=$idx';
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return int.parse(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('데이터 요청에 실패하였습니다.');
  }
}
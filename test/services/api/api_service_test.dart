import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:svuce_app/services/api_service.dart';
import 'dart:convert';

import 'mock_data.dart';

class MockClient extends Mock implements http.Client {}

main() {
  final String url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  final client = MockClient();
  final headers = {"Accept": "application/json"};
  final fetchUrl = Uri.encodeFull(url);

  final APIService apiService = APIService(client);

  group('Fetch data Using API', () {
    test('returns data if the http call completes successfully', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.

      when(client.get(fetchUrl, headers: headers))
          .thenAnswer((_) async => http.Response(responseString, 200));

      JsonDecoder _decoder = new JsonDecoder();
      var result = _decoder.convert(responseString);

      expect(await apiService.fetchData(url: fetchUrl), result);
    });

    test('throws an exception if the http call completes with an error', () {
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(fetchUrl, headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiService.fetchData(url: url), throwsException);
    });
  });
}
// data/datasources/user_rest_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/member_dto.dart';
import 'base_remote_datasource.dart';

class RestMemberRemoteDataSource implements BaseRemoteDataSource<MemberDto> {
  final String baseUrl;
  final http.Client client;

  RestMemberRemoteDataSource({required this.baseUrl, required this.client});

  @override
  Future<MemberDto?> getById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return MemberDto.fromFirestore(data, 'memberid', 'membername', 'department', 'teamleaderid');
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load user');
    }
  }
}

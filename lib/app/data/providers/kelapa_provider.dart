import 'package:dio/dio.dart';
import 'package:kelapa_hakam/app/data/base_api.dart';
import 'package:kelapa_hakam/app/data/models/kelapa_model.dart';
import 'package:kelapa_hakam/app/data/models/kelapa_user_model.dart';
import 'package:kelapa_hakam/app/data/models/user_model.dart';

class KelapaProvier {
  final _dio = Dio();

  Future<List<KelapaModel>> getAll() async {
    try {
      final response = await _dio.get('$baseUrl/kelapa?select=*',
          options: Options(
              headers: {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'}));

      List<dynamic> data = response.data;

      if (response.statusCode == 200) {
        return data.map((e) => KelapaModel.fromJson(e)).toList();
      } else {
        throw Exception('Gagal Load Data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<UserModel>> fetchKaryawan() async {
    try {
      final response = await _dio.get(
        '$baseUrl/users?select=*',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Authorization': 'Bearer $apiKey',
          },
        ),
      );
      List<dynamic> data = response.data;
      if (response.statusCode == 200) {
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<dynamic>> getNameKaryawan() async {
    try {
      final response = await _dio.get('$baseUrl/users?select=nama',
          options: Options(
              headers: {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'}));

      List<dynamic> data = response.data;

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception('Gagal Load Data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<UserModel>> getKaryawan() async {
    try {
      final response = await _dio.get(
        '$baseUrl/users?select=*',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Authorization': 'Bearer $apiKey',
          },
        ),
      );
      List<dynamic> data = response.data;
      if (response.statusCode == 200) {
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<KelapaUserModel>> getKelapaUser() async {
    try {
      final response = await _dio.get(
          '$baseUrl/kelapa?select=id,kilo,users(id,nama)',
          options: Options(
              headers: {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'}));

      List<dynamic> data = response.data;

      if (response.statusCode == 200) {
        return data.map((e) => KelapaUserModel.fromJson(e)).toList();
      } else {
        throw Exception('Gagal Load Data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

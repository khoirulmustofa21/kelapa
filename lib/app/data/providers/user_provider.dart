import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:kelapa_hakam/app/data/base_api.dart';
import 'package:kelapa_hakam/app/data/models/user_model.dart';

class UserProvider {
  final _dio = Dio();

  Future<List<UserModel>> fetchData() async {
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

  Future<bool> deleteKelapa(int? id) async {
    final response = await _dio.delete(
      "$baseUrl/kelapa?id_user=eq.$id",
      options: Options(
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
        },
      ),
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteData(int? id) async {
    final response = await _dio.delete(
      "$baseUrl/users?id=eq.$id",
      options: Options(
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
        },
      ),
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postData(
      {String? nama,
      String? gudang,
      String? bidang,
      double? totalKilo,
      double? gaji}) async {
    Map<String, dynamic> payload() {
      final Map<String, dynamic> data = {};
      data['nama'] = nama;
      data['bidang'] = bidang;
      data['total_kilo'] = totalKilo;
      data['gaji'] = gaji;
      data['gudang'] = gudang;
      return data;
    }

    final headers = {
      "apikey": apiKey,
      "Authorization": apiKey,
      "Content-Type": "application/json",
      "Prefer": "return=minimal"
    };

    final response = await _dio.post(
      '$baseUrl/users',
      data: payload(),
      options: Options(headers: headers),
    );

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print("Data berhasil dikirim.");
      }
      return true;
    } else {
      if (kDebugMode) {
        print("Gagal mengirim data. Status code: ${response.statusCode}");
      }
      return false;
    }
  }

  Future<bool> update({
    int? id,
    String? nama,
    String? gudang,
    String? bidang,
    double? totalKilo,
    double? gaji,
  }) async {
    Map<String, dynamic> payload() {
      final Map<String, dynamic> data = {};
      data['nama'] = nama;
      data['bidang'] = bidang;
      data['total_kilo'] = totalKilo;
      data['gaji'] = gaji;
      data['gudang'] = gudang;
      return data;
    }

    final headers = {
      "apikey": apiKey,
      "Authorization": apiKey,
      "Content-Type": "application/json",
      "Prefer": "return=minimal"
    };
    final response = await _dio.patch(
      '$baseUrl/users?id=eq.$id',
      data: payload(),
      options: Options(headers: headers),
    );

    if (response.statusCode == 204) {
      if (kDebugMode) {
        print('Berhasil Update');
      }
    } else {
      if (kDebugMode) {
        print('gagal uploud');
      }
    }

    return true;
  }
}

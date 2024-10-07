import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AdminServices {
  final Dio _dio = Dio();
  final String baseUrl = 'http://172.16.1.105:3000';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

//// Récupération du nombre total d'utilisateurs
  Future<Map<String, dynamic>?> getTotalUsers() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/total-users',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("Total users fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {"totalUsers": response.data['totalUsers']};
      } else {
        print(
            "Failed to fetch total users: Status code ${response.statusCode}");
        return {"totalUsers": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"totalUsers": "Exception: $e"};
    }
  }

  // total clients //
  Future<Map<String, dynamic>?> getTotalClients() async {
    try {
      String? token = await getToken();
      if (token == null) {
        print("Token not found");
        return null;
      }
      Response response = await _dio.get(
        '$baseUrl/admin/total-clients',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

// total admins //
  Future<Map<String, dynamic>?> getTotalAdmins() async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/total-admins',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // total attestations //
  Future<Map<String, dynamic>?> getTotalAttestations() async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/total-attestations',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // total reclamations //
  Future<Map<String, dynamic>?> getTotalReclamations() async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/total-reclamations',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // total AttestationStage //
  Future<Map<String, dynamic>?> getTotalAttestationStage() async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/total-attestations-stage',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // activities //
  Future<Map<String, dynamic>?> getUserActivities() async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/activities',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // filter users //
  Future<Map<String, dynamic>?> filterUsers(
      Map<String, dynamic> filters) async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/filter-users',
          queryParameters: filters,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // filter attestations //
  Future<Map<String, dynamic>?> filterAttestations(
      Map<String, dynamic> filters) async {
    String? token = await getToken();
    if (token == null) return null;
    try {
      var response = await _dio.get('$baseUrl/admin/filter-attestations',
          queryParameters: filters,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //  bannir un user
  Future<bool> banUser(String userId) async {
    String? token = await getToken();
    if (token == null) return false;
    try {
      var response = await _dio.put('$baseUrl/user/ban/$userId',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  // ajouter admin
  Future<bool> addAdmin(Map<String, dynamic> adminData) async {
    String? token = await getToken();
    if (token == null) return false;
    try {
      var response = await _dio.post('$baseUrl/user/admin',
          data: adminData,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  // effacer une  attestation
  Future<bool> deleteAttestation(String attestationId) async {
    String? token = await getToken();
    if (token == null) return false;
    try {
      var response = await _dio.delete('$baseUrl/attestation/$attestationId',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }
}

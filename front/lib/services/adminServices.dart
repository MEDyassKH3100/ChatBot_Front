import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminServices {
  final Dio _dio = Dio();
  final String baseUrl = 'http://192.168.1.102:3000';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

// Récupération du nombre total des Users //
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

  // Récupération du nombre total des Clients //
  Future<Map<String, dynamic>?> getTotalClients() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/total-clients',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("totalClients fetched successfully");
        
        return {"totalClients": response.data['totalClients']};
      } else {
        print(
            "Failed to fetch totalClients: Status code ${response.statusCode}");
        return {"totalClients": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"totalClients": "Exception: $e"};
    }
  }

// Récupération du nombre total des Admins //
  Future<Map<String, dynamic>?> getTotalAdmins() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/total-admins',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("totalAdmins fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {"totalAdmins": response.data['totalAdmins']};
      } else {
        print(
            "Failed to fetch totalAdmins: Status code ${response.statusCode}");
        return {"totalAdmins": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"totalAdmins": "Exception: $e"};
    }
  }

// Récupération du nombre total des Attestations //
  Future<Map<String, dynamic>?> getTotalAttestations() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/total-attestations',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("totalAttestations fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {"totalAttestations": response.data['totalAttestations']};
      } else {
        print(
            "Failed to fetch totalAttestations: Status code ${response.statusCode}");
        return {"totalAttestations": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"totalAttestations": "Exception: $e"};
    }
  }

  // total Reclamations //

  Future<Map<String, dynamic>?> getTotalReclamations() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/total-reclamations',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("totalReclamations fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {"totalReclamations": response.data['totalReclamations']};
      } else {
        print(
            "Failed to fetch totalReclamations: Status code ${response.statusCode}");
        return {"totalReclamations": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"totalReclamations": "Exception: $e"};
    }
  }

  // total Attestations du stage  //

  Future<Map<String, dynamic>?> getTotalAttestationStage() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/total-attestations-stage',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("totalAttestationsStage fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {
          "totalAttestationsStage": response.data['totalAttestationsStage']
        };
      } else {
        print(
            "Failed to fetch totalAttestationsStage: Status code ${response.statusCode}");
        return {"totalAttestationsStage": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"totalAttestationsStage": "Exception: $e"};
    }
  }

  // activities //

  Future<Map<String, dynamic>?> getUserActivities() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/activities',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("activities fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {
          "activities": response.data['activities']
        };
      } else {
        print(
            "Failed to fetch activities: Status code ${response.statusCode}");
        return {"activities": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"activities": "Exception: $e"};
    }
  }

  // filter users //
  Future<Map<String, dynamic>?> filterUsers() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/filter-users',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("users fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {
          "users": response.data['users']
        };
      } else {
        print(
            "Failed to fetch users: Status code ${response.statusCode}");
        return {"users": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"users": "Exception: $e"};
    }
  }

  // filter attestations //
 Future<Map<String, dynamic>?> filterAttestations() async {
    String? token = await getToken();
    if (token == null) {
      print("Token not found");
      return null;
    }

    try {
      Response response = await _dio.get(
        '$baseUrl/admin/filter-attestations',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("Attestations fetched successfully");
        // Assurez-vous que les données renvoyées contiennent la clé 'totalUsers'
        return {
          "Attestations": response.data['Attestations']
        };
      } else {
        print(
            "Failed to fetch Attestations: Status code ${response.statusCode}");
        return {"Attestations": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      print('Error occurred: $e');
      return {"Attestations": "Exception: $e"};
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

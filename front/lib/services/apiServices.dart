import 'package:dio/dio.dart';
import 'package:front/models/Attestation.dart';
import 'package:front/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://192.168.1.102:3000';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

  // Fetch a user from the server
  Future<User?> getUser(String userId) async {
    try {
      Response response = await _dio.get('$baseUrl/user/$userId');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        print('Failed to load user: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  // Send user data to the server
  Future<bool> createUser(User user) async {
    try {
      Map<String, dynamic> userData = user.toJson();
      Response response = await _dio.post('$baseUrl/user', data: userData);
      if (response.statusCode == 200) {
        print('User created successfully');
        return true;
      } else {
        print('Failed to create user: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  // Update a user on the server
  Future<bool> updateUser(String userId, User user) async {
    try {
      Map<String, dynamic> userData = user.toJson();
      Response response =
          await _dio.put('$baseUrl/user/$userId', data: userData);
      if (response.statusCode == 200) {
        print('User updated successfully');
        return true;
      } else {
        print('Failed to update user: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

//login
  Future<User?> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/user/login',
        data: {
          "email": email,
          "mdp": password,
        },
      );

      if (response.statusCode == 200) {
        print("Login successful");
        print(response.data);
        // Stockez le token dans le stockage sécurisé
        await _storage.write(key: "token", value: response.data['token']);

        return User.fromJson(response.data);
        // Assuming response contains user data
      } else {
        print('Failed to login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

//register
  Future<bool> register(String email, String password, String nom,
      String prenom, int cin, String identifiant) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/user',
        data: {
          "email": email,
          "mdp": password,
          "nom": nom,
          "prenom": prenom,
          "cin": cin,
          "identifiant": identifiant,
          
        },
      );

      if (response.statusCode == 200) {
        print("Inscription réussie. Veuillez vérifier votre e-mail.");
        return true; // Retourne vrai si l'inscription est réussie
      } else {
        print('Inscription échouée: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erreur lors de l\'inscription: $e');
      return false;
    }
  }

// Fetch user profile
  Future<User?> getProfile() async {
    try {
      String? token = await getToken();
      if (token == null) {
        print("Token not found");
        return null;
      }
      Response response = await _dio.get(
        '$baseUrl/user/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data['user']);
      } else {
        print('Failed to load user profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  // Update user profile

  Future<bool> updateProfile(User user) async {
    try {
      String? token = await getToken();
      if (token == null) {
        print("Token not found");
        return false;
      }
      Map<String, dynamic> userData = user.toJson();
      Response response = await _dio.put(
        '$baseUrl/user/profile',
        data: userData,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        print('User profile updated successfully');
        return true;
      } else {
        print('Failed to update user profile: ${response.statusCode}');
        print(
            'Error details: ${response.data}'); // Ajouté pour plus de détails sur l'erreur
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  // Demander la réinitialisation du mot de passe (Forgot Password)
Future<bool> forgotPassword(String email) async {
  try {
    Response response = await _dio.post(
      '$baseUrl/user/forgotpassword',
      data: {"email": email},
    );
    if (response.statusCode == 200) {
      print('Forgot password request successful');
      return true;
    } else {
      print('Failed to request forgot password: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error occurred in forgot password: $e');
    return false;
  }
}

// Réinitialiser le mot de passe (Reset Password)
Future<bool> resetPassword(String otp, String newPassword) async {
  try {
    Response response = await _dio.post(
      '$baseUrl/user/resetpassword',
      data: {"otp": otp, "mdp": newPassword},
    );
    if (response.statusCode == 200) {
      print('Password reset successful');
      return true;
    } else {
      print('Failed to reset password: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error occurred in password reset: $e');
    return false;
  }
}

Future<Attestation?> createAttestation(Attestation attestation) async {
  try {
    String? token = await getToken();
    Response response = await _dio.post(
      '$baseUrl/attestation',
      data: attestation.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'})
    );
    if (response.statusCode == 200) {
      return Attestation.fromJson(response.data);
    } else {
      print("Échec de la création de l'attestation : ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print('Erreur survenue : $e');
    return null;
  }
}




  // Méthode pour obtenir toutes les attestations
  Future<List<Attestation>?> getAllAttestations() async {
    try {
      String? token = await getToken();
      Response response = await _dio.get(
        '$baseUrl/attestation',
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        return data.map((json) => Attestation.fromJson(json)).toList();
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }

  // Méthode pour obtenir une attestation par ID
  Future<Attestation?> getAttestationById(String id) async {
    try {
      String? token = await getToken();
      Response response = await _dio.get(
        '$baseUrl/attestation/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      if (response.statusCode == 200) {
        return Attestation.fromJson(response.data);
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }

  // Méthode pour mettre à jour une attestation
  Future<bool> updateAttestation(String id, Attestation attestation) async {
    try {
      String? token = await getToken();
      Response response = await _dio.put(
        '$baseUrl/attestation/$id',
        data: attestation.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
    }
    return false;
  }

  // Méthode pour supprimer une attestation
  Future<bool> deleteAttestation(String id) async {
    try {
      String? token = await getToken();
      Response response = await _dio.delete(
        '$baseUrl/attestation/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
    }
    return false;
  }

  // Méthode pour générer un PDF d'attestation
  Future<bool> generateAttestationPDF(String id) async {
    try {
      String? token = await getToken();
      Response response = await _dio.post(
        '$baseUrl/attestation/generate-pdf/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error occurred: $e');
    }
    return false;
  }

    // Méthode pour générer un PDF de demande de stage
  Future<bool> generateStageRequestPDF(Map<String, dynamic> requestData) async {
    try {
      String? token = await getToken();
      if (token == null) {
        print("Token not found");
        return false;
      }
      Response response = await _dio.post(
        '$baseUrl/attestation/generate-stage-request-pdf',
        data: requestData,
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      if (response.statusCode == 200) {
        print('PDF generation successful');
        return true;
      } else {
        print('Failed to generate PDF: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred in generating PDF: $e');
      return false;
    }
  }
} 


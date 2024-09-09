import 'package:dio/dio.dart';
import 'package:front/models/user.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://192.168.1.59:3000';

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
      if (response.statusCode == 201) {
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
      Response response = await _dio.put('$baseUrl/user/$userId', data: userData);
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
      return User.fromJson(response.data); // Assuming response contains user data
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
//register
Future<bool> register(String email, String password, String nom, String prenom, int cin, String identifiant) async {
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







//verifyemail 








}

/* import 'package:flutter/material.dart';
import 'package:front/screens/admin/user_view.dart/userProfileScreen.dart';
import 'package:front/services/adminServices.dart';


class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final AdminServices adminServices = AdminServices();
  TextEditingController searchController = TextEditingController();
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

void fetchUsers({String query = ''}) async {
  var result = await adminServices.filterUsers(query: query);
  if (result != null && result['users'] != null) {
    print('Type of users: ${result['users'].runtimeType}'); // Pour déboguer le type de 'users'
    if (result['users'] is List) {
      setState(() {
        users = List.from(result['users']); // Assurez-vous que c'est traité comme une liste
      });
    } else {
      print('Data received is not a list: ${result['users']}'); // Affiche les données erronées pour le débogage
      setState(() {
        users = [];
      });
    }
  } else {
    print('Error fetching users or users key is null');
    setState(() {
      users = [];
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gérer les Utilisateurs'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Rechercher',
                hintText: "Tapez le nom de l'utilisateur" ,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => fetchUsers(query: value),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(userId: user['_id']),
                ),
              );
            },
          );
        },
      ),
    );
  }

} */

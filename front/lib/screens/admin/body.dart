import 'package:flutter/material.dart';
import 'package:front/services/adminServices.dart';

class AdminBody extends StatefulWidget {
  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  AdminServices adminServices = AdminServices();
  int totalUsers = 0;  // Variable pour stocker le nombre total d'utilisateurs

  @override
  void initState() {
    super.initState();
    loadTotalUsers();  // Chargez le nombre total d'utilisateurs lors de l'initialisation
  }

  void loadTotalUsers() async {
    var result = await adminServices.getTotalUsers();
    if (result != null && result['totalUsers'] != null) {
      setState(() {
        totalUsers = result['totalUsers'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Admin"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            _buildStatCard('Total Utilisateurs', totalUsers.toString(), Colors.blue),
            // Ajoutez d'autres cartes de statistiques si nécessaire
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, MaterialColor color) {
    return Card(
      color: color,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
            Text(count, style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

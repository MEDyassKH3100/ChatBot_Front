import 'package:flutter/material.dart';
import 'package:front/services/adminServices.dart';

class AdminBody extends StatefulWidget {
  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  AdminServices adminServices = AdminServices();
   int totalUsers = 0;  
  int totalClients = 0;
  int totalAdmins = 0;
  int totalAttestations = 0;
  int totalReclamations = 0;
  int totalAttestationsStage = 0;

  @override
  void initState() {
    super.initState();
    loadTotalClients();
    loadTotalUsers();   
    loadTotalAdmins();
    loadTotalAttestations();
    loadTotalReclamations();
    loadTotalAttestationsStage();
    
  }

  void loadTotalClients() async {
    var result = await adminServices.getTotalClients();
    if (result != null && result.containsKey('totalClients')) {
      setState(() {
        totalClients = int.tryParse(result['totalClients'].toString()) ?? 0;
      });
    }
  }
  void loadTotalUsers() async {
    var result = await adminServices.getTotalUsers();
    if (result != null && result.containsKey('totalUsers')) {
      setState(() {
        totalUsers = int.tryParse(result['totalUsers'].toString()) ?? 0;
      });
    }
  }
  void loadTotalAdmins() async {
    var result = await adminServices.getTotalAdmins();
    if (result != null && result.containsKey('totalAdmins')) {
      setState(() {
        totalAdmins = int.tryParse(result['totalAdmins'].toString()) ?? 0;
      });
    }
  }
  void loadTotalAttestations() async {
    var result = await adminServices.getTotalAttestations();
    if (result != null && result.containsKey('totalAttestations')) {
      setState(() {
        totalAttestations = int.tryParse(result['totalAttestations'].toString()) ?? 0;
      });
    }
  }
  void loadTotalReclamations() async {
    var result = await adminServices.getTotalReclamations();
    if (result != null && result.containsKey('totalReclamations')) {
      setState(() {
        totalReclamations = int.tryParse(result['totalReclamations'].toString()) ?? 0;
      });
    }
  }
  void loadTotalAttestationsStage() async {
    var result = await adminServices.getTotalAttestationStage();
    if (result != null && result.containsKey('totalAttestationsStage')) {
      setState(() {
        totalAttestationsStage = int.tryParse(result['totalAttestationsStage'].toString()) ?? 0;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildStatCard('Total Clients', totalClients.toString(), Colors.purple),
          _buildStatCard('Total Users', totalUsers.toString(), Colors.purple),
          _buildStatCard('Total Admins', totalAdmins.toString(), Colors.purple),
          _buildStatCard('Total Attestations', totalAttestations.toString(), Colors.purple),
          _buildStatCard('Total Reclamations', totalReclamations.toString(), Colors.purple),
          _buildStatCard('Total Attestations Stage', totalAttestationsStage.toString(), Colors.purple),
          // Bouton pour naviguer vers UserScreen
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/userScreen');
            },
            child: Text('Gérer les Utilisateurs'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.purple, // foreground
            ),
          ),
          // Bouton pour naviguer vers AttestationScreen
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/attestationScreen');
            },
            child: Text('Gérer les Attestations'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.purple, // foreground
            ),
          ),
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

























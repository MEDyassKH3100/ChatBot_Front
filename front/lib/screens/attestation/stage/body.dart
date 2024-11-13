import 'package:flutter/material.dart';
import 'package:front/services/apiServices.dart';

class ATStageBody extends StatefulWidget {
  const ATStageBody({super.key});

  @override
  _ATStageBodyState createState() => _ATStageBodyState();
}

class _ATStageBodyState extends State<ATStageBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  ApiService apiService = ApiService();

  Future<void> _submitStageRequest() async {
    Map<String, dynamic> requestData = {
      "fullName": fullNameController.text,
      "course": courseController.text,
      "year": yearController.text
    };
    bool success = await apiService.generateStageRequestPDF(requestData);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('PDF généré avec succès et téléchargé')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Échec de la génération du PDF')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Nom Complet'),
            ),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(labelText: 'Cours'),
            ),
            TextField(
              controller: yearController,
              decoration: const InputDecoration(labelText: 'Année Académique'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitStageRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Demander'),
            ),
          ],
        ),
      ),
    );
  }
}

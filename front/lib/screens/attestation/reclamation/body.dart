import 'package:flutter/material.dart';
import 'package:front/models/Attestation.dart';
import 'package:front/services/apiServices.dart';

class ReclamationBody extends StatefulWidget {
  const ReclamationBody({super.key});

  @override
  _ReclamationBodyState createState() => _ReclamationBodyState();
}

class _ReclamationBodyState extends State<ReclamationBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  ApiService apiService = ApiService();

  Future<void> _submitReclamation() async {
  Attestation newAttestation = Attestation(
    fullName: fullNameController.text,
    type: "Reclamation",
    course: courseController.text,
    year: yearController.text,
    additionalDetails: detailsController.text,
  );
  var result = await apiService.createAttestation(newAttestation);
  if (result != null) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Réclamation créée avec succès')));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Échec de la création de la réclamation')));
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
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(labelText: 'Détails Supplémentaires'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReclamation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
